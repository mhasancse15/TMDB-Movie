import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final List<int> genreIds;
  final double popularity;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    this.genreIds = const [],
    this.popularity = 0.0,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? json['name'] as String? ?? 'Untitled',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      releaseDate: json['release_date'] as String? ?? json['first_air_date'] as String? ?? '',
      genreIds: (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [],
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'overview': overview,
        'poster_path': posterPath,
        'backdrop_path': backdropPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'release_date': releaseDate,
        'genre_ids': genreIds,
        'popularity': popularity,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        overview,
        posterPath,
        backdropPath,
        voteAverage,
        voteCount,
        releaseDate,
        genreIds,
        popularity,
      ];
}
