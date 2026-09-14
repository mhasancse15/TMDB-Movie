import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../domain/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  String get title {
    if (movie.title.trim().isEmpty) {
      return 'Unknown Title';
    }
    return movie.title;
  }

  String get year {
    if (movie.releaseDate.isEmpty ||
        movie.releaseDate.length < 4) {
      return 'Unknown Year';
    }

    return movie.releaseDate.substring(0, 4);
  }

  String get rating {
    if (movie.voteAverage <= 0) {
      return 'N/A';
    }

    return movie.voteAverage.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final cardWidth = constraints.maxWidth;

          final posterHeight = cardWidth * 1.5;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'movie_poster_${movie.id}',
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: AppRadius.borderMd,
                      child: movie.posterPath?.isNotEmpty == true
                          ? CachedMovieImage(
                        imagePath: movie.posterPath,
                        width: double.infinity,
                        height: posterHeight,
                      )
                          : Container(
                        width: double.infinity,
                        height: posterHeight,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: AppRadius.borderMd,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.movie,
                            color: Colors.white54,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius:
                          BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: 12,
                              color: AppColors.secondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.titleMedium.copyWith(
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                year,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption.copyWith(
                  fontSize: 11,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}