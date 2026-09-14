import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../movies/domain/models/media_cast.dart';
import '../../domain/models/tv_details.dart';

class TVDetailsState {
  final TVDetails? details;
  final List<MediaCast> cast;
  final bool isFavorite;
  final bool isInWatchlist;

  const TVDetailsState({
    this.details,
    this.cast = const [],
    this.isFavorite = false,
    this.isInWatchlist = false,
  });

  TVDetailsState copyWith({
    TVDetails? details,
    List<MediaCast>? cast,
    bool? isFavorite,
    bool? isInWatchlist,
  }) {
    return TVDetailsState(
      details: details ?? this.details,
      cast: cast ?? this.cast,
      isFavorite: isFavorite ?? this.isFavorite,
      isInWatchlist: isInWatchlist ?? this.isInWatchlist,
    );
  }
}

class TVDetailsNotifier extends StateNotifier<AsyncValue<TVDetailsState>> {
  final Ref _ref;
  final int tvId;

  TVDetailsNotifier(this._ref, this.tvId) : super(const AsyncValue.loading()) {
    loadDetails(tvId);
  }

  Future<void> loadDetails(int tvId) async {
    state = const AsyncValue.loading();
    try {
      final tvRepo = _ref.read(tvRepositoryProvider);
      final libraryRepo = _ref.read(userLibraryRepositoryProvider);

      final results = await Future.wait([
        tvRepo.getTVDetails(tvId),
        tvRepo.getTVCast(tvId),
        libraryRepo.isFavorite(tvId, 'tv'),
        libraryRepo.isInWatchlist(tvId, 'tv'),
      ]);

      final details = (results[0] as dynamic).dataOrNull as TVDetails?;
      final cast = (results[1] as dynamic).dataOrNull as List<MediaCast>? ?? [];
      final fav = results[2] as bool;
      final watch = results[3] as bool;

      if (details != null) {
        libraryRepo.addToWatchHistory(
          id: details.id,
          title: details.name,
          posterPath: details.posterPath,
          mediaType: 'tv',
        );
      }

      state = AsyncValue.data(
        TVDetailsState(
          details: details,
          cast: cast,
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
      await libraryRepo.removeFromFavorites(details.id, 'tv');
      state = AsyncValue.data(current.copyWith(isFavorite: false));
    } else {
      await libraryRepo.addToFavorites(
        id: details.id,
        title: details.name,
        posterPath: details.posterPath,
        backdropPath: details.backdropPath,
        voteAverage: details.voteAverage,
        releaseDate: details.firstAirDate,
        mediaType: 'tv',
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
      await libraryRepo.removeFromWatchlist(details.id, 'tv');
      state = AsyncValue.data(current.copyWith(isInWatchlist: false));
    } else {
      await libraryRepo.addToWatchlist(
        id: details.id,
        title: details.name,
        posterPath: details.posterPath,
        backdropPath: details.backdropPath,
        voteAverage: details.voteAverage,
        releaseDate: details.firstAirDate,
        mediaType: 'tv',
      );
      state = AsyncValue.data(current.copyWith(isInWatchlist: true));
    }
  }
}

final tvDetailsNotifierProvider =
    StateNotifierProvider.family<TVDetailsNotifier, AsyncValue<TVDetailsState>, int>(
  (ref, tvId) => TVDetailsNotifier(ref, tvId),
);
