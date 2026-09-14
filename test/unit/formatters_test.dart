import 'package:flutter_test/flutter_test.dart';
import 'package:movie_verse/core/utils/formatters.dart';

void main() {
  group('AppFormatters Unit Tests', () {
    test('formatYear extracts 4-digit release year correctly', () {
      expect(AppFormatters.formatYear('2024-11-22'), equals('2024'));
      expect(AppFormatters.formatYear('1999-01-01'), equals('1999'));
      expect(AppFormatters.formatYear(''), equals('N/A'));
      expect(AppFormatters.formatYear(null), equals('N/A'));
    });

    test('formatRuntime converts minutes to human-readable hours and minutes', () {
      expect(AppFormatters.formatRuntime(148), equals('2h 28m'));
      expect(AppFormatters.formatRuntime(45), equals('45m'));
      expect(AppFormatters.formatRuntime(0), equals('N/A'));
      expect(AppFormatters.formatRuntime(null), equals('N/A'));
    });

    test('formatRating rounds rating to 1 decimal place', () {
      expect(AppFormatters.formatRating(8.462), equals('8.5'));
      expect(AppFormatters.formatRating(0.0), equals('NR'));
      expect(AppFormatters.formatRating(null), equals('NR'));
    });
  });
}
