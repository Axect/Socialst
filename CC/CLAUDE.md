## General Rules

1. When editing any file, ALWAYS read the file first before making changes. Never assume file contents or structure.
2. Do not attempt commands requiring sudo, TTY, or interactive input from the sandbox. If a step requires these, immediately tell the user to run it manually and provide the exact command.
3. For simple, non-destructive tool usage (file reads, searches, small edits, running tests, etc.), proceed without asking for permission. Only ask for confirmation when performing destructive or hard-to-reverse actions (file deletion, large-scale modifications, force push, etc.).

## Code Changes

3. Never remove packages, dependencies, or tools unless explicitly asked. If you think something should be removed, ask first and explain why.

## Package Management

4. Use `uv` (not pip or raw python) for running Python projects and managing dependencies unless otherwise specified. For npm, prefer local/user-scoped global directories over sudo-based global installs.
5. When using Gemini CLI tools (`ask-gemini`, `brainstorm`), always set the model to `gemini-3.1-pro-preview`.
6. When using Codex CLI tools (`ask-codex`, `batch-codex`, `brainstorm`), always set the model to `gpt-5-codex`.

## Deployment

7. Always use Gitflow branching strategy.
8. For deployment and releases, follow Gitflow workflow: feature branch → dev → main via PR/merge. Use the plugin Marketplace page for updates, not GitHub releases/tags directly.

## Research Workflow

9. When asked to brainstorm or summarize previous work, confirm the scope before generating. If the user says 'summarize 3 projects', summarize exactly 3 — do not expand to a full synthesis unless asked.
10. For multi-model brainstorming (MAGI pattern), always validate with ALL specified models (Gemini, Codex, etc.), not a subset. If a model fails, note the failure and use available fallbacks, but do not silently skip models.
