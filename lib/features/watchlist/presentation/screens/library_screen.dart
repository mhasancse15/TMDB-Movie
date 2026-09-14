import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/cached_movie_image.dart';
import '../../../../core/widgets/empty_view.dart';
import '../notifiers/watchlist_notifier.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Library'),
          bottom: const TabBar(
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondaryDark,
            tabs: [
              Tab(text: 'Watchlist'),
              Tab(text: 'Favorites'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _WatchlistTab(),
            _FavoritesTab(),
            _HistoryTab(),
          ],
        ),
      ),
    );
  }
}

class _WatchlistTab extends ConsumerWidget {
  const _WatchlistTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistAsync = ref.watch(watchlistStreamProvider);

    return watchlistAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (items) {
        if (items.isEmpty) {
          return const EmptyView(
            title: 'Your Watchlist is Empty',
            message: 'Save movies and TV series to watch later.',
            icon: Icons.bookmark_border_rounded,
          );
        }

        return ListView.separated(
          padding: AppSpacing.paddingMd,
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(color: AppColors.darkBorder),
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: CachedMovieImage(imagePath: item.posterPath, width: 45, height: 65),
              title: Text(item.title, style: AppTextStyles.titleMedium),
              subtitle: Text('${item.mediaType.toUpperCase()} • Rating: ${item.voteAverage}', style: AppTextStyles.caption),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                if (item.mediaType == 'movie') {
                  context.push('/movie/${item.id}');
                } else {
                  context.push('/tv/${item.id}');
                }
              },
            );
          },
        );
      },
    );
  }
}

class _FavoritesTab extends ConsumerWidget {
  const _FavoritesTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favAsync = ref.watch(favoritesStreamProvider);

    return favAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (items) {
        if (items.isEmpty) {
          return const EmptyView(
            title: 'No Favorites Saved',
            message: 'Tap the heart icon on any movie or TV show to save it here.',
            icon: Icons.favorite_border_rounded,
          );
        }

        return ListView.separated(
          padding: AppSpacing.paddingMd,
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(color: AppColors.darkBorder),
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: CachedMovieImage(imagePath: item.posterPath, width: 45, height: 65),
              title: Text(item.title, style: AppTextStyles.titleMedium),
              subtitle: Text('${item.mediaType.toUpperCase()} • Rating: ${item.voteAverage}', style: AppTextStyles.caption),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                if (item.mediaType == 'movie') {
                  context.push('/movie/${item.id}');
                } else {
                  context.push('/tv/${item.id}');
                }
              },
            );
          },
        );
      },
    );
  }
}

class _HistoryTab extends ConsumerWidget {
  const _HistoryTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(watchHistoryFutureProvider);

    return historyAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (items) {
        if (items.isEmpty) {
          return const EmptyView(
            title: 'No Watch History',
            message: 'Items you view will automatically appear here.',
            icon: Icons.history_rounded,
          );
        }

        return ListView.separated(
          padding: AppSpacing.paddingMd,
          itemCount: items.length,
          separatorBuilder: (_, __) => const Divider(color: AppColors.darkBorder),
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              leading: CachedMovieImage(imagePath: item.posterPath, width: 45, height: 65),
              title: Text(item.title, style: AppTextStyles.titleMedium),
              subtitle: Text('Viewed: ${item.watchedAt.toString().split('.').first}', style: AppTextStyles.caption),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                if (item.mediaType == 'movie') {
                  context.push('/movie/${item.id}');
                } else {
                  context.push('/tv/${item.id}');
                }
              },
            );
          },
        );
      },
    );
  }
}
