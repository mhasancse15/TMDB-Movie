import 'package:flutter_test/flutter_test.dart';
import 'package:movie_verse/core/error/failures.dart';
import 'package:movie_verse/core/network/api_result.dart';

void main() {
  group('ApiResult Pattern Unit Tests', () {
    test('ApiResult.success handles data properly', () {
      final result = ApiResult<String>.success('Movie Universe');

      expect(result.isSuccess, isTrue);
      expect(result.isFailure, isFalse);
      expect(result.dataOrNull, equals('Movie Universe'));
      expect(result.failureOrNull, isNull);
    });

    test('ApiResult.failure handles failure properly', () {
      const failure = ServerFailure('500 Internal Error');
      final result = ApiResult<String>.failure(failure);

      expect(result.isSuccess, isFalse);
      expect(result.isFailure, isTrue);
      expect(result.dataOrNull, isNull);
      expect(result.failureOrNull, equals(failure));
    });
  });
}
