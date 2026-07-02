## General Rules

1. When editing any file, ALWAYS read the file first before making changes. Never assume file contents or structure.
2. Do not attempt commands requiring sudo, TTY, or interactive input from the sandbox. If a step requires these, immediately tell the user to run it manually and provide the exact command.
3. For simple, non-destructive tool usage (file reads, searches, small edits, running tests, etc.), proceed without asking for permission. Only ask for confirmation when performing destructive or hard-to-reverse actions (file deletion, large-scale modifications, force push, etc.).
4. Never add Co-Authored-By or any co-author attribution to git commits unless explicitly asked.

## Writing Style (No AI Tells)

Applies to ALL prose you produce: chat replies, commit messages, code comments, reports, documentation, markdown files. The goal is writing that reads as human-authored, not LLM-generated. This OVERRIDES any default stylistic habit.

1. **No em-dashes or en-dashes.** Never use the em-dash `—` or en-dash `–` anywhere. Use a comma, period, colon, parentheses, or restructure the sentence instead. A plain hyphen `-` is fine only for hyphenated words (e.g. `multi-step`) and CLI flags. If you catch yourself about to write an em-dash, replace it.
2. **No antithesis cliché.** Avoid "not just X, but Y" and "It's not X, it's Y" inflated contrast constructions.
3. **No filler transitions** such as "Moreover", "Furthermore", "Importantly", "It's worth noting that", "In today's world", "Let's dive in", "Certainly!", "Of course!".
4. **No hype or marketing adjectives** such as "seamless", "robust", "powerful", "cutting-edge", "elevate", "unlock", "leverage" (as a verb), "delve", "tapestry", "realm", "landscape", "testament to".
5. **No emoji** in commit messages, code, or technical writing unless the user explicitly asks.
6. **No rule-of-three padding** (e.g. "fast, clean, and reliable" added only for rhythm) and no needless bolding of random phrases.
7. Prefer plain, direct sentences. State the thing. Cut throat-clearing intros and summary outros that just restate what was already said.
8. **No hard-wrapping in markdown.** Write every paragraph and list item as ONE continuous line, no matter how long. Never wrap prose at a fixed column width (72/80/100 chars). Insert a line break ONLY to separate paragraphs, list items, headings, or blocks. Applies to all .md output: documents, reports, READMEs, model/dataset cards, memory files, journal entries.
9. **Comments and docstrings: write long, let tools complain.** Do NOT pre-calculate column width while writing. Write one full sentence (or semantic unit) per line, however long it gets. Then run the project's formatter/linter (`ruff format`, `ruff check`, `black`); only lines the tool actually flags (e.g. E501) get split, and the split goes at a clause boundary (colon, semicolon, comma, conjunction), never mid-phrase at the column limit. The tool is the sole authority on width; hand-wrapping in anticipation of it is forbidden.

## Code Changes

3. Never remove packages, dependencies, or tools unless explicitly asked. If you think something should be removed, ask first and explain why.

## Package Management

4. Use `uv` (not pip or raw python) for running Python projects and managing dependencies unless otherwise specified. For npm, prefer local/user-scoped global directories over sudo-based global installs.
5. When using Gemini CLI tools (`ask-gemini`, `brainstorm`), always set the model to `gemini-3.5-flash`.
6. When using Codex CLI tools (`ask-codex`, `batch-codex`, `brainstorm`), always set the model to `gpt-5.5`.

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
- **Chunked parallel translation for long markdown documents**: When translating a markdown document longer than ~300 lines (or ~30 KB), *always* split into section-aligned chunks and dispatch parallel Sonnet subagents. A single agent producing ~15–20k output tokens is bottlenecked by sequential token generation; parallelising N chunks reduces wall-clock roughly N-fold.
  - **Splitting rule**: split on top-level H2 (`## `) boundaries with `sed -n 'start,endp'` into `/tmp/report_chunks/chunk{1..N}.md`. Target 80–150 lines per chunk; merge very short sections together, split very long ones (e.g. §4 methods) if they exceed ~200 lines.
  - **Dispatch**: launch all agents in a single assistant turn with multiple `Agent` calls (use `run_in_background: true` for each) so they run concurrently.
  - **Per-chunk prompt must include**:
    1. Scope (which sections this chunk covers).
    2. Rules to preserve LaTeX math verbatim, image/link paths verbatim, and English proper nouns inside Korean sentences (list explicit tokens: `DeCLA`, `Latent-TTR`, etc.).
    3. Blockquote/heading translation conventions (e.g. `Misconception N →  오개념 N`, `Claim → 주장`, etc.).
    4. Output path (`/tmp/report_chunks/chunk{k}_ko.md`).
    5. Terse confirmation format ("chunkK_ko.md written (X KB, Y lines)") to keep the result message small.
  - **Merge**: after all agents report done, `cat` the chunks in order into the final `*_ko.md` and verify line count roughly matches (Korean is usually 1.0–1.3× the English line count).
  - **Verification**: spot-check that section boundaries align, LaTeX math is intact (grep for `$$`), and image paths survived (grep for `plots/`).
