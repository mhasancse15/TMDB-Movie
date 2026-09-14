import 'package:drift/drift.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/tmdb_api_service.dart';
import '../../../../core/storage/app_database.dart';
import '../../domain/models/media_cast.dart';
import '../../domain/models/movie.dart';
import '../../domain/models/movie_details.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final TmdbApiService _apiService;
  final AppDatabase _database;
  final NetworkInfo _networkInfo;

  MovieRepositoryImpl({
    required TmdbApiService apiService,
    required AppDatabase database,
    required NetworkInfo networkInfo,
  })  : _apiService = apiService,
        _database = database,
        _networkInfo = networkInfo;

  @override
  Future<ApiResult<List<Movie>>> getTrendingMovies({int page = 1}) async {
    return _fetchOrCache('trending', page, () => _apiService.getTrendingMovies(page: page));
  }

  @override
  Future<ApiResult<List<Movie>>> getPopularMovies({int page = 1}) async {
    return _fetchOrCache('popular', page, () => _apiService.getPopularMovies(page: page));
  }

  @override
  Future<ApiResult<List<Movie>>> getTopRatedMovies({int page = 1}) async {
    return _fetchOrCache('top_rated', page, () => _apiService.getTopRatedMovies(page: page));
  }

  @override
  Future<ApiResult<List<Movie>>> getNowPlayingMovies({int page = 1}) async {
    return _fetchOrCache('now_playing', page, () => _apiService.getNowPlayingMovies(page: page));
  }

  @override
  Future<ApiResult<List<Movie>>> getUpcomingMovies({int page = 1}) async {
    return _fetchOrCache('upcoming', page, () => _apiService.getUpcomingMovies(page: page));
  }

  @override
  Future<ApiResult<MovieDetails>> getMovieDetails(int id) async {
    try {
      final details = await _apiService.getMovieDetails(id);
      return ApiResult.success(details);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<MediaCast>>> getMovieCast(int id) async {
    try {
      final cast = await _apiService.getMovieCast(id);
      return ApiResult.success(cast);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<MediaVideo>>> getMovieVideos(int id) async {
    try {
      final videos = await _apiService.getMovieVideos(id);
      return ApiResult.success(videos);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Movie>>> getSimilarMovies(int id) async {
    try {
      final similar = await _apiService.getSimilarMovies(id);
      return ApiResult.success(similar);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  Future<ApiResult<List<Movie>>> _fetchOrCache(
    String category,
    int page,
    Future<List<Movie>> Function() remoteFetch,
  ) async {
    final isOnline = await _networkInfo.isConnected;
    if (isOnline) {
      try {
        final movies = await remoteFetch();
        if (page == 1) {
          final entries = movies.map((m) => CachedMediaEntriesCompanion.insert(
                id: m.id,
                title: m.title,
                overview: m.overview,
                posterPath: Value(m.posterPath),
                backdropPath: Value(m.backdropPath),
                voteAverage: m.voteAverage,
                releaseDate: m.releaseDate,
                category: category,
                mediaType: const Value('movie'),
              )).toList();
          await _database.saveCachedMedia(entries);
        }
        return ApiResult.success(movies);
      } catch (e) {
        return _fallbackToCache(category, e.toString());
      }
    } else {
      return _fallbackToCache(category, 'No internet connection. Displaying cached data.');
    }
  }

  Future<ApiResult<List<Movie>>> _fallbackToCache(String category, String errorMessage) async {
    final cached = await _database.getCachedMedia(category);
    if (cached.isNotEmpty) {
      final movies = cached
          .map((c) => Movie(
                id: c.id,
                title: c.title,
                overview: c.overview,
                posterPath: c.posterPath,
                backdropPath: c.backdropPath,
                voteAverage: c.voteAverage,
                voteCount: 0,
                releaseDate: c.releaseDate,
              ))
          .toList();
      return ApiResult.success(movies);
    }
    return ApiResult.failure(NetworkFailure(errorMessage));
  }
}
