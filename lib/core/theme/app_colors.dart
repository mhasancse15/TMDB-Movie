import 'package:flutter/material.dart';

abstract class AppColors {
  // Dark Theme Base (Default Cinema Aesthetics)
  static const Color darkBackground = Color(0xFF0F0F14);
  static const Color darkSurface = Color(0xFF181824);
  static const Color darkCard = Color(0xFF222232);
  static const Color darkBorder = Color(0xFF2E2E42);

  // Light Theme Base
  static const Color lightBackground = Color(0xFFF7F8FC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFF0F2F8);
  static const Color lightBorder = Color(0xFFE2E4EE);

  // Accent & Brand Colors
  static const Color primary = Color(0xFFE50914); // Cinema Crimson Red
  static const Color primaryVariant = Color(0xFFB81D24);
  static const Color secondary = Color(0xFFFFB800); // Gold Star / Rating Yellow
  static const Color secondaryVariant = Color(0xFFE0A200);

  // Status & Utility Colors
  static const Color success = Color(0xFF00C853);
  static const Color info = Color(0xFF29B6F6);
  static const Color warning = Color(0xFFFF9100);
  static const Color error = Color(0xFFFF3D00);

  // Neutral Colors
  static const Color textPrimaryDark = Color(0xFFF1F1F5);
  static const Color textSecondaryDark = Color(0xFFA0A0B2);
  static const Color textPrimaryLight = Color(0xFF111118);
  static const Color textSecondaryLight = Color(0xFF68687B);

  // Shimmer Effect Colors
  static const Color shimmerBaseDark = Color(0xFF1E1E2C);
  static const Color shimmerHighlightDark = Color(0xFF2C2C3F);
  static const Color shimmerBaseLight = Color(0xFFE0E2EE);
  static const Color shimmerHighlightLight = Color(0xFFF5F6FC);
}
