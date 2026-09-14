import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../movies/presentation/widgets/movie_card.dart';
import '../notifiers/discover_notifier.dart';

class DiscoverScreen extends ConsumerStatefulWidget {
  const DiscoverScreen({super.key});

  @override
  ConsumerState<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends ConsumerState<DiscoverScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final state = ref.read(discoverNotifierProvider);

    if (state.isLoading) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref.read(discoverNotifierProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final discoverState = ref.watch(discoverNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Movies'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_rounded,
              color: AppColors.primary,
            ),
            onPressed: () => _openFilterBottomSheet(context, discoverState),
          ),
        ],
      ),
      body: SafeArea(
        child: discoverState.movies.isEmpty && discoverState.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : discoverState.movies.isEmpty
                ? EmptyView(
                    title: 'No Movies Match Filters',
                    message:
                        'Try resetting or broadening your filter criteria.',
                    action: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(discoverNotifierProvider.notifier)
                            .applyFilters(
                              genreId: null,
                              minRating: 0,
                              sortBy: 'popularity.desc',
                            );
                      },
                      child: const Text('Reset Filters'),
                    ),
                  )
                : GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      16,
                      16,
                      16,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 700 ? 5 : 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 225,
                    ),
                    itemCount: discoverState.movies.length +
                        (discoverState.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= discoverState.movies.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final movie = discoverState.movies[index];

                      return MovieCard(
                        movie: movie,
                        onTap: () => context.push('/movie/${movie.id}'),
                      );
                    },
                  ),
      ),
    );
  }

  void _openFilterBottomSheet(BuildContext context, DiscoverState state) {
    int? tempGenreId = state.selectedGenreId;
    double tempMinRating = state.minRating;
    String tempSortBy = state.sortBy;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.darkSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.lg),
        ),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return FractionallySizedBox(
              heightFactor: 0.9,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Filter & Sort',
                            style: AppTextStyles.titleLarge,
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Genres',
                        style: AppTextStyles.titleMedium,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 140,
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: state.availableGenres.map((g) {
                              return ChoiceChip(
                                label: Text(g.name),
                                selected: tempGenreId == g.id,
                                selectedColor: AppColors.primary,
                                onSelected: (v) {
                                  setModalState(() {
                                    tempGenreId = v ? g.id : null;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Minimum Rating: ${tempMinRating.toStringAsFixed(1)}',
                      ),
                      Slider(
                        value: tempMinRating,
                        min: 0,
                        max: 10,
                        divisions: 10,
                        activeColor: AppColors.secondary,
                        onChanged: (v) {
                          setModalState(() {
                            tempMinRating = v;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Sort By',
                        style: AppTextStyles.titleMedium,
                      ),
                      RadioListTile<String>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Most Popular',
                        ),
                        value: 'popularity.desc',
                        groupValue: tempSortBy,
                        onChanged: (v) {
                          setModalState(() {
                            tempSortBy = v!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Highest Rated',
                        ),
                        value: 'vote_average.desc',
                        groupValue: tempSortBy,
                        onChanged: (v) {
                          setModalState(() {
                            tempSortBy = v!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: const Text(
                          'Release Date',
                        ),
                        value: 'release_date.desc',
                        groupValue: tempSortBy,
                        onChanged: (v) {
                          setModalState(() {
                            tempSortBy = v!;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            ref
                                .read(discoverNotifierProvider.notifier)
                                .applyFilters(
                                  genreId: tempGenreId,
                                  minRating: tempMinRating,
                                  sortBy: tempSortBy,
                                );
                          },
                          child: const Text(
                            'Apply Filters',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
