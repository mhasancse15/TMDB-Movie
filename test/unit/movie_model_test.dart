import 'package:flutter_test/flutter_test.dart';
import 'package:movie_verse/features/movies/domain/models/movie.dart';

void main() {
  group('Movie Model Unit Tests', () {
    test('Movie.fromJson deserializes correctly from valid TMDB json', () {
      final json = {
        'id': 550,
        'title': 'Fight Club',
        'overview': 'An office worker and a soap maker...',
        'poster_path': '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
        'backdrop_path': '/hZkgoQY85Visual.jpg',
        'vote_average': 8.4,
        'vote_count': 26000,
        'release_date': '1999-10-15',
        'genre_ids': [18, 53],
        'popularity': 60.5,
      };

      final movie = Movie.fromJson(json);

      expect(movie.id, equals(550));
      expect(movie.title, equals('Fight Club'));
      expect(movie.voteAverage, equals(8.4));
      expect(movie.releaseDate, equals('1999-10-15'));
      expect(movie.genreIds, contains(18));
    });

    test('Movie.toJson produces accurate JSON map', () {
      const movie = Movie(
        id: 101,
        title: 'Inception',
        overview: 'A thief who steals corporate secrets...',
        posterPath: '/path.jpg',
        voteAverage: 8.8,
        voteCount: 30000,
        releaseDate: '2010-07-16',
      );

      final json = movie.toJson();

      expect(json['id'], equals(101));
      expect(json['title'], equals('Inception'));
      expect(json['vote_average'], equals(8.8));
    });
  });
}
