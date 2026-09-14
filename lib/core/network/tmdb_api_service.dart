import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../../features/movies/domain/models/movie.dart';
import '../../features/movies/domain/models/movie_details.dart';
import '../../features/tv/domain/models/tv_show.dart';
import '../../features/tv/domain/models/tv_details.dart';
import '../../features/people/domain/models/person.dart';
import '../../features/genres/domain/models/genre.dart';
import '../../features/movies/domain/models/media_cast.dart';

class TmdbApiService {
  final Dio _dio;

  TmdbApiService(this._dio);

  // Movies API
  Future<List<Movie>> getTrendingMovies({int page = 1}) async {
    final response = await _dio.get(ApiConstants.trendingMovies, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await _dio.get(ApiConstants.popularMovies, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await _dio.get(ApiConstants.topRatedMovies, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response = await _dio.get(ApiConstants.nowPlayingMovies, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getUpcomingMovies({int page = 1}) async {
    final response = await _dio.get(ApiConstants.upcomingMovies, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<MovieDetails> getMovieDetails(int id) async {
    final response = await _dio.get('/movie/$id');
    return MovieDetails.fromJson(response.data);
  }

  Future<List<MediaCast>> getMovieCast(int id) async {
    final response = await _dio.get('/movie/$id/credits');
    final cast = response.data['cast'] as List<dynamic>;
    return cast.map((json) => MediaCast.fromJson(json)).toList();
  }

  Future<List<MediaVideo>> getMovieVideos(int id) async {
    final response = await _dio.get('/movie/$id/videos');
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => MediaVideo.fromJson(json)).toList();
  }

  Future<List<Movie>> getSimilarMovies(int id) async {
    final response = await _dio.get('/movie/$id/similar');
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>> getRecommendedMovies(int id) async {
    final response = await _dio.get('/movie/$id/recommendations');
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  // TV API
  Future<List<TVShow>> getTrendingTV({int page = 1}) async {
    final response = await _dio.get(ApiConstants.trendingTV, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }

  Future<List<TVShow>> getPopularTV({int page = 1}) async {
    final response = await _dio.get(ApiConstants.popularTV, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }

  Future<List<TVShow>> getTopRatedTV({int page = 1}) async {
    final response = await _dio.get(ApiConstants.topRatedTV, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }

  Future<List<TVShow>> getAiringTodayTV({int page = 1}) async {
    final response = await _dio.get(ApiConstants.airingTodayTV, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => TVShow.fromJson(json)).toList();
  }

  Future<TVDetails> getTVDetails(int id) async {
    final response = await _dio.get('/tv/$id');
    return TVDetails.fromJson(response.data);
  }

  Future<List<MediaCast>> getTVCast(int id) async {
    final response = await _dio.get('/tv/$id/credits');
    final cast = response.data['cast'] as List<dynamic>;
    return cast.map((json) => MediaCast.fromJson(json)).toList();
  }

  // Search API
  Future<List<dynamic>> searchMulti(String query, {int page = 1}) async {
    final response = await _dio.get(ApiConstants.searchMulti, queryParameters: {'query': query, 'page': page});
    return response.data['results'] as List<dynamic>;
  }

  // Discover API
  Future<List<Movie>> discoverMovies({
    required Map<String, dynamic> filters,
    int page = 1,
  }) async {
    final queryParams = {'page': page, ...filters};
    final response = await _dio.get(ApiConstants.discoverMovie, queryParameters: queryParams);
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Movie.fromJson(json)).toList();
  }

  // People API
  Future<List<Person>> getPopularPeople({int page = 1}) async {
    final response = await _dio.get(ApiConstants.popularPeople, queryParameters: {'page': page});
    final results = response.data['results'] as List<dynamic>;
    return results.map((json) => Person.fromJson(json)).toList();
  }

  Future<PersonDetails> getPersonDetails(int id) async {
    final response = await _dio.get('/person/$id');
    return PersonDetails.fromJson(response.data);
  }

  // Genres API
  Future<List<Genre>> getMovieGenres() async {
    final response = await _dio.get(ApiConstants.movieGenres);
    final genres = response.data['genres'] as List<dynamic>;
    return genres.map((json) => Genre.fromJson(json)).toList();
  }
}
