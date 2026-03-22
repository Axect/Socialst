---
name: md2typst
description: Convert Markdown reports to Typst format, compile to PDF with Korean support and publication-quality figures
allowed-tools: Bash, Read, Write, Edit, Glob, Grep, Agent
---

# Markdown to Typst Conversion Skill

Convert a Markdown report (`.md`) to Typst format using the user's personal template, compile to PDF with Korean font support and publication-quality layout.

## Usage

```
/md2typst <input.md> [options]
```

### Arguments

- `<input.md>` — Path to the input Markdown file (required)
- `--output <dir>` — Output directory (default: `typst/` alongside input file)
- `--lang ko` — Language hint (default: auto-detect from content)
- `--send-telegram` — Send compiled PDF via Telegram after compilation
- `--no-compile` — Only convert, skip compilation

## Step 0: Setup

1. Create the output directory (default: `<input_dir>/typst/`)
2. Copy template files from `~/Socialst/Templates/Typst_Template/`:
   - `socialst.typ`, `alias.typ`, `ORCID_iD.svg`
3. **Patch `socialst.typ` font**: Replace the font setting with serif fonts:
   ```typst
   set text(font: ("IBM Plex Serif", "Noto Serif CJK KR"))
   ```
4. Scan the input `.md` for image references (`![...](path)`). For each:
   - Resolve the path relative to the input file's directory
   - If it's a symlink, resolve to the real file
   - Copy `.png` files to `<output>/plots/`
   - If only `.pdf` exists, check if a `.png` sibling exists and copy that instead
   - Track the mapping: original path → `plots/<filename>.png`

## Step 1: Markdown → Typst Conversion

Read the input `.md` file and convert following these rules:

### Preamble

Generate the Typst preamble:

```typst
#import "socialst.typ": *
#import "alias.typ": *

#show: project.with(
  title: "<extracted from first # heading or filename>",
  authors: (
    (name: "Tae-Geun Kim", email: "axect@yonsei.ac.kr",
     affiliation: "Yonsei University", major: "Department of Physics",
     orcid: "0009-0000-4229-2935"),
  ),
  date: "<today's date in appropriate format>",
)

// Global table styling
#show table: set align(center)
#set table(align: center + horizon)
```

### Heading Conversion

| Markdown | Typst |
|----------|-------|
| `# H1` | `= H1` |
| `## H2` | `== H2` |
| `### H3` | `=== H3` |
| `#### H4` | `==== H4` |

### Inline Formatting

| Markdown | Typst |
|----------|-------|
| `**bold**` | `*bold*` |
| `*italic*` | `_italic_` |
| `` `code` `` | `` `code` `` (same) |
| `---` (horizontal rule) | `#line(length: 100%)` |

### Math Conversion

Inline math `$...$` stays as `$...$`. Display math `$$\n...\n$$` becomes `$ ... $` (Typst display math with spaces).

**LaTeX → Typst math mappings:**

| LaTeX | Typst |
|-------|-------|
| `\mathbb{R}` | `bb(R)` |
| `\mathbf{x}` | `bold(x)` |
| `\mathrm{text}` or `\text{text}` | `upright("text")` |
| `\hat{x}` | `hat(x)` |
| `\bar{x}` | `overline(x)` |
| `\tilde{x}` | `tilde(x)` |
| `\frac{a}{b}` | `a / b` (or `(a) / (b)` for complex) |
| `\sum_{j}` | `sum_j` |
| `\prod` | `product` |
| `\int` | `integral` |
| `\partial` | `partial` |
| `\nabla` | `nabla` |
| `\exp` | `exp` |
| `\log` | `log` |
| `\min` | `min` |
| `\max` | `max` |
| `\sin`, `\cos`, `\tan` | `sin`, `cos`, `tan` |
| `\sigma` | `sigma` |
| `\lambda` | `lambda` |
| `\alpha` | `alpha` |
| `\beta` | `beta` |
| `\gamma` | `gamma` |
| `\delta` | `delta` |
| `\eta` | `eta` |
| `\kappa` | `kappa` |
| `\tau` | `tau` |
| `\phi` | `phi` |
| `\pi` | `pi` |
| `\rho` | `rho` |
| `\epsilon` | `epsilon` |
| `\mu` | `mu` |
| `\nu` | `nu` |
| `\omega` | `omega` |
| `\Omega` | `Omega` |
| `\times` | `times` |
| `\cdot` | `dot` |
| `\odot` | `dot.circle` |
| `\to` or `\rightarrow` | `arrow.r` |
| `\leftarrow` | `arrow.l` |
| `\leftrightarrow` | `arrow.l.r` |
| `\approx` | `approx` |
| `\sim` | `tilde.op` |
| `\geq` or `\ge` | `gt.eq` |
| `\leq` or `\le` | `lt.eq` |
| `\neq` or `\ne` | `eq.not` |
| `\in` | `in` |
| `\notin` | `in.not` |
| `\subset` | `subset` |
| `\infty` | `infinity` |
| `\langle` | `angle.l` → use `lr(angle.l ... angle.r)` |
| `\rangle` | `angle.r` |
| `\left(` ... `\right)` | `lr(( ... ))` |
| `\left[` ... `\right]` | `lr([ ... ])` |
| `\quad` | `quad` |
| `\qquad` | `quad quad` |
| `_{...}` | `_(...)` (parentheses for multi-char subscripts) |
| `^{...}` | `^(...)` (parentheses for multi-char superscripts) |

