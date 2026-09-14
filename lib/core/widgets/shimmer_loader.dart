import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? AppColors.shimmerBaseDark : AppColors.shimmerBaseLight,
      highlightColor: isDark ? AppColors.shimmerHighlightDark : AppColors.shimmerHighlightLight,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: borderRadius ?? AppRadius.borderMd,
        ),
      ),
    );
  }
}

class MovieCardShimmer extends StatelessWidget {
  final double width;
  final double height;

  const MovieCardShimmer({
    super.key,
    this.width = 130,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBox(width: width, height: height, borderRadius: AppRadius.borderMd),
        const SizedBox(height: 8),
        ShimmerBox(width: width * 0.8, height: 14),
        const SizedBox(height: 4),
        ShimmerBox(width: width * 0.4, height: 10),
      ],
    );
  }
}
