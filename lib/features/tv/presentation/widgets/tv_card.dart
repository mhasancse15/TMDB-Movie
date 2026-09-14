import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../domain/models/tv_show.dart';

class TVCard extends StatelessWidget {
  final TVShow tvShow;
  final VoidCallback onTap;
  final double width;
  final double height;

  const TVCard({
    super.key,
    required this.tvShow,
    required this.onTap,
    this.width = 130,
    this.height = 190,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: 'tv_poster_${tvShow.id}',
              child: Stack(
                children: [
                  CachedMovieImage(
                    imagePath: tvShow.posterPath,
                    width: width,
                    height: height,
                    borderRadius: AppRadius.borderMd,
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.75),
                        borderRadius: AppRadius.borderSm,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, color: AppColors.secondary, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            tvShow.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
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
            const SizedBox(height: 6),
            Text(
              tvShow.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.titleMedium.copyWith(fontSize: 13),
            ),
            const SizedBox(height: 2),
            Text(
              tvShow.firstAirDate.length >= 4 ? tvShow.firstAirDate.substring(0, 4) : 'N/A',
              style: AppTextStyles.caption.copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
