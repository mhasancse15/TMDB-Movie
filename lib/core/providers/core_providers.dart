import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/tmdb_api_service.dart';
import '../storage/app_database.dart';
import '../storage/preferences_service.dart';
import '../../features/movies/domain/repositories/movie_repository.dart';
import '../../features/movies/data/repositories/movie_repository_impl.dart';
import '../../features/tv/domain/repositories/tv_repository.dart';
import '../../features/tv/data/repositories/tv_repository_impl.dart';
import '../../features/search/domain/repositories/search_repository.dart';
import '../../features/search/data/repositories/search_repository_impl.dart';
import '../../features/discover/domain/repositories/discover_repository.dart';
import '../../features/discover/data/repositories/discover_repository_impl.dart';
import '../../features/people/domain/repositories/people_repository.dart';
import '../../features/people/data/repositories/people_repository_impl.dart';
import '../../features/watchlist/domain/repositories/user_library_repository.dart';
import '../../features/watchlist/data/repositories/user_library_repository_impl.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Initialize via ProviderScope override in main.dart');
});

final preferencesServiceProvider = Provider<PreferencesService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return PreferencesService(prefs);
});

final dioClientProvider = Provider<DioClient>((ref) => DioClient());

final tmdbApiServiceProvider = Provider<TmdbApiService>((ref) {
  final client = ref.watch(dioClientProvider);
  return TmdbApiService(client.dio);
});

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final networkInfoProvider = Provider<NetworkInfo>((ref) => NetworkInfoImpl());

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRepositoryImpl(
    apiService: ref.watch(tmdbApiServiceProvider),
    database: ref.watch(appDatabaseProvider),
    networkInfo: ref.watch(networkInfoProvider),
  );
});

final tvRepositoryProvider = Provider<TVRepository>((ref) {
  return TVRepositoryImpl(
    apiService: ref.watch(tmdbApiServiceProvider),
  );
});

final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  return SearchRepositoryImpl(
    apiService: ref.watch(tmdbApiServiceProvider),
    database: ref.watch(appDatabaseProvider),
  );
});

final discoverRepositoryProvider = Provider<DiscoverRepository>((ref) {
  return DiscoverRepositoryImpl(
    apiService: ref.watch(tmdbApiServiceProvider),
  );
});

final peopleRepositoryProvider = Provider<PeopleRepository>((ref) {
  return PeopleRepositoryImpl(
    apiService: ref.watch(tmdbApiServiceProvider),
  );
});

final userLibraryRepositoryProvider = Provider<UserLibraryRepository>((ref) {
  return UserLibraryRepositoryImpl(
    database: ref.watch(appDatabaseProvider),
  );
});
