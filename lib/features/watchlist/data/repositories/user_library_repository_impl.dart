import 'package:drift/drift.dart';
import '../../../../core/storage/app_database.dart';
import '../../domain/repositories/user_library_repository.dart';

class UserLibraryRepositoryImpl implements UserLibraryRepository {
  final AppDatabase _database;

  UserLibraryRepositoryImpl({required AppDatabase database}) : _database = database;

  @override
  Future<List<WatchlistEntry>> getWatchlist() => _database.getWatchlist();

  @override
  Stream<List<WatchlistEntry>> watchWatchlist() => _database.watchWatchlist();

  @override
  Future<bool> isInWatchlist(int id, String mediaType) => _database.isInWatchlist(id, mediaType);

  @override
  Future<void> addToWatchlist({
    required int id,
    required String title,
    String? posterPath,
    String? backdropPath,
    required double voteAverage,
    required String releaseDate,
    String mediaType = 'movie',
  }) async {
    await _database.addToWatchlist(
      WatchlistEntriesCompanion.insert(
        id: id,
        title: title,
        posterPath: Value(posterPath),
        backdropPath: Value(backdropPath),
        voteAverage: voteAverage,
        releaseDate: releaseDate,
        mediaType: Value(mediaType),
      ),
    );
  }

  @override
  Future<void> removeFromWatchlist(int id, String mediaType) =>
      _database.removeFromWatchlist(id, mediaType);

  @override
  Future<List<FavoriteEntry>> getFavorites() => _database.getFavorites();

  @override
  Stream<List<FavoriteEntry>> watchFavorites() => _database.watchFavorites();

  @override
  Future<bool> isFavorite(int id, String mediaType) => _database.isFavorite(id, mediaType);

  @override
  Future<void> addToFavorites({
    required int id,
    required String title,
    String? posterPath,
    String? backdropPath,
    required double voteAverage,
    required String releaseDate,
    String mediaType = 'movie',
  }) async {
    await _database.addToFavorites(
      FavoriteEntriesCompanion.insert(
        id: id,
        title: title,
        posterPath: Value(posterPath),
        backdropPath: Value(backdropPath),
        voteAverage: voteAverage,
        releaseDate: releaseDate,
        mediaType: Value(mediaType),
      ),
    );
  }

  @override
  Future<void> removeFromFavorites(int id, String mediaType) =>
      _database.removeFromFavorites(id, mediaType);

  @override
  Future<List<WatchHistoryEntry>> getWatchHistory() => _database.getWatchHistory();

  @override
  Future<void> addToWatchHistory({
    required int id,
    required String title,
    String? posterPath,
    String mediaType = 'movie',
  }) async {
    await _database.addToWatchHistory(
      WatchHistoryEntriesCompanion.insert(
        id: id,
        title: title,
        posterPath: Value(posterPath),
        mediaType: Value(mediaType),
      ),
    );
  }
}
