# README — MEMORY FOLDER

**Location:** `.antigravity/memory/`
**Layer:** 12 — Institutional Learning
**Loading Tier:** 3 — **LOADED ON DEMAND**

***

## PURPOSE

This folder is Anti-Gravity's long-term memory — the institutional
knowledge that makes it get smarter over time instead of starting from
zero every conversation.

These files capture decisions made, patterns learned, mistakes identified,
and performance tracked. They prevent repeated debates, repeated mistakes,
and the loss of hard-won knowledge.

Without memory, the same debates repeat, the same mistakes return,
decisions lose context, and improvements become impossible to verify.

With memory, past choices remain visible, recurring patterns become
explicit, and future work starts from prior learning instead of
rediscovery. This is the layer that helps the system become more
cumulative — and more experienced — over time.

***

## WHAT THIS FOLDER ANSWERS

- What important decisions have already been made and why?
- What patterns work well in this project?
- What mistakes keep recurring?
- What did previous incidents teach us?
- How has the system changed over time?
- What benchmark evidence shows improvement or weakness?

***

## DIFFERENCE FROM CONTEXTS

| `contexts/` | `memory/` |
| :--- | :--- |
| Current project reality and standards | Accumulated historical learning and decisions |
| What is true right now | What was learned over time |
| Stable until the project changes | Grows continuously with each decision and incident |
| Loaded based on task domain | Loaded when historical continuity matters |

***

## INVENTORY

| # | File | What It Captures | Updated When |
| :--- | :--- | :--- | :--- |
| 1 | [decisions-log.md](file:///C:/Users/Oviks/.gemini/antigravity/memory/decisions-log.md) | Significant technical decisions and their reasoning | After any Type 1 or Type 1.5 decision |
| 2 | [common-patterns.md](file:///C:/Users/Oviks/.gemini/antigravity/memory/common-patterns.md) | Reusable patterns that work well in this project | When a pattern proves valuable across three or more uses |
| 3 | [mistakes-to-avoid.md](file:///C:/Users/Oviks/.gemini/antigravity/memory/mistakes-to-avoid.md) | Mistakes that have been made and their root causes | After any bug, incident, or architectural mistake |
| 4 | [benchmark-results.md](file:///C:/Users/Oviks/.gemini/antigravity/memory/benchmark-results.md) | Anti-Gravity performance scores over time | After running benchmark tests |
| 5 | [postmortems.md](file:///C:/Users/Oviks/.gemini/antigravity/memory/postmortems.md) | Post-incident analysis and lessons learned | After P1 or P2 incidents |
| 6 | [version-notes.md](file:///C:/Users/Oviks/.gemini/antigravity/memory/version-notes.md) | Changes to the Anti-Gravity system itself | When core, skills, or workflows are updated |

***

## LOADING RULES

**Load ONLY when past decisions or patterns are relevant to the current
task.** Memory files are Tier 3 — never pre-loaded, never loaded by
default. Load the specific memory file that matters.

| Situation | Memory File to Load |
| :--- | :--- |
| Making a decision similar to one already made | `decisions-log.md` |
| Implementing something with a known pattern | `common-patterns.md` |
| Working in an area where past mistakes occurred | `mistakes-to-avoid.md` |
| Testing or comparing Anti-Gravity capabilities | `benchmark-results.md` |
| Investigating an incident similar to a past one | `postmortems.md` |
| Updating Anti-Gravity system files | `version-notes.md` |

Load memory when:

- A past decision is relevant to the current choice
- A repeated issue is appearing
- A benchmark comparison is being made
- A postmortem or version analysis is needed
- The task involves an area with known historical traps

***

## HOW MEMORY FILES WORK

Memory files are **append-only logs** — entries are added over time,
not rewritten. Each entry is timestamped and contextual. Historical
entries are never deleted — corrections are added as new entries.

***

## INTERACTION WITH OTHER FOLDERS

| Folder | Relationship |
| :--- | :--- |
| `core/` | Memory supports the core principle of versioning over drift. Memory captures institutional learning without changing the stable kernel directly. |
| `skills/` | Patterns and mistakes discovered through real work may trigger updates to skill files. Memory may explain why certain skill behaviors exist. |
| `workflows/` | Workflow completion may trigger memory entries — for example, post-deployment updates to decisions-log. Workflows may produce learning that should later be distilled here. |
| `rubrics/` | Rubric gaps discovered via incidents trigger updates to both rubrics and mistakes-to-avoid. |
| `benchmarks/` | Benchmark files define the test scenarios. Memory stores the historical results and score trends. |
| `contexts/` | Decisions logged here may trigger context file updates. Memory may explain why certain context standards exist. |

***

## INSTRUCTIONS FOR ANTI-GRAVITY

When using this folder:

1. Treat memory as selective institutional recall — not default context.
2. Load only the memory file relevant to the current task.
3. Use memory to reduce repeated mistakes and repeated debates.
4. Distinguish historical rationale from current truth.
5. If a previous decision exists, surface it before re-litigating the topic.
6. If the same issue keeps recurring, check `mistakes-to-avoid.md` and `postmortems.md`.
7. Use benchmark results to judge whether system changes are actually improving performance.
8. Update memory after meaningful decisions, incidents, or version changes.
9. Keep memory entries concise enough to retrieve and trust.
10. Use this folder to build continuity — not just knowledge.

***

## QUALITY BAR FOR FILES IN THIS FOLDER

A strong memory entry:

- Is timestamped
- Includes context — not just the conclusion
- Includes the lesson — what to do differently next time
- Is tagged for searchability
- Captures why something happened, not just what happened
- Is specific enough to be useful in a future task
- Reduces repeated mistakes and repeated debates

A weak memory entry:

- Is vague with no rationale
- Stores conclusions with no reasoning
- Duplicates context files instead of preserving historical learning
- Captures information no future task will actually use
- Is too noisy to retrieve meaningfully

***

## STATUS

**These files are NOT YET BUILT as templates.** They are a planned
phase of the build. When built, each file will have:

- Clear entry format with examples
- Guidance on when to add entries
- Tagging conventions for searchability

These are LIVING DOCUMENTS — they start empty and grow over time as
Anti-Gravity is used. The value comes from accumulation, not from
initial content.

***

## MAINTENANCE

Memory files grow continuously. Periodic maintenance schedule:

| Trigger | Action |
| :--- | :--- |
| Quarterly | Review `decisions-log.md` for decisions that should be reconsidered |
| Quarterly | Review `mistakes-to-avoid.md` for patterns that have since been fixed |
| After system updates | Add entry to `version-notes.md` |
| After incidents | Add entry to `postmortems.md` |
| After benchmark runs | Update `benchmark-results.md` |

No scheduled deletion — historical entries remain for context.

***

## FINAL RULE

Memory should reduce repeated confusion and increase continuity of
judgment across time. It should make Anti-Gravity not just knowledgeable,
but experienced.
