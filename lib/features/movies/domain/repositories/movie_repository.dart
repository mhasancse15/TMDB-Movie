import '../../../../core/network/api_result.dart';
import '../models/movie.dart';
import '../models/movie_details.dart';
import '../models/media_cast.dart';

abstract class MovieRepository {
  Future<ApiResult<List<Movie>>> getTrendingMovies({int page = 1});
  Future<ApiResult<List<Movie>>> getPopularMovies({int page = 1});
  Future<ApiResult<List<Movie>>> getTopRatedMovies({int page = 1});
  Future<ApiResult<List<Movie>>> getNowPlayingMovies({int page = 1});
  Future<ApiResult<List<Movie>>> getUpcomingMovies({int page = 1});
  Future<ApiResult<MovieDetails>> getMovieDetails(int id);
  Future<ApiResult<List<MediaCast>>> getMovieCast(int id);
  Future<ApiResult<List<MediaVideo>>> getMovieVideos(int id);
  Future<ApiResult<List<Movie>>> getSimilarMovies(int id);
}
