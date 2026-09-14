import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../domain/models/media_cast.dart';
import '../../domain/models/movie.dart';
import '../../domain/models/movie_details.dart';

class MovieDetailsState {
  final MovieDetails? details;
  final List<MediaCast> cast;
  final List<MediaVideo> videos;
  final List<Movie> recommendations;
  final bool isFavorite;
  final bool isInWatchlist;

  const MovieDetailsState({
    this.details,
    this.cast = const [],
    this.videos = const [],
    this.recommendations = const [],
    this.isFavorite = false,
    this.isInWatchlist = false,
  });

  MovieDetailsState copyWith({
    MovieDetails? details,
    List<MediaCast>? cast,
    List<MediaVideo>? videos,
    List<Movie>? recommendations,
    bool? isFavorite,
    bool? isInWatchlist,
  }) {
    return MovieDetailsState(
      details: details ?? this.details,
      cast: cast ?? this.cast,
      videos: videos ?? this.videos,
      recommendations: recommendations ?? this.recommendations,
      isFavorite: isFavorite ?? this.isFavorite,
      isInWatchlist: isInWatchlist ?? this.isInWatchlist,
    );
  }
}

class MovieDetailsNotifier extends StateNotifier<AsyncValue<MovieDetailsState>> {
  final Ref _ref;
  final int movieId;

  MovieDetailsNotifier(this._ref, this.movieId) : super(const AsyncValue.loading()) {
    loadDetails(movieId);
  }

  Future<void> loadDetails(int movieId) async {
    state = const AsyncValue.loading();
    try {
      final movieRepo = _ref.read(movieRepositoryProvider);
      final libraryRepo = _ref.read(userLibraryRepositoryProvider);

      final results = await Future.wait([
        movieRepo.getMovieDetails(movieId),
        movieRepo.getMovieCast(movieId),
        movieRepo.getMovieVideos(movieId),
        movieRepo.getSimilarMovies(movieId),
        libraryRepo.isFavorite(movieId, 'movie'),
        libraryRepo.isInWatchlist(movieId, 'movie'),
      ]);

      final details = (results[0] as dynamic).dataOrNull as MovieDetails?;
      final cast = (results[1] as dynamic).dataOrNull as List<MediaCast>? ?? [];
      final videos = (results[2] as dynamic).dataOrNull as List<MediaVideo>? ?? [];
      final sim = (results[3] as dynamic).dataOrNull as List<Movie>? ?? [];
      final fav = results[4] as bool;
      final watch = results[5] as bool;

      if (details != null) {
        libraryRepo.addToWatchHistory(
          id: details.id,
          title: details.title,
          posterPath: details.posterPath,
          mediaType: 'movie',
        );
      }

      state = AsyncValue.data(
        MovieDetailsState(
          details: details,
          cast: cast,
          videos: videos,
          recommendations: sim,
          isFavorite: fav,
          isInWatchlist: watch,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> toggleFavorite() async {
    final current = state.valueOrNull;
    if (current?.details == null) return;
    final details = current!.details!;
    final libraryRepo = _ref.read(userLibraryRepositoryProvider);

    if (current.isFavorite) {
      await libraryRepo.removeFromFavorites(details.id, 'movie');
      state = AsyncValue.data(current.copyWith(isFavorite: false));
    } else {
      await libraryRepo.addToFavorites(
        id: details.id,
        title: details.title,
        posterPath: details.posterPath,
        backdropPath: details.backdropPath,
        voteAverage: details.voteAverage,
        releaseDate: details.releaseDate,
        mediaType: 'movie',
      );
      state = AsyncValue.data(current.copyWith(isFavorite: true));
    }
  }

  Future<void> toggleWatchlist() async {
    final current = state.valueOrNull;
    if (current?.details == null) return;
    final details = current!.details!;
    final libraryRepo = _ref.read(userLibraryRepositoryProvider);

    if (current.isInWatchlist) {
      await libraryRepo.removeFromWatchlist(details.id, 'movie');
      state = AsyncValue.data(current.copyWith(isInWatchlist: false));
    } else {
      await libraryRepo.addToWatchlist(
        id: details.id,
        title: details.title,
        posterPath: details.posterPath,
        backdropPath: details.backdropPath,
        voteAverage: details.voteAverage,
        releaseDate: details.releaseDate,
        mediaType: 'movie',
      );
      state = AsyncValue.data(current.copyWith(isInWatchlist: true));
    }
  }
}

final movieDetailsNotifierProvider =
    StateNotifierProvider.family<MovieDetailsNotifier, AsyncValue<MovieDetailsState>, int>(
  (ref, movieId) => MovieDetailsNotifier(ref, movieId),
);
