import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class WatchlistEntries extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  RealColumn get voteAverage => real()();
  TextColumn get releaseDate => text()();
  TextColumn get mediaType => text().withDefault(const Constant('movie'))();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id, mediaType};
}

class FavoriteEntries extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  RealColumn get voteAverage => real()();
  TextColumn get releaseDate => text()();
  TextColumn get mediaType => text().withDefault(const Constant('movie'))();
  DateTimeColumn get addedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id, mediaType};
}

class WatchHistoryEntries extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get mediaType => text().withDefault(const Constant('movie'))();
  DateTimeColumn get watchedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id, mediaType};
}

class CachedMediaEntries extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get overview => text()();
  TextColumn get posterPath => text().nullable()();
  TextColumn get backdropPath => text().nullable()();
  RealColumn get voteAverage => real()();
  TextColumn get releaseDate => text()();
  TextColumn get category => text()(); // e.g. 'trending', 'popular', 'top_rated'
  TextColumn get mediaType => text().withDefault(const Constant('movie'))();
  DateTimeColumn get cachedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id, category, mediaType};
}

class SearchHistoryEntries extends Table {
  TextColumn get query => text()();
  DateTimeColumn get searchedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {query};
}

@DriftDatabase(tables: [
  WatchlistEntries,
  FavoriteEntries,
  WatchHistoryEntries,
  CachedMediaEntries,
  SearchHistoryEntries,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // Watchlist Helpers
  Future<List<WatchlistEntry>> getWatchlist() => select(watchlistEntries).get();
  Stream<List<WatchlistEntry>> watchWatchlist() => select(watchlistEntries).watch();
  Future<bool> isInWatchlist(int id, String mediaType) async {
    final query = select(watchlistEntries)
      ..where((tbl) => tbl.id.equals(id) & tbl.mediaType.equals(mediaType));
    final item = await query.getSingleOrNull();
    return item != null;
  }

  Future<int> addToWatchlist(WatchlistEntriesCompanion entry) =>
      into(watchlistEntries).insertOnConflictUpdate(entry);

  Future<int> removeFromWatchlist(int id, String mediaType) =>
      (delete(watchlistEntries)..where((tbl) => tbl.id.equals(id) & tbl.mediaType.equals(mediaType))).go();

  // Favorites Helpers
  Future<List<FavoriteEntry>> getFavorites() => select(favoriteEntries).get();
  Stream<List<FavoriteEntry>> watchFavorites() => select(favoriteEntries).watch();
  Future<bool> isFavorite(int id, String mediaType) async {
    final query = select(favoriteEntries)
      ..where((tbl) => tbl.id.equals(id) & tbl.mediaType.equals(mediaType));
    final item = await query.getSingleOrNull();
    return item != null;
  }

  Future<int> addToFavorites(FavoriteEntriesCompanion entry) =>
      into(favoriteEntries).insertOnConflictUpdate(entry);

  Future<int> removeFromFavorites(int id, String mediaType) =>
      (delete(favoriteEntries)..where((tbl) => tbl.id.equals(id) & tbl.mediaType.equals(mediaType))).go();

  // History Helpers
  Future<List<WatchHistoryEntry>> getWatchHistory() => (select(watchHistoryEntries)
        ..orderBy([(t) => OrderingTerm.desc(t.watchedAt)]))
      .get();

  Future<int> addToWatchHistory(WatchHistoryEntriesCompanion entry) =>
      into(watchHistoryEntries).insertOnConflictUpdate(entry);

  // Cached Media Helpers
  Future<List<CachedMediaEntry>> getCachedMedia(String category) =>
      (select(cachedMediaEntries)..where((tbl) => tbl.category.equals(category))).get();

  Future<void> saveCachedMedia(List<CachedMediaEntriesCompanion> entries) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(cachedMediaEntries, entries);
    });
  }

  // Search History Helpers
  Future<List<String>> getRecentSearches() async {
    final query = select(searchHistoryEntries)
      ..orderBy([(t) => OrderingTerm.desc(t.searchedAt)])
      ..limit(10);
    final results = await query.get();
    return results.map((e) => e.query).toList();
  }

  Future<void> addSearchQuery(String query) async {
    if (query.trim().isEmpty) return;
    await into(searchHistoryEntries).insertOnConflictUpdate(
      SearchHistoryEntriesCompanion.insert(
        query: query.trim(),
        searchedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> clearSearchHistory() => delete(searchHistoryEntries).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movie_verse.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
