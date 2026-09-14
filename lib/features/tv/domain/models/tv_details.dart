import 'package:equatable/equatable.dart';
import '../../../genres/domain/models/genre.dart';

class TVSeason extends Equatable {
  final int id;
  final int seasonNumber;
  final String name;
  final int episodeCount;
  final String? posterPath;
  final String? airDate;

  const TVSeason({
    required this.id,
    required this.seasonNumber,
    required this.name,
    required this.episodeCount,
    this.posterPath,
    this.airDate,
  });

  factory TVSeason.fromJson(Map<String, dynamic> json) {
    return TVSeason(
      id: json['id'] as int? ?? 0,
      seasonNumber: json['season_number'] as int? ?? 1,
      name: json['name'] as String? ?? 'Season',
      episodeCount: json['episode_count'] as int? ?? 0,
      posterPath: json['poster_path'] as String?,
      airDate: json['air_date'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, seasonNumber, name, episodeCount, posterPath, airDate];
}

class TVDetails extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String firstAirDate;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final List<Genre> genres;
  final List<TVSeason> seasons;
  final String status;

  const TVDetails({
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.firstAirDate,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.genres,
    required this.seasons,
    required this.status,
  });

  factory TVDetails.fromJson(Map<String, dynamic> json) {
    return TVDetails(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Untitled TV Show',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      firstAirDate: json['first_air_date'] as String? ?? '',
      numberOfSeasons: json['number_of_seasons'] as int? ?? 0,
      numberOfEpisodes: json['number_of_episodes'] as int? ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      seasons: (json['seasons'] as List<dynamic>?)
              ?.map((e) => TVSeason.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      status: json['status'] as String? ?? 'Returning Series',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        firstAirDate,
        numberOfSeasons,
        numberOfEpisodes,
        genres,
        seasons,
        status,
      ];
}
