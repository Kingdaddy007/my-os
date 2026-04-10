# README — TEMPLATES FOLDER

**Location:** `~/.gemini/antigravity/global_templates/`
**Layer:** 9 — Output Contracts
**Loading Tier:** 3 — **LOADED ON DEMAND**

***

## PURPOSE

This folder contains standardized output scaffolds for common
deliverables. When Anti-Gravity needs to produce a specific type of
document — an architecture decision record, a debug report, a feature
plan — it loads the corresponding template to ensure consistent,
comprehensive output.

Templates help Anti-Gravity produce:

- Consistent and professional artifacts
- Repeatable and scannable deliverables
- Outputs that humans can actually use and review later

This folder is about delivery shape, not reasoning. Templates do not
define domain behavior — they define output scaffolding.

Templates are NOT filled in advance. They are empty structures loaded
at the moment of use and filled with task-specific content.

***

## WHAT TEMPLATES ANSWER

- What should this deliverable look like?
- What sections must be present?
- What information should be captured so the output is reusable and reviewable?

Templates are the containers that hold reasoning in a consistent,
reusable form — not the reasoning itself.

***

## INVENTORY

| # | File | When to Use | Referenced By |
| :--- | :--- | :--- | :--- |
| 1 | [architecture-decision-record.md](file:///C:/Users/Oviks/.gemini/antigravity/global_templates/architecture-decision-record.md) | Documenting Type 1 or 1.5 architectural decisions | `workflow-plan-architecture.md` |
| 2 | [debug-report.md](file:///C:/Users/Oviks/.gemini/antigravity/global_templates/debug-report.md) | Documenting significant bug investigations — P1, P2, or recurring | `workflow-debug-issue.md` |
| 3 | [code-review-report.md](file:///C:/Users/Oviks/.gemini/antigravity/global_templates/code-review-report.md) | Delivering formal code review findings | `workflow-review-code.md` |
| 4 | [feature-plan.md](file:///C:/Users/Oviks/.gemini/antigravity/global_templates/feature-plan.md) | Scoping a new feature — single-sprint scope | `workflow-build-feature.md`, `skill-product-thinking` |
| 5 | [prd-template.md](file:///C:/Users/Oviks/.gemini/antigravity/global_templates/prd-template.md) | Comprehensive requirements for multi-sprint initiatives | Major initiative planning |
| 6 | [risk-assessment.md](file:///C:/Users/Oviks/.gemini/antigravity/global_templates/risk-assessment.md) | Evaluating risks for major decisions or changes | Type 1 decisions, major deployments |

***

## LOADING RULES

**Load ONLY when producing that specific deliverable type.**
Templates are Tier 3 — never pre-loaded, never loaded "just in case."
Do not load templates unless the task actually calls for that deliverable
shape.

| Situation | Template to Load |
| :--- | :--- |
| Making an architectural decision | `architecture-decision-record.md` |
| Completing a significant bug fix | `debug-report.md` |
| Delivering a code review | `code-review-report.md` |
| Scoping a new feature | `feature-plan.md` |
| Planning a major initiative | `prd-template.md` |
| Assessing risk before a big change | `risk-assessment.md` |

Use a template when:

- The user wants a formalized artifact
- The task naturally produces a reusable document
- Consistency matters more than an ad hoc response shape

***

## EVERY TEMPLATE CONTAINS

Every template file follows the same required structure:

1. **When to Use** — Clear criteria for when this template applies
2. **When NOT to Use** — Prevents using the wrong template for the job
3. **The Template** — Fill-in-the-blank scaffold with guided sections
4. **Quality Criteria** — Checklist for evaluating the filled output

***

## INTERACTION WITH OTHER FOLDERS

| Folder | Relationship |
| :--- | :--- |
| `workflows/` | Workflows specify which template to use at the output delivery stage. Templates are typically used at the Communicate phase — Phase 8 — of a workflow. |
| `core/` | Templates implement the output contracts and structure standards defined in `communication-standards.md`. |
| `skills/` | Skills generate the reasoning that fills the template. Skills do the domain work; templates shape the deliverable. |
| `rubrics/` | Filled templates can be evaluated using the corresponding rubric. Rubrics judge whether the finished deliverable is actually high quality. |
| `contexts/` | Templates may reference context files for project-specific details and constraints. |

***

## QUALITY BAR FOR FILES IN THIS FOLDER

A strong template:

- Is immediately usable as a fill-in-the-blank scaffold
- Is easy to fill under pressure
- Covers the important sections without bloat
- Includes guided section headers with instructions
- Includes quality criteria for self-evaluation
- Specifies when to use AND when not to use
- Makes important sections hard to forget
- Produces output that a teammate can read without the template
- Helps the output remain useful even when produced quickly

A weak template:

- Is too vague or too bloated to use in practice
- Omits critical sections
- Overlaps heavily with another template
- Contains sections that nobody will realistically use
- Is so generic it adds no value over a normal response
- Has become disconnected from actual workflow needs

***

## COMMON MISTAKES TO AVOID

- Using a template when a normal direct answer would be better
- Filling templates with shallow content just because the sections exist
- Creating too many near-duplicate templates
- Turning templates into essays instead of usable forms
- Pre-loading templates before the task calls for them
- Loading multiple templates for one output

***

## MAINTENANCE

Expected frequency: one to two updates per quarter.
Update templates when output quality consistently misses important
sections or workflow changes require a different deliverable shape.

***

## FINAL RULE

Templates should make strong work easier to deliver consistently —
not harder to produce. Outputs should be more reusable, more consistent,
and easier for humans and AI to work with later.
