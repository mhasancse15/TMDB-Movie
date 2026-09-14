import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_verse/core/theme/app_colors.dart';
import 'package:movie_verse/core/theme/app_radius.dart';
import 'package:movie_verse/core/theme/app_spacing.dart';
import 'package:movie_verse/core/theme/app_text_styles.dart';
import 'package:movie_verse/features/settings/presentation/notifiers/settings_notifier.dart';
import 'package:movie_verse/features/watchlist/presentation/notifiers/watchlist_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final watchlistAsync = ref.watch(watchlistStreamProvider);
    final favoritesAsync = ref.watch(favoritesStreamProvider);

    final watchlistCount = watchlistAsync.valueOrNull?.length ?? 0;
    final favoritesCount = favoritesAsync.valueOrNull?.length ?? 0;

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SingleChildScrollView(
        padding: AppSpacing.paddingMd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Header Card
            Container(
              padding: AppSpacing.paddingMd,
              decoration: BoxDecoration(
                color: AppColors.darkCard,
                borderRadius: AppRadius.borderLg,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 36,
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person_rounded, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Cinephile User', style: AppTextStyles.titleLarge),
                        const SizedBox(height: 4),
                        Text('MovieVerse Premium Member', style: AppTextStyles.caption.copyWith(color: AppColors.secondary)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Statistics Row
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: 'Watchlist',
                    value: '$watchlistCount',
                    icon: Icons.bookmark_rounded,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    title: 'Favorites',
                    value: '$favoritesCount',
                    icon: Icons.favorite_rounded,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text('Settings & Preferences', style: AppTextStyles.titleLarge),
            const SizedBox(height: 12),

            // Theme Setting
            ListTile(
              leading: const Icon(Icons.brightness_6_rounded, color: AppColors.primary),
              title: const Text('Theme Mode'),
              subtitle: Text('Current: ${settings.themeMode.name.toUpperCase()}'),
              trailing: DropdownButton<ThemeMode>(
                value: settings.themeMode,
                underline: const SizedBox(),
                items: const [
                  DropdownMenuItem(value: ThemeMode.system, child: Text('System')),
                  DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
                  DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    ref.read(settingsNotifierProvider.notifier).setThemeMode(val);
                  }
                },
              ),
            ),
            const Divider(color: AppColors.darkBorder),

            // Autoplay Trailers
            SwitchListTile(
              secondary: const Icon(Icons.play_circle_fill_rounded, color: AppColors.primary),
              title: const Text('Autoplay Trailers'),
              subtitle: const Text('Automatically buffer YouTube trailers in details'),
              value: settings.autoPlayTrailers,
              onChanged: (val) {
                ref.read(settingsNotifierProvider.notifier).toggleAutoPlayTrailers(val);
              },
            ),
            const Divider(color: AppColors.darkBorder),

            // App Version Info
            const ListTile(
              leading: Icon(Icons.info_outline_rounded, color: AppColors.textSecondaryDark),
              title: Text('MovieVerse Version'),
              subtitle: Text('v1.0.0 (Production Build)'),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingMd,
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: AppRadius.borderMd,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.displayMedium),
          const SizedBox(height: 2),
          Text(title, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}