- **ALWAYS verify subagent outputs before reporting to user.** Subagent reports describe intent, not reality — they may run in isolated worktrees, hit silent errors, or hallucinate results. Before telling the user what a subagent produced:
  1. Check every file the subagent claims to have written/modified exists at the stated path (`ls` / `Read`).
  2. For scripts that generate outputs (plots, JSON, reports), verify the output files exist and have non-zero size.
  3. For numerical results the subagent reports (metrics, R², loss values), open the actual output file and confirm the numbers match — do not forward the subagent's prose summary as ground truth.
  4. If any verification fails, re-run the step in the main agent or a fresh subagent. Never launder a subagent report into a user-facing claim without verification.
  5. This rule is mandatory even when the subagent claims "completed successfully" or shows convincing output in its stdout — that output may be from a worktree or scratch location that does not persist.

## Autonomous Execution

- When given a clear bug report or failing test: just fix it. Don't ask for hand-holding.
- Point at logs, errors, failing tests — then resolve them autonomously.
- Minimize context switching for the user. Only ask when genuinely ambiguous.

## Self-Improvement

- After ANY correction from the user, update memory files (e.g., `memory/lessons.md`) with the pattern and a rule to prevent recurrence.
- Review relevant memory files at session start for the current project.

## Reuse Project Conventions

- Before writing any utility, grep the project for an existing implementation. Domain invariants (normalization stats, physical floors, unit conventions) live in those helpers.
- Extend existing helpers rather than bypassing them. One-off reimplementations silently drop the constraints the helpers were built to enforce.

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

## Optimizer HPO Ranges

- **SPlus optimizer**: lr search range must be `[1e-3, 1e+0]` (log scale). SPlus has internal eigenvalue-based scaling, so the effective lr is much smaller than nominal. Never narrow this range.
- In general, do not arbitrarily restrict HPO search ranges. Use wide ranges and let the sampler (TPE) find the optimum. Reference existing HPO configs in the user's projects for appropriate ranges.
- **HPO epochs**: Always use **10 epochs** per trial for HPO, not the full training epoch count. After HPO, run the best config with full epochs. Set both `epochs` and `scheduler_config.max_iter` to 10 in the HPO run config.

## Long-Running Tasks (pueue)

- For long-running tasks (e.g. deep learning training, large-scale data processing), use `pueue` so they persist beyond the Claude session. Create a group named after the current project and queue tasks into that group (e.g. `pueue group add HyperbolicLR && pueue add -g HyperbolicLR -- <command>`).
- When multiple GPU tasks are running concurrently, **NEVER kill tasks belonging to other projects.** Even for tasks within the same project, always get user approval before killing.

## PDF Export

- Use `/md2pdf-typora <input.md>` skill for all PDF conversion. Pipeline: pandoc (MD→HTML) + Chrome headless (HTML→PDF) with Typora Whitey theme.
- **Auto-PDF for Korean reports**: When generating Korean markdown reports (`report_ko.md`, `synthesis_ko.md`, `explanation.md`, or any `*_ko.md`), automatically run `/md2pdf-typora` after writing the file and copy the PDF to `~/Dropbox/Magi/<연구폴더>/`.
- Dropbox upload: after PDF generation, always `mkdir -p ~/Dropbox/Magi/<연구폴더>` then `cp <output.pdf> ~/Dropbox/Magi/<연구폴더>/`. 연구폴더 이름은 현재 작업 중인 프로젝트 디렉토리 이름 또는 연구 주제에서 유추한다 (예: `HyperbolicLR`, `PINN`, `CosmoFlow` 등).

## Research Wiki

- After completing a MAGI `/research` pipeline that generates output in `magi-researchers/outputs/`, suggest running `/wiki-ingest magi <output-path>` to ingest findings into the research wiki at `~/.research-wiki/`.
- Wait for user approval before ingesting.

@RTK.md
