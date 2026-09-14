import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../../core/storage/app_database.dart';

final watchlistStreamProvider = StreamProvider<List<WatchlistEntry>>((ref) {
  final libraryRepo = ref.watch(userLibraryRepositoryProvider);
  return libraryRepo.watchWatchlist();
});

final favoritesStreamProvider = StreamProvider<List<FavoriteEntry>>((ref) {
  final libraryRepo = ref.watch(userLibraryRepositoryProvider);
  return libraryRepo.watchFavorites();
});

final watchHistoryFutureProvider = FutureProvider<List<WatchHistoryEntry>>((ref) {
  final libraryRepo = ref.watch(userLibraryRepositoryProvider);
  return libraryRepo.getWatchHistory();
});
