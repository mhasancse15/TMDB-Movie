import '../../../../core/error/failures.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/tmdb_api_service.dart';
import '../../../genres/domain/models/genre.dart';
import '../../../movies/domain/models/movie.dart';
import '../../domain/repositories/discover_repository.dart';

class DiscoverRepositoryImpl implements DiscoverRepository {
  final TmdbApiService _apiService;

  DiscoverRepositoryImpl({required TmdbApiService apiService}) : _apiService = apiService;

  @override
  Future<ApiResult<List<Genre>>> getMovieGenres() async {
    try {
      final genres = await _apiService.getMovieGenres();
      return ApiResult.success(genres);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }

  @override
  Future<ApiResult<List<Movie>>> discoverMovies({
    required Map<String, dynamic> filters,
    int page = 1,
  }) async {
    try {
      final movies = await _apiService.discoverMovies(filters: filters, page: page);
      return ApiResult.success(movies);
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
