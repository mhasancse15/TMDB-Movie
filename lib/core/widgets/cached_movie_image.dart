import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/api_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import 'shimmer_loader.dart';

class CachedMovieImage extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CachedMovieImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext meContext) {
    final url = imagePath != null && imagePath!.isNotEmpty
        ? '${ApiConstants.posterUrlMedium}$imagePath'
        : null;

    final effectiveRadius = borderRadius ?? AppRadius.borderMd;

    if (url == null) {
      return ClipRRect(
        borderRadius: effectiveRadius,
        child: Container(
          width: width,
          height: height,
          color: AppColors.darkCard,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie_outlined, color: AppColors.textSecondaryDark, size: 32),
              SizedBox(height: 4),
              Text(
                'No Image',
                style: TextStyle(color: AppColors.textSecondaryDark, fontSize: 10),
              ),
            ],
          ),
        ),
      );
    }

    return ClipRRect(
      borderRadius: effectiveRadius,
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: fit,
        placeholder: (context, url) => ShimmerBox(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          borderRadius: effectiveRadius,
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: AppColors.darkCard,
          child: const Icon(Icons.broken_image_outlined, color: AppColors.textSecondaryDark),
        ),
      ),
    );
  }
}

class CachedBackdropImage extends StatelessWidget {
  final String? imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;

  const CachedBackdropImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final url = imagePath != null && imagePath!.isNotEmpty
        ? '${ApiConstants.backdropUrlMedium}$imagePath'
        : null;

    if (url == null) {
      return Container(
        width: width,
        height: height,
        color: AppColors.darkCard,
        child: const Icon(Icons.image_not_supported_outlined, color: AppColors.textSecondaryDark, size: 48),
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => ShimmerBox(
        width: width ?? double.infinity,
        height: height ?? double.infinity,
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: AppColors.darkCard,
        child: const Icon(Icons.broken_image_outlined, color: AppColors.textSecondaryDark),
      ),
    );
  }
}

class CachedProfileImage extends StatelessWidget {
  final String? imagePath;
  final double radius;

  const CachedProfileImage({
    super.key,
    required this.imagePath,
    this.radius = 30.0,
  });

  @override
  Widget build(BuildContext context) {
    final url = imagePath != null && imagePath!.isNotEmpty
        ? '${ApiConstants.profileUrlSmall}$imagePath'
        : null;

    if (url == null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.darkCard,
        child: Icon(Icons.person, color: AppColors.textSecondaryDark, size: radius),
      );
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.darkCard,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          width: radius * 2,
          height: radius * 2,
          fit: BoxFit.cover,
          placeholder: (context, url) => ShimmerBox(
            width: radius * 2,
            height: radius * 2,
            borderRadius: BorderRadius.circular(radius),
          ),
          errorWidget: (context, url, error) => Icon(
            Icons.person,
            color: AppColors.textSecondaryDark,
            size: radius,
          ),
        ),
      ),
    );
  }
}
