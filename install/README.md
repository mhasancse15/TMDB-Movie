# Installation Guide

This kit is intentionally adapter-based because AI coding tools use different instruction/skill discovery mechanisms.

## 1. Codex

Use the Codex adapter as the project instruction entry point and make the core skill directory available through your Codex skills setup.

Recommended:
- global: keep the `flutter-ai-agent` skill available globally
- project: add `AGENTS.md` containing project-specific information

## 2. Claude Code

Use `CLAUDE.md` as the project entry point and expose the core skill through Claude Code's supported skills location.

Keep project-specific constraints in the repository.

## 3. Cursor

Copy/adapt `adapters/cursor/project.mdc` into:

```text
.cursor/rules/
```

Keep large reusable workflows in the global skill directory rather than duplicating them in every project.

## 4. GitHub Copilot

Use:

```text
.github/copilot-instructions.md
```

for project-specific instructions, and keep the full global kit available through your agent workflow.

## Important

Do not assume every agent supports arbitrary global folders. The adapters are the portable layer; the exact global installation path depends on the agent/version.
