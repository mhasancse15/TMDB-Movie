import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final String? profilePath;
  final String knownForDepartment;
  final double popularity;

  const Person({
    required this.id,
    required this.name,
    this.profilePath,
    required this.knownForDepartment,
    required this.popularity,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      profilePath: json['profile_path'] as String?,
      knownForDepartment: json['known_for_department'] as String? ?? 'Acting',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [id, name, profilePath, knownForDepartment, popularity];
}

class PersonDetails extends Equatable {
  final int id;
  final String name;
  final String? biography;
  final String? birthday;
  final String? placeOfBirth;
  final String? profilePath;
  final String knownForDepartment;

  const PersonDetails({
    required this.id,
    required this.name,
    this.biography,
    this.birthday,
    this.placeOfBirth,
    this.profilePath,
    required this.knownForDepartment,
  });

  factory PersonDetails.fromJson(Map<String, dynamic> json) {
    return PersonDetails(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unknown',
      biography: json['biography'] as String?,
      birthday: json['birthday'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      profilePath: json['profile_path'] as String?,
      knownForDepartment: json['known_for_department'] as String? ?? 'Acting',
    );
  }

  @override
  List<Object?> get props => [id, name, biography, birthday, placeOfBirth, profilePath, knownForDepartment];
}
