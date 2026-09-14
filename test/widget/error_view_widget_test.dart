import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_verse/core/widgets/error_view.dart';

void main() {
  group('ErrorView Widget Tests', () {
    testWidgets('Renders error message and triggers retry button callback', (tester) async {
      bool retried = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ErrorView(
              message: 'Failed to reach TMDB Servers',
              onRetry: () => retried = true,
            ),
          ),
        ),
      );

      expect(find.text('Oops! Something went wrong'), findsOneWidget);
      expect(find.text('Failed to reach TMDB Servers'), findsOneWidget);
      expect(find.text('Try Again'), findsOneWidget);

      await tester.tap(find.text('Try Again'));
      expect(retried, isTrue);
    });
  });
}
