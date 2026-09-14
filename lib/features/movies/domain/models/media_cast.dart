import 'package:equatable/equatable.dart';

class MediaCast extends Equatable {
  final int id;
  final String name;
  final String? character;
  final String? profilePath;
  final String? job;

  const MediaCast({
    required this.id,
    required this.name,
    this.character,
    this.profilePath,
    this.job,
  });

  factory MediaCast.fromJson(Map<String, dynamic> json) {
    return MediaCast(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      character: json['character'] as String?,
      profilePath: json['profile_path'] as String?,
      job: json['job'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, name, character, profilePath, job];
}

class MediaVideo extends Equatable {
  final String id;
  final String key;
  final String name;
  final String site;
  final String type;

  const MediaVideo({
    required this.id,
    required this.key,
    required this.name,
    required this.site,
    required this.type,
  });

  factory MediaVideo.fromJson(Map<String, dynamic> json) {
    return MediaVideo(
      id: json['id'] as String? ?? '',
      key: json['key'] as String? ?? '',
      name: json['name'] as String? ?? '',
      site: json['site'] as String? ?? 'YouTube',
      type: json['type'] as String? ?? 'Trailer',
    );
  }

  @override
  List<Object?> get props => [id, key, name, site, type];
}

class MediaReview extends Equatable {
  final String id;
  final String author;
  final String content;
  final String createdAt;
  final double? rating;

  const MediaReview({
    required this.id,
    required this.author,
    required this.content,
    required this.createdAt,
    this.rating,
  });

  factory MediaReview.fromJson(Map<String, dynamic> json) {
    final authorDetails = json['author_details'] as Map<String, dynamic>?;
    return MediaReview(
      id: json['id'] as String? ?? '',
      author: json['author'] as String? ?? 'Anonymous',
      content: json['content'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      rating: (authorDetails?['rating'] as num?)?.toDouble(),
    );
  }

  @override
  List<Object?> get props => [id, author, content, createdAt, rating];
}

class WatchProvider extends Equatable {
  final int providerId;
  final String providerName;
  final String logoPath;

  const WatchProvider({
    required this.providerId,
    required this.providerName,
    required this.logoPath,
  });

  factory WatchProvider.fromJson(Map<String, dynamic> json) {
    return WatchProvider(
      providerId: json['provider_id'] as int? ?? 0,
      providerName: json['provider_name'] as String? ?? '',
      logoPath: json['logo_path'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [providerId, providerName, logoPath];
}
