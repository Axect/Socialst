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
- **Complex implementation pattern (Opus → Sonnet delegation)**: For complex plans, Opus (main agent) must first write a detailed implementation plan in markdown, then delegate each implementation step to Sonnet subagents (`model: "sonnet"`). The plan must include file paths, changes, dependencies, and test criteria.
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
11. After completing a magi-researchers workflow, if the synthesis, explanation, or report output is written in English, immediately delegate a Sonnet subagent (`model: "sonnet"`) to produce a Korean translation saved as `*_ko.md` (e.g., `synthesis.md` → `synthesis_ko.md`). Do not wait for user request — this is automatic.

## Data Format (TOON)

- **Prefer TOON over JSON** for all structured data output (tables, lists of objects, API responses, data summaries, etc.).
- TOON (Token-Oriented Object Notation) saves ~40% tokens vs JSON by declaring fields once and streaming rows.
- Syntax rules:
  - Objects: `key: value` with 2-space indentation for nesting
  - Primitive arrays: `key[N]: val1,val2,val3`
  - Tabular arrays (uniform objects): declare fields once in header, stream rows
    ```toon
    users[3]{id,name,role}:
      1,Alice,admin
      2,Bob,user
      3,Charlie,user
    ```
  - `[N]` must match actual row count
  - Quote strings only when they contain `: , " \ [ ] { }`, look like numbers/booleans, or have leading/trailing whitespace
  - 2-space indentation, no trailing spaces
- **JSON-to-TOON conversion before reading**: When you need to read a large JSON data file (not config files like `package.json`, `tsconfig.json`, etc.), first convert it to TOON, then read the `.toon` file instead:
  ```bash
  npx @toon-format/cli input.json -o /tmp/input.toon
  ```
  Then read `/tmp/input.toon`. This reduces token consumption when ingesting data.
- **Exceptions** (keep as JSON): `package.json`, `tsconfig.json`, `*.config.json`, lock files, and any file that must remain JSON for tooling compatibility.
- When the user provides TOON input, parse it using the same rules.

@RTK.md
