# Flutter AI Agent — Codex Adapter

For Flutter repositories, use the global `flutter-ai-agent` skill.

Read:
1. `SKILL.md`
2. relevant `rules/*.md`
3. relevant `commands/*.md` or `skills/*/SKILL.md`

## Invocation convention

When the user asks for:
- project understanding -> `analyze-project`
- feature -> `create-feature`
- screen -> `create-screen`
- model -> `create-model`
- API -> `create-api`
- state -> `create-provider` or `create-bloc`
- bug -> `fix-bug`
- tests -> `create-test`
- review -> `code-review`
- performance -> `performance-review`
- security -> `security-review`
- release -> `release-check`

Always inspect the current repository before applying a workflow.

For multi-directory repositories, the nearest `AGENTS.md` has more specific instructions than this adapter.
