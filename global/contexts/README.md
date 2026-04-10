# README — CONTEXTS FOLDER

**Location:** `.antigravity/contexts/`
**Layer:** 6 — Ground Truth
**Loading Tier:** 2 — **LOADED BY TASK**

***

## PURPOSE

This folder contains YOUR project's ground truth. While `skills/`
provide universal engineering expertise, context files ground that
expertise in YOUR actual technology stack, YOUR conventions, YOUR
architecture, YOUR business priorities, and YOUR domain rules.

Without this folder, Anti-Gravity remains a strong general engineer.
With this folder, it becomes a strong engineer for THIS specific project.

Skills tell Anti-Gravity HOW to think.
Contexts tell Anti-Gravity WHAT WORLD it is thinking inside.

Without context, strong skills still produce generic output.

**These files are templates that YOU fill in.** Anti-Gravity does not
generate the content — you provide your project's actual details.

***

## WHAT THIS FOLDER ANSWERS

- What product are we building?
- Who are the users?
- What stack are we using?
- What architecture already exists?
- What standards should code and APIs follow?
- What domain rules are non-negotiable?
- What business priorities shape decisions right now?
- What runtime and deployment reality must be respected?

***

## INVENTORY

### Technical Context

| # | File | What It Grounds | Key Contents |
| :--- | :--- | :--- | :--- |
| 1 | [project-context.md](file:///c:/Users/Oviks/antigravitygold/contexts/project-context.md) | What the product IS | Users, Jobs-to-be-Done, business stage, constraints |
| 2 | [stack-context.md](file:///c:/Users/Oviks/antigravitygold/contexts/stack-context.md) | What technologies are used | Languages, frameworks, libraries, versions, tools |
| 3 | [architecture-context.md](file:///c:/Users/Oviks/antigravitygold/contexts/architecture-context.md) | How the code is organized | Folder structure, patterns, data flow, module boundaries, ADRs |
| 4 | [coding-standards.md](file:///c:/Users/Oviks/antigravitygold/contexts/coding-standards.md) | How code is written | Naming, imports, exports, TypeScript, components, git conventions |
| 5 | [testing-standards.md](file:///c:/Users/Oviks/antigravitygold/contexts/testing-standards.md) | How testing is done | Strategy, stack, what to test, mock boundaries, CI requirements |

### Security and Design Context

| # | File | What It Grounds | Key Contents |
| :--- | :--- | :--- | :--- |
| 6 | [security-baselines.md](file:///c:/Users/Oviks/antigravitygold/contexts/security-baselines.md) | How security is enforced | Auth, authz, validation, secrets, headers, CORS, compliance |
| 7 | [design-system.md](file:///c:/Users/Oviks/antigravitygold/contexts/design-system.md) | How UI looks and behaves | Tokens, components, interactions, responsive, accessibility |

### Data and API Context

| # | File | What It Grounds | Key Contents |
| :--- | :--- | :--- | :--- |
| 8 | [database-context.md](file:///c:/Users/Oviks/antigravitygold/contexts/database-context.md) | How data is stored and accessed | Schema conventions, tables, access patterns, indexing, migrations |
| 9 | [api-conventions.md](file:///c:/Users/Oviks/antigravitygold/contexts/api-conventions.md) | How APIs are designed | URL structure, methods, request and response format, auth, pagination |

### Business and Operations Context

| # | File | What It Grounds | Key Contents |
| :--- | :--- | :--- | :--- |
| 10 | [domain-rules.md](file:///c:/Users/Oviks/antigravitygold/contexts/domain-rules.md) | What business rules the product enforces | Invariants, state machines, validation, calculations, terminology |
| 11 | [business-priorities.md](file:///c:/Users/Oviks/antigravitygold/contexts/business-priorities.md) | What matters most RIGHT NOW | Ranked priorities, tradeoff overrides, what we are NOT doing |
| 12 | [infra-context.md](file:///c:/Users/Oviks/antigravitygold/contexts/infra-context.md) | How the product runs operationally | Hosting, CI/CD, monitoring, incidents, scaling, DR, costs |

***

## LOADING RULES

**Load a MAXIMUM of 4 context files per task.** Start lean, add if needed.
Do not load all context files by default. Context overload is real.

The `activation-engine.md` in `core/` defines which context files to
load for each task type.

| Task Type | Context Files to Load |
| :--- | :--- |
| Any code task | `stack-context.md` + `coding-standards.md` |
| New feature | + `architecture-context.md` + `project-context.md` |
| Database work | + `database-context.md` |
| UI work | + `design-system.md` |
| API work | + `api-conventions.md` |
| Security work | + `security-baselines.md` |
| Test writing | + `testing-standards.md` |
| Deployment | + `infra-context.md` |
| Scoping / prioritization | + `business-priorities.md` + `domain-rules.md` |
| Business logic | + `domain-rules.md` |
| Architecture planning | + `architecture-context.md` + `business-priorities.md` |
| Debugging | + `stack-context.md` + `architecture-context.md` + relevant domain rules |

***

## EVERY CONTEXT FILE CONTAINS

Every context file follows a consistent structure:

1. **How Anti-Gravity Uses This File** — What changes when loaded, missing, or stale
2. **WHY guidance on every section** — Why each section matters, not just what to fill in
3. **Guided examples** — Illustrative content for reference
4. **Cross-references** — Which other context files relate to this one
5. **Maintenance schedule** — How often to review and update

***

## CRITICAL DIFFERENCE FROM SKILLS

| Aspect | Skills | Contexts |
| :--- | :--- | :--- |
| Content type | Universal behavioral instructions | Project-specific facts |
| Who writes it | Built into the system | YOU — filled in by the user |
| Applicability | Any project, any stack | YOUR project only |
| Stability | Changes rarely | Changes as your project evolves |
| Loading | Based on task mode | Based on task domain |

***

## WHAT CONTEXT FILES SHOULD CONTAIN

Context files should contain:

- Facts
- Constraints
- Stable rules
- Environment-specific truths
- Project-specific preferences
- Real tradeoff posture

They should not be:

- Motivational or aspirational
- Generic or theoretical
- Bloated with irrelevant detail
- Filled with behavioral instructions — those belong in `skills/` or `core/`

A good context file is crisp, specific, updateable, and operational.
It describes actual project reality, not the ideal state.

***

## INTERACTION WITH OTHER FOLDERS

| Folder | Relationship |
| :--- | :--- |
| `core/` | Core defines universal rules and is stable across projects. Contexts provide the specific facts those rules operate on. Core is the mind; contexts are the ground truth. |
| `skills/` | Skills define HOW to think in a domain. Contexts define the specific environment to think ABOUT. Skill plus Context equals grounded expert behavior. |
| `workflows/` | Workflows rely on contexts to ground their execution steps in project reality. Workflows specify which context files to load at each step. |
| `templates/` | Templates may reference context files when producing project-specific output. |
| `rubrics/` | Rubrics judge quality. Contexts help define what "good" means for this specific project. |

***

## CONTEXT GAP HANDLING

When a context file is empty or missing:

1. **Name the gap** — "I need [specific context] but [file] is not populated."
2. **Ask** for the specific information needed.
3. **If unavailable** — state assumptions clearly and flag them as assumptions.
4. **NEVER silently guess** when context is missing.

A context file that is stale or inaccurate is worse than no context file.
Context files should be revised as the real project changes.

***

## QUALITY BAR FOR FILES IN THIS FOLDER

A strong context file:

- Describes real project truth, not aspirational theory
- Is filled with YOUR actual project details — not left as a template
- Is specific enough to reduce ambiguity for real tasks
- Makes recommendations more accurate and specific
- Defines important constraints clearly
- Is kept current enough to remain useful
- Includes the "How Anti-Gravity Uses This" section
- Includes maintenance schedule guidance

A weak context file:

- Is too generic — could describe any project
- Duplicates skills or core files
- Is stale or inaccurate relative to the real project
- Lists facts without helping decisions
- Describes ideal state instead of actual project reality
- Contains behavioral instructions that belong in `skills/` or `core/`

***

## COMMON MISTAKES TO AVOID

- Writing context files as generic templates and never filling them in
- Putting behavioral instructions here that belong in `skills/` or `core/`
- Describing architecture or standards as they "should be" rather than as they really are
- Failing to update contexts as the project evolves
- Loading too many contexts when only a few are needed
- Treating contexts as always-on — they are loaded by relevance

***

## MAINTENANCE

| File | Update Frequency | Update Trigger |
| :--- | :--- | :--- |
| `project-context.md` | Quarterly | Pivot, new users, business change |
| `stack-context.md` | On change | Any dependency version change, new library |
| `architecture-context.md` | On change | Folder restructure, new pattern, new module |
| `coding-standards.md` | On team agreement | New convention adopted |
| `testing-standards.md` | On change | New test tool, changed strategy |
| `security-baselines.md` | Quarterly + on change | Auth change, new compliance requirement |
| `design-system.md` | On change | New component, new token, design evolution |
| `database-context.md` | On change | New table, schema change, new index |
| `api-conventions.md` | On change | New endpoint pattern, auth change |
| `domain-rules.md` | On discovery | Bug reveals unknown rule, new state machine |
| `business-priorities.md` | Monthly | Strategic shift, priority change |
| `infra-context.md` | On change | New service, CI/CD change, monitoring change |

***

## FINAL RULE

A context file should make Anti-Gravity more accurate inside this
project than it would be with general knowledge alone.

`contexts/` should make Anti-Gravity less generic and more right.
