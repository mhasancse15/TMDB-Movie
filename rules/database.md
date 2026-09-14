# Persistence Rules

Reuse the project's persistence layer.

Common solutions:
- Drift
- SQLite
- Hive
- Isar
- SharedPreferences

Keep persistence details behind the existing repository/data abstraction where the architecture uses one.

Do not store secrets in ordinary preferences.
