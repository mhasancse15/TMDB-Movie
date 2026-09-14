import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../../core/storage/app_database.dart';
import '../../../genres/domain/models/genre.dart';
import '../../../movies/domain/models/movie.dart';
import '../../../people/domain/models/person.dart';
import '../../../tv/domain/models/tv_show.dart';

class HomeState {
  final List<Movie> featuredMovies;
  final List<Movie> trendingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> nowPlayingMovies;
  final List<Movie> upcomingMovies;
  final List<TVShow> popularTV;
  final List<TVShow> airingTodayTV;
  final List<Person> popularPeople;
  final List<Genre> genres;
  final List<WatchHistoryEntry> continueWatching;

  const HomeState({
    this.featuredMovies = const [],
    this.trendingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingMovies = const [],
    this.upcomingMovies = const [],
    this.popularTV = const [],
    this.airingTodayTV = const [],
    this.popularPeople = const [],
    this.genres = const [],
    this.continueWatching = const [],
  });

  HomeState copyWith({
    List<Movie>? featuredMovies,
    List<Movie>? trendingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? nowPlayingMovies,
    List<Movie>? upcomingMovies,
    List<TVShow>? popularTV,
    List<TVShow>? airingTodayTV,
    List<Person>? popularPeople,
    List<Genre>? genres,
    List<WatchHistoryEntry>? continueWatching,
  }) {
    return HomeState(
      featuredMovies: featuredMovies ?? this.featuredMovies,
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      popularTV: popularTV ?? this.popularTV,
      airingTodayTV: airingTodayTV ?? this.airingTodayTV,
      popularPeople: popularPeople ?? this.popularPeople,
      genres: genres ?? this.genres,
      continueWatching: continueWatching ?? this.continueWatching,
    );
  }
}

class HomeNotifier extends StateNotifier<AsyncValue<HomeState>> {
  final Ref _ref;

  HomeNotifier(this._ref) : super(const AsyncValue.loading()) {
    loadHomeData();
  }

  Future<void> loadHomeData() async {
    state = const AsyncValue.loading();
    try {
      final movieRepo = _ref.read(movieRepositoryProvider);
      final tvRepo = _ref.read(tvRepositoryProvider);
      final peopleRepo = _ref.read(peopleRepositoryProvider);
      final discoverRepo = _ref.read(discoverRepositoryProvider);
      final libraryRepo = _ref.read(userLibraryRepositoryProvider);

      final results = await Future.wait([
        movieRepo.getTrendingMovies(),
        movieRepo.getPopularMovies(),
        movieRepo.getTopRatedMovies(),
        movieRepo.getNowPlayingMovies(),
        movieRepo.getUpcomingMovies(),
        tvRepo.getPopularTV(),
        tvRepo.getAiringTodayTV(),
        peopleRepo.getPopularPeople(),
        discoverRepo.getMovieGenres(),
        libraryRepo.getWatchHistory(),
      ]);

      final trendingRes = (results[0] as ApiResult<List<Movie>>).dataOrNull ?? [];
      final popularRes = (results[1] as ApiResult<List<Movie>>).dataOrNull ?? [];
      final topRatedRes = (results[2] as ApiResult<List<Movie>>).dataOrNull ?? [];
      final nowPlayingRes = (results[3] as ApiResult<List<Movie>>).dataOrNull ?? [];
      final upcomingRes = (results[4] as ApiResult<List<Movie>>).dataOrNull ?? [];
      final popularTvRes = (results[5] as ApiResult<List<TVShow>>).dataOrNull ?? [];
      final airingTvRes = (results[6] as ApiResult<List<TVShow>>).dataOrNull ?? [];
      final peopleRes = (results[7] as ApiResult<List<Person>>).dataOrNull ?? [];
      final genresRes = (results[8] as ApiResult<List<Genre>>).dataOrNull ?? [];
      final historyRes = results[9] as List<WatchHistoryEntry>;

      state = AsyncValue.data(
        HomeState(
          featuredMovies: trendingRes.take(5).toList(),
          trendingMovies: trendingRes,
          popularMovies: popularRes,
          topRatedMovies: topRatedRes,
          nowPlayingMovies: nowPlayingRes,
          upcomingMovies: upcomingRes,
          popularTV: popularTvRes,
          airingTodayTV: airingTvRes,
          popularPeople: peopleRes,
          genres: genresRes,
          continueWatching: historyRes,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async => loadHomeData();
}

final homeNotifierProvider = StateNotifierProvider<HomeNotifier, AsyncValue<HomeState>>((ref) {
  return HomeNotifier(ref);
});
