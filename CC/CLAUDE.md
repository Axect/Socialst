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

## Problem Solving

- **Diagnose before treating**: For any non-trivial task (3+ steps or architectural decisions), enter plan mode first. Investigate the FULL dependency chain — check version numbers, config values, data shapes, and the complete path from input to error. Present diagnosis with confidence levels before proposing fixes.
- **Root cause, not symptoms**: Never fix the first plausible cause. If a fix feels like a band-aid, stop and dig deeper. Ask: "Am I fixing the symptom or the cause?"
- **Re-plan on failure**: If an approach goes sideways, STOP immediately and re-plan. Do not keep pushing a failing strategy.
- **Verify before done**: Never mark a task complete without proving it works — run tests, check output, demonstrate correctness. Ask: "Would a staff engineer approve this?"

## Subagent Strategy

- Use subagents liberally to keep main context window clean.
- Offload research, exploration, and parallel analysis to subagents.
- For complex debugging, spawn a scout subagent to explore the full problem space before committing to a fix.
- One focused task per subagent.
- When a translation task is requested, delegate it to a Sonnet subagent (`model: "sonnet"`).

## Autonomous Execution

- When given a clear bug report or failing test: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them autonomously.
- Minimize context switching for the user. Only ask when genuinely ambiguous.

## Self-Improvement

- After ANY correction from the user, update memory files (e.g., `memory/lessons.md`) with the pattern and a rule to prevent recurrence.
- Review relevant memory files at session start for the current project.

## Research Workflow

9. When asked to brainstorm or summarize previous work, confirm the scope before generating. If the user says 'summarize 3 projects', summarize exactly 3 — do not expand to a full synthesis unless asked.
10. For multi-model brainstorming (MAGI pattern), always validate with ALL specified models (Gemini, Codex, etc.), not a subset. If a model fails, note the failure and use available fallbacks, but do not silently skip models.
