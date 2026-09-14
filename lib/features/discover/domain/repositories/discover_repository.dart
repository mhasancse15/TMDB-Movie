import '../../../../core/network/api_result.dart';
import '../../../genres/domain/models/genre.dart';
import '../../../movies/domain/models/movie.dart';

abstract class DiscoverRepository {
  Future<ApiResult<List<Genre>>> getMovieGenres();
  Future<ApiResult<List<Movie>>> discoverMovies({
    required Map<String, dynamic> filters,
    int page = 1,
  });
}
