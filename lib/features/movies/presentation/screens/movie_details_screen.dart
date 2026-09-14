import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/models/media_cast.dart';
import '../notifiers/movie_details_notifier.dart';

class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateAsync = ref.watch(movieDetailsNotifierProvider(movieId));

    return Scaffold(
      body: stateAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => ErrorView(
          message: err.toString(),
          onRetry: () => ref.read(movieDetailsNotifierProvider(movieId).notifier).loadDetails(movieId),
        ),
        data: (state) {
          final details = state.details;
          if (details == null) {
            return const ErrorView(message: 'Movie details not available');
          }

          final trailerVideo = state.videos.firstWhere(
            (v) => v.site == 'YouTube' && v.type == 'Trailer',
            orElse: () => state.videos.isNotEmpty
                ? state.videos.first
                : const MediaVideo(id: '', key: '', name: '', site: '', type: ''),
          );

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 320,
                pinned: true,
                backgroundColor: AppColors.darkBackground,
                actions: [
                  IconButton(
                    icon: Icon(
                      state.isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: state.isFavorite ? AppColors.primary : Colors.white,
                    ),
                    onPressed: () =>
                        ref.read(movieDetailsNotifierProvider(movieId).notifier).toggleFavorite(),
                  ),
                  IconButton(
                    icon: Icon(
                      state.isInWatchlist ? Icons.bookmark_added_rounded : Icons.bookmark_add_outlined,
                      color: state.isInWatchlist ? AppColors.secondary : Colors.white,
                    ),
                    onPressed: () =>
                        ref.read(movieDetailsNotifierProvider(movieId).notifier).toggleWatchlist(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share_rounded, color: Colors.white),
                    onPressed: () {
                      Share.share('Check out "${details.title}" on MovieVerse!');
                    },
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
                            tag: 'movie_poster_${details.id}',
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
                                Text(
                                  details.title,
                                  style: AppTextStyles.displayMedium,
                                ),
                                if (details.tagline != null && details.tagline!.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    '"${details.tagline}"',
                                    style: AppTextStyles.caption.copyWith(fontStyle: FontStyle.italic),
                                  ),
                                ],
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
                                    const Icon(Icons.timer_outlined, size: 16, color: AppColors.textSecondaryDark),
                                    const SizedBox(width: 4),
                                    Text(
                                      AppFormatters.formatRuntime(details.runtime),
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

                      // Trailer button if key exists
                      if (trailerVideo.key.isNotEmpty)
                        ElevatedButton.icon(
                          onPressed: () => _openTrailerDialog(context, trailerVideo.key),
                          icon: const Icon(Icons.play_arrow_rounded),
                          label: const Text('Watch Official Trailer'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(borderRadius: AppRadius.borderMd),
                          ),
                        ),

                      const SizedBox(height: 20),
                      const Text('Overview', style: AppTextStyles.titleLarge),
                      const SizedBox(height: 8),
                      Text(
                        details.overview.isNotEmpty ? details.overview : 'No overview available.',
                        style: AppTextStyles.bodyLarge,
                      ),
                      const SizedBox(height: 24),

                      // Cast Section
                      if (state.cast.isNotEmpty) ...[
                        const SectionHeader(title: 'Top Cast'),
                        SizedBox(
                          height: 110,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.cast.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final member = state.cast[index];
                              return SizedBox(
                                width: 70,
                                child: Column(
                                  children: [
                                    CachedProfileImage(imagePath: member.profilePath, radius: 28),
                                    const SizedBox(height: 6),
                                    Text(
                                      member.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.caption.copyWith(fontSize: 10),
                                      textAlign: TextAlign.center,
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

  void _openTrailerDialog(BuildContext context, String videoKey) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoKey,
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.black,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: YoutubePlayer(controller: controller),
        ),
      ),
    );
  }
}
