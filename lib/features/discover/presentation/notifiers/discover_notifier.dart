import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../genres/domain/models/genre.dart';
import '../../../movies/domain/models/movie.dart';

class DiscoverState {
  final List<Genre> availableGenres;
  final int? selectedGenreId;
  final double minRating;
  final int? releaseYear;
  final String sortBy;
  final List<Movie> movies;
  final int page;
  final bool isLoading;
  final bool hasMore;

  const DiscoverState({
    this.availableGenres = const [],
    this.selectedGenreId,
    this.minRating = 0.0,
    this.releaseYear,
    this.sortBy = 'popularity.desc',
    this.movies = const [],
    this.page = 1,
    this.isLoading = false,
    this.hasMore = true,
  });

  DiscoverState copyWith({
    List<Genre>? availableGenres,
    int? selectedGenreId,
    double? minRating,
    int? releaseYear,
    String? sortBy,
    List<Movie>? movies,
    int? page,
    bool? isLoading,
    bool? hasMore,
  }) {
    return DiscoverState(
      availableGenres: availableGenres ?? this.availableGenres,
      selectedGenreId: selectedGenreId,
      minRating: minRating ?? this.minRating,
      releaseYear: releaseYear ?? this.releaseYear,
      sortBy: sortBy ?? this.sortBy,
      movies: movies ?? this.movies,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}

class DiscoverNotifier extends StateNotifier<DiscoverState> {
  final Ref _ref;

  DiscoverNotifier(this._ref) : super(const DiscoverState()) {
    init();
  }

  Future<void> init() async {
    final discoverRepo = _ref.read(discoverRepositoryProvider);
    final genresRes = await discoverRepo.getMovieGenres();
    genresRes.when(
      success: (genres) => state = state.copyWith(availableGenres: genres),
      failure: (_) {},
    );
    applyFilters();
  }

  Future<void> applyFilters({
    int? genreId,
    double? minRating,
    int? year,
    String? sortBy,
  }) async {
    state = state.copyWith(
      selectedGenreId: genreId,
      minRating: minRating ?? state.minRating,
      releaseYear: year ?? state.releaseYear,
      sortBy: sortBy ?? state.sortBy,
      page: 1,
      isLoading: true,
      movies: [],
    );

    final filters = <String, dynamic>{
      'sort_by': state.sortBy,
      if (state.selectedGenreId != null) 'with_genres': state.selectedGenreId,
      if (state.minRating > 0) 'vote_average.gte': state.minRating,
      if (state.releaseYear != null) 'primary_release_year': state.releaseYear,
    };

    final discoverRepo = _ref.read(discoverRepositoryProvider);
    final res = await discoverRepo.discoverMovies(filters: filters, page: 1);
    res.when(
      success: (movies) {
        state = state.copyWith(
          movies: movies,
          isLoading: false,
          hasMore: movies.isNotEmpty,
        );
      },
      failure: (_) {
        state = state.copyWith(isLoading: false);
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore) return;

    final nextPage = state.page + 1;
    state = state.copyWith(isLoading: true);

    final filters = <String, dynamic>{
      'sort_by': state.sortBy,
      if (state.selectedGenreId != null) 'with_genres': state.selectedGenreId,
      if (state.minRating > 0) 'vote_average.gte': state.minRating,
      if (state.releaseYear != null) 'primary_release_year': state.releaseYear,
    };

    final discoverRepo = _ref.read(discoverRepositoryProvider);
    final res = await discoverRepo.discoverMovies(filters: filters, page: nextPage);
    res.when(
      success: (newMovies) {
        state = state.copyWith(
          movies: [...state.movies, ...newMovies],
          page: nextPage,
          isLoading: false,
          hasMore: newMovies.isNotEmpty,
        );
      },
      failure: (_) {
        state = state.copyWith(isLoading: false);
      },
    );
  }
}

final discoverNotifierProvider = StateNotifierProvider<DiscoverNotifier, DiscoverState>((ref) {
  return DiscoverNotifier(ref);
});
