# Architecture Rules

Adapt to the project's architecture.

For Clean Architecture:

Presentation -> Domain -> Data

Domain should not depend on Flutter UI, Dio, database implementations, or Riverpod.

For feature-first projects, keep feature ownership clear.

Do not move files across the entire project unless required.

Prefer incremental changes.
