import '../../../../core/storage/app_database.dart';

abstract class UserLibraryRepository {
  Future<List<WatchlistEntry>> getWatchlist();
  Stream<List<WatchlistEntry>> watchWatchlist();
  Future<bool> isInWatchlist(int id, String mediaType);
  Future<void> addToWatchlist({
    required int id,
    required String title,
    String? posterPath,
    String? backdropPath,
    required double voteAverage,
    required String releaseDate,
    String mediaType = 'movie',
  });
  Future<void> removeFromWatchlist(int id, String mediaType);

  Future<List<FavoriteEntry>> getFavorites();
  Stream<List<FavoriteEntry>> watchFavorites();
  Future<bool> isFavorite(int id, String mediaType);
  Future<void> addToFavorites({
    required int id,
    required String title,
    String? posterPath,
    String? backdropPath,
    required double voteAverage,
    required String releaseDate,
    String mediaType = 'movie',
  });
  Future<void> removeFromFavorites(int id, String mediaType);

  Future<List<WatchHistoryEntry>> getWatchHistory();
  Future<void> addToWatchHistory({
    required int id,
    required String title,
    String? posterPath,
    String mediaType = 'movie',
  });
}
