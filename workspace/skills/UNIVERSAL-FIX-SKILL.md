---
name: UNIVERSAL FIX SKILL
description: Automated rules for fixing all Markdown linting and formatting issues in Contexts and Meta-Artifacts.
---

# SKILL: UNIVERSAL FIX SKILL

**Version:** Gold v1.0

**Type:** Utility Skill

**Tier:** 3 — Loaded when requested or encountering linting errors in context files

**File:** skills/UNIVERSAL-FIX-SKILL.md

**Primary Mode:** Builder (formatting/fixing)

**Purpose:** Automates the correction of common Markdown linting errors generated in Gold Context Files and Meta-Artifacts (task.md, walkthrough.md, etc.), specifically targeting metadata (MD025), tables (MD060), duplicate headings (MD024), and spacing (MD022/MD032/MD012).

***

## ACTIVATION TRIGGERS

### When to Load This Skill

- When processing, populating, or formatting new `contexts/*.md` files.
- When the IDE reports MD025 (Multiple top-level headings), MD060 (Table column pipe mapping), or MD024 (Duplicate headings) in context files.
- When the user asks to "fix the formatting" or "clear the lint errors" on a context file.

### Strong Signal Phrases

- "fix metadata errors in context"
- "fix the table pipes"
- "resolve MD025"
- "duplicate guidance headings"
- "format the new context file"
- "clear the markdown problems"

***

## BEHAVIORAL WORKFLOW: THE 3-STEP CONTEXT FORMAT

When instructed to format a new context file, immediately apply these three transformations using the `multi_replace_file_content` tool.

### 1. Fix Top-Level Metadata (MD025)

The context file templates frequently arrive with metadata formatted as H1 tags at the top of the file, directly underneath the primary title. This triggers MD025 because markdown files should only have a single `# H1` heading.

**Action:** Convert all secondary metadata hashes into bold markdown descriptors. Fix any broken line continuations.

*From:*

```markdown
**Version:** Gold v2.0
**Type:** Context File
```

*To:*

```markdown
**Version:** Gold v2.0
**Type:** Context File
```

### 2. Fix Table Separators (MD060)

The context templates use compressed table alignment pipes without proper whitespace (e.g., `|--------|-------|`). The markdown linter requires spaces around the pipes for aligned column styles.

**Action:** Replace tight table separators with standard spaced separators (`| --- |`). Do this for EVERY table in the file.

*From:*

```markdown
| Metric | Current Value | Target | Why It Matters |
| --- | --- | --- | --- |
```

*To:*

```markdown
| Metric | Current Value | Target | Why It Matters |
| --- | --- | --- | --- |
```

### 3. Fix Duplicate Headings (MD024)

Context templates strategically repeat section headings like `### Guidance for Anti-Gravity` or `### [Flow Name]` across multiple sections. Markdown linters flag this as an MD024 collision.

**Action:** Suffix the duplicate heading with a parenthetical descriptor tied to its parent section, making it unique across the document.

*From:*

```markdown
## FRONTEND STACK
...
### Guidance for Anti-Gravity
```

*To:*

```markdown
## FRONTEND STACK (SKILL: CONTEXT FORMATTING)
...
### Guidance for Anti-Gravity (Frontend)
```

### 4. Fix Meta-Artifact Spacing (MD022, MD032, MD012)

Meta-artifacts like `task.md`, `walkthrough.md`, and `implementation_plan.md` often suffer from compressed spacing around lists and headings.

**Action:** Ensure exactly one blank line exists before and after every list and heading. Remove multiple consecutive blank lines.

*From:*

```markdown
- Done item
### Next Section
```

*To:*

```markdown
- Done item

### Next Section (FRONTEND STACK (SKILL:)
```

***

## EXECUTION STANDARDS

1. **Do not alter the primary content.** Only touch the formatting tags (`#`, `|---`, and heading names).
2. **Execute in one pass.** Group all replacements into a single `multi_replace_file_content` tool call containing multiple `ReplacementChunks` whenever possible to save time.
3. **Double-check uniqueness.** Before suffixing, ensure the new chosen heading name is globally unique in the file to properly satisfy MD024.