**IMPORTANT**: Do NOT use `\sim` → `sim` (unknown variable error). Use `tilde.op` instead.
**IMPORTANT**: Do NOT put multi-letter variable names in math mode without quotes (e.g., `$v1$` → error). Use `v1` outside math or `$"v1"$` inside.
**IMPORTANT**: `\diff` is deprecated in Typst → use `partial`.

### Figure Conversion

```markdown
![Caption text](plots/figure.pdf)
```
→
```typst
#figure(placement: auto,
  image("plots/figure.png", width: 100%),
  caption: [Caption text],
)
```

**Rules:**
- Always use `placement: auto` — prevents large whitespace gaps by floating figures to page top/bottom
- Use `.png` extension (not `.pdf`) — Typst handles PNG better for inline display
- `width: 100%` for full-width, `width: 80%` for smaller figures
- Keep caption text as-is (translate if the document is Korean)

### Table Conversion

```markdown
| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
```
→
```typst
#set text(size: 9pt)  // for dense tables, use 8pt
#table(
  columns: (auto, auto, auto),
  table.header([*Header 1*], [*Header 2*], [*Header 3*]),
  [Cell 1], [Cell 2], [Cell 3],
)
#set text(size: 11pt)  // restore default
```

**Rules:**
- Use `#set text(size: 8pt)` before large tables (6+ columns), `9pt` for medium tables, skip for small tables
- Restore font size after the table
- Global `#set table(align: center + horizon)` handles alignment (set in preamble)
- Math in table cells: wrap in `$...$` as normal

### List Conversion

| Markdown | Typst |
|----------|-------|
| `- item` | `- item` (same) |
| `1. item` | `+ item` (auto-numbered) |

### Code Block Conversion

````markdown
```python
code here
```
````
→
````typst
```python
code here
```
````
(Same syntax — Typst supports fenced code blocks)

### Link Conversion

| Markdown | Typst |
|----------|-------|
| `[text](url)` | `#link("url")[text]` |

## Step 2: Post-Processing

After writing the `.typ` file:

1. **Verify no `sim` in math**: Search for `$sim ` or `$sim$` patterns — replace with `$tilde.op$`
2. **Verify no bare multi-letter vars in math**: Check for patterns like `$v1$`, `$v2$` — either remove from math or quote
3. **Verify `diff` → `partial`**: Replace any `diff` in math with `partial`
4. **Verify `circle.dot`**: Replace with `dot.circle` (correct Typst symbol)
5. **Verify `angle.l`/`angle.r`**: Deprecated — wrap with `lr()` or use `chevron.l`/`chevron.r`

## Step 3: Compile

```bash
cd <output_dir> && typst compile main.typ report.pdf 2>&1
```

If errors occur:
1. Read the error message — Typst errors are precise with line numbers
2. Fix the specific line in `main.typ`
3. Re-compile
4. Maximum 5 fix iterations

Common errors and fixes:
- `unknown variable: xyz` → multi-letter name in math mode. Quote it: `"xyz"` or move outside math
- `unknown symbol modifier` → wrong symbol name. Check Typst symbol reference
- `deprecated` warnings → update to new name (e.g., `diff` → `partial`)
- Font warning → font not installed. Use fallback chain

## Step 4: Deliver

1. Report the compiled PDF path and file size
2. If `--send-telegram` was specified, send via Telegram:
   ```
   mcp__plugin_telegram_telegram__reply(
     chat_id: "<user's chat_id>",
     text: "Typst PDF 보고서입니다.",
     files: ["<absolute_path_to_pdf>"]
   )
   ```

## Template Customization

The skill uses `~/Socialst/Templates/Typst_Template/` as the base template. The `socialst.typ` template provides:
- Title/author/date header with ORCID
- Numbered headings (`1.`, `1.1.`, etc.)
- Numbered equations (`(1)`, `(2)`, etc.)
- Theorem/definition boxes (via ctheorems)
- Justified text

**Font override (always applied):**
- Main text: `IBM Plex Serif` (Latin) + `Noto Serif CJK KR` (Korean fallback)
- Math: Typst default (New Computer Modern Math)

**Layout overrides (always applied):**
- Tables: center-aligned (global `#set table(align: center + horizon)`)
- Figures: `placement: auto` (float to minimize whitespace)

## Notes

- For reports with many figures, consider `width: 80%` to keep figures manageable
- If the input has both English and Korean, the font fallback chain handles it automatically
- Tables with 7+ columns may need `size: 7pt` to fit within page width
- The skill does NOT add `#outline()` (no table of contents) — add manually if needed
- The skill does NOT add `#bibliography()` — add manually with a `.bib` file if needed
