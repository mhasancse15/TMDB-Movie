import 'package:equatable/equatable.dart';

class TVShow extends Equatable {
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String firstAirDate;
  final List<int> genreIds;
  final double popularity;

  const TVShow({
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.firstAirDate,
    this.genreIds = const [],
    this.popularity = 0.0,
  });

  factory TVShow.fromJson(Map<String, dynamic> json) {
    return TVShow(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? json['title'] as String? ?? 'Untitled',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      firstAirDate: json['first_air_date'] as String? ?? json['release_date'] as String? ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'first_air_date': firstAirDate,
        'genre_ids': genreIds,
        'popularity': popularity,
      };

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
        genreIds,
        popularity,
      ];
}
