import 'package:equatable/equatable.dart';
import '../../../genres/domain/models/genre.dart';

class MovieDetails extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final int voteCount;
  final String releaseDate;
  final int runtime;
  final List<Genre> genres;
  final int budget;
  final int revenue;
  final String status;
  final String? tagline;

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseDate,
    required this.runtime,
    required this.genres,
    required this.budget,
    required this.revenue,
    required this.status,
    this.tagline,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? 'Untitled',
      overview: json['overview'] as String? ?? '',
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] as int? ?? 0,
      releaseDate: json['release_date'] as String? ?? '',
      runtime: json['runtime'] as int? ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      budget: json['budget'] as int? ?? 0,
      revenue: json['revenue'] as int? ?? 0,
      status: json['status'] as String? ?? 'Released',
      tagline: json['tagline'] as String?,
    );
  }

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
        runtime,
        genres,
        budget,
        revenue,
        status,
        tagline,
      ];
}
