import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static String get apiKey => dotenv.env['TMDB_API_KEY'] ?? '';
  static String get baseUrl => dotenv.env['TMDB_BASE_URL'] ?? 'https://api.themoviedb.org/3';
  static String get imageBaseUrl => dotenv.env['TMDB_IMAGE_BASE_URL'] ?? 'https://image.tmdb.org/t/p';

  static String get posterUrlSmall => '$imageBaseUrl/w185';
  static String get posterUrlMedium => '$imageBaseUrl/w342';
  static String get posterUrlOriginal => '$imageBaseUrl/original';

  static String get backdropUrlSmall => '$imageBaseUrl/w300';
  static String get backdropUrlMedium => '$imageBaseUrl/w780';
  static String get backdropUrlOriginal => '$imageBaseUrl/original';

  static String get profileUrlSmall => '$imageBaseUrl/w185';
  static String get profileUrlMedium => '$imageBaseUrl/h632';

  // Endpoints
  static const String trendingMovies = '/trending/movie/day';
  static const String trendingTV = '/trending/tv/day';
  static const String popularMovies = '/movie/popular';
  static const String topRatedMovies = '/movie/top_rated';
  static const String nowPlayingMovies = '/movie/now_playing';
  static const String upcomingMovies = '/movie/upcoming';

  static const String popularTV = '/tv/popular';
  static const String topRatedTV = '/tv/top_rated';
  static const String airingTodayTV = '/tv/airing_today';
  static const String onTheAirTV = '/tv/on_the_air';

  static const String popularPeople = '/person/popular';
  static const String searchMulti = '/search/multi';
  static const String searchMovie = '/search/movie';
  static const String searchTV = '/search/tv';
  static const String searchPerson = '/search/person';

  static const String movieGenres = '/genre/movie/list';
  static const String tvGenres = '/genre/tv/list';
  static const String discoverMovie = '/discover/movie';
  static const String discoverTV = '/discover/tv';
}
