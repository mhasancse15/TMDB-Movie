import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../movies/domain/models/movie.dart';
import '../../../people/domain/models/person.dart';
import '../../../tv/domain/models/tv_show.dart';
import '../notifiers/search_notifier.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(searchNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        titleSpacing: 16,
        title: Container(
          height: 46,
          decoration: BoxDecoration(
            color: const Color(0xFF262626),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Movies, TV Shows, People',
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
              ),
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white70,
              ),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white70,
                ),
                onPressed: () {
                  _controller.clear();
                  setState(() {});
                  ref
                      .read(searchNotifierProvider.notifier)
                      .onQueryChanged('');
                },
              )
                  : null,
            ),
            onChanged: (value) {
              setState(() {});
              ref
                  .read(searchNotifierProvider.notifier)
                  .onQueryChanged(value);
            },
          ),
        ),
      ),
      body: state.isLoading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : state.query.isEmpty
          ? _buildEmptySearch(state)
          : _buildSearchResults(state),
    );
  }

  Widget _buildEmptySearch(SearchState state) {
    if (state.history.isEmpty) {
      return const EmptyView(
        title: "Find Your Next Favorite",
        message: "Search movies, TV shows and actors.",
        icon: Icons.search_rounded,
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Recent Searches',
          style: AppTextStyles.titleLarge,
        ),

        const SizedBox(height: 16),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: state.history.map((query) {
            return ActionChip(
              backgroundColor: const Color(0xFF1C1C1C),
              label: Text(
                query,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _controller.text = query;
                ref
                    .read(searchNotifierProvider.notifier)
                    .onQueryChanged(query);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSearchResults(SearchState state) {
    final filtered = state.results.where((item) {
      final type = item['media_type'] ?? 'movie';

      if (state.selectedFilter == 'all') {
        return true;
      }

      return type == state.selectedFilter;
    }).toList();

    if (filtered.isEmpty) {
      return const EmptyView(
        title: 'No Results',
        message: 'Try another keyword.',
        icon: Icons.search_off,
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            children: [
              _chip(state, 'All', 'all'),
              _chip(state, 'Movies', 'movie'),
              _chip(state, 'TV Shows', 'tv'),
              _chip(state, 'People', 'person'),
            ],
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: filtered.length,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.62,
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final item = filtered[index];

              final mediaType =
                  item['media_type'] as String? ?? 'movie';

              String? imagePath;

              if (mediaType == 'person') {
                imagePath = item['profile_path'];
              } else {
                imagePath = item['poster_path'];
              }

              return GestureDetector(
                onTap: () {
                  if (mediaType == 'movie') {
                    final movie = Movie.fromJson(item);
                    context.push('/movie/${movie.id}');
                  } else if (mediaType == 'tv') {
                    final tv = TVShow.fromJson(item);
                    context.push('/tv/${tv.id}');
                  } else {
                    final person = Person.fromJson(item);
                    context.push('/person/${person.id}');
                  }
                },
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: '${mediaType}_${item['id']}',
                        child: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(12),
                          child: CachedMovieImage(
                            imagePath: imagePath,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      _getTitle(item, mediaType),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _chip(
      SearchState state,
      String label,
      String value,
      ) {
    final isSelected =
        state.selectedFilter == value;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        showCheckmark: false,
        label: Text(label),
        selected: isSelected,
        onSelected: (_) {
          ref
              .read(searchNotifierProvider.notifier)
              .setFilter(value);
        },
        side: BorderSide.none,
        selectedColor: AppColors.primary,
        backgroundColor: const Color(0xFF1C1C1C),
        labelStyle: TextStyle(
          color:
          isSelected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _getTitle(
      Map<String, dynamic> item,
      String mediaType,
      ) {
    switch (mediaType) {
      case 'tv':
        return item['name'] ?? '';

      case 'person':
        return item['name'] ?? '';

      default:
        return item['title'] ?? '';
    }
  }
}