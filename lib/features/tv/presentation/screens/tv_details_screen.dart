import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../notifiers/tv_details_notifier.dart';

class TVDetailsScreen extends ConsumerWidget {
  final int tvId;

  const TVDetailsScreen({super.key, required this.tvId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(tvDetailsNotifierProvider(tvId));

    return Scaffold(
      body: stateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => ErrorView(
          message: err.toString(),
          onRetry: () => ref.read(tvDetailsNotifierProvider(tvId).notifier).loadDetails(tvId),
        ),
        data: (state) {
          final details = state.details;
          if (details == null) {
            return const ErrorView(message: 'TV series details not available');
          }

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: AppColors.darkBackground,
                actions: [
                  IconButton(
                    icon: Icon(
                      state.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: state.isFavorite ? AppColors.primary : Colors.white,
                    ),
                    onPressed: () =>
                        ref.read(tvDetailsNotifierProvider(tvId).notifier).toggleFavorite(),
                  ),
                  IconButton(
                    icon: Icon(
                      state.isInWatchlist ? Icons.bookmark_added_rounded : Icons.bookmark_add_outlined,
                      color: state.isInWatchlist ? AppColors.secondary : Colors.white,
                    ),
                    onPressed: () =>
                        ref.read(tvDetailsNotifierProvider(tvId).notifier).toggleWatchlist(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share_rounded, color: Colors.white),
                    onPressed: () => Share.share('Check out "${details.name}" on MovieVerse!'),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedBackdropImage(
                        imagePath: details.backdropPath ?? details.posterPath,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              AppColors.darkBackground.withValues(alpha: 0.95),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: AppSpacing.paddingMd,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'tv_poster_${details.id}',
                            child: CachedMovieImage(
                              imagePath: details.posterPath,
                              width: 110,
                              height: 165,
                              borderRadius: AppRadius.borderMd,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(details.name, style: AppTextStyles.displayMedium),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(Icons.star_rounded, color: AppColors.secondary, size: 18),
                                    const SizedBox(width: 4),
                                    Text(
                                      AppFormatters.formatRating(details.voteAverage),
                                      style: AppTextStyles.titleMedium,
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      '${details.numberOfSeasons} Seasons • ${details.numberOfEpisodes} Episodes',
                                      style: AppTextStyles.caption,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 6,
                                  runSpacing: 6,
                                  children: details.genres
                                      .map((g) => Chip(
                                            label: Text(g.name),
                                            padding: EdgeInsets.zero,
                                            visualDensity: VisualDensity.compact,
                                          ))
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('Overview', style: AppTextStyles.titleLarge),
                      const SizedBox(height: 8),
                      Text(
                        details.overview.isNotEmpty ? details.overview : 'No overview available.',
                        style: AppTextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 24),

                      // Seasons Rail
                      if (details.seasons.isNotEmpty) ...[
                        const SectionHeader(title: 'Seasons'),
                        SizedBox(
                          height: 140,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: details.seasons.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final season = details.seasons[index];
                              return SizedBox(
                                width: 90,
                                child: Column(
                                  children: [
                                    CachedMovieImage(
                                      imagePath: season.posterPath,
                                      width: 90,
                                      height: 110,
                                      borderRadius: AppRadius.borderSm,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      season.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.caption.copyWith(fontSize: 11),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
