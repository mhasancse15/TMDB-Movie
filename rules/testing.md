# Testing Rules

Test behavior rather than implementation details.

Use:
- unit tests for pure logic
- repository/provider tests for state/data behavior
- widget tests for UI behavior
- integration tests for end-to-end flows

Keep tests deterministic.

Mock only boundaries that need isolation.
