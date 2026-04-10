# README — RUBRICS FOLDER

**Location:** `.antigravity/rubric/`
**Layer:** 10 — Evaluation
**Loading Tier:** 3 — **LOADED ON DEMAND**

***

## PURPOSE

This folder contains self-assessment matrices for evaluating quality
BEFORE delivery. Rubrics are the quality judges — they transform
subjective "is this good enough?" into structured evaluation with
specific criteria and clear pass/fail guidance.

Rubrics are loaded during Phase 7 (Critique) of the execution workflow.
They answer: "Does this work meet the quality bar?"

If templates help Anti-Gravity PRODUCE,
rubrics help Anti-Gravity JUDGE.

Without rubrics, Anti-Gravity can generate outputs.
With rubrics, it can judge whether those outputs meet a meaningful
standard — and distinguish work that is merely plausible from work
that is actually strong.

***

## WHAT RUBRICS ANSWER

- What does good look like in this domain?
- What dimensions should be checked before finalizing?
- Where is this output likely weak?
- Is this merely coherent, or actually strong?
- Is this ready to ship, merge, or recommend?

Rubrics are evaluators, not generators.

***

## INVENTORY

| # | File | Evaluates | Dimensions |
| :--- | :--- | :--- | :--- |
| 1 | [rubric-code-quality.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-code-quality.md) | Code implementation quality | Correctness, readability, maintainability, responsibility separation, scope discipline, error handling, testability, architectural fit, security, performance |
| 2 | [rubric-debugging.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-debugging.md) | Bug investigation and fix quality | Problem definition, evidence gathering, hypothesis quality, symptom vs cause separation, root cause, fix quality, verification, regression prevention, structural awareness |
| 3 | [rubric-architecture.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-architecture.md) | Architectural decision quality | Requirements clarity, boundary clarity, data ownership, options evaluation, tradeoff transparency, failure modes, simplicity, team fit, reversibility, implementation guidance |
| 4 | [rubric-ux.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-ux.md) | UI and UX quality | User goal clarity, state coverage, accessibility, responsive design, interaction feedback, visual consistency, error experience, cognitive load, implementation readiness |
| 5 | [rubric-security.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-security.md) | Security posture | Trust boundaries, authentication, authorization, input validation, data protection, secret management, blast radius, security headers, dependency security, auditability, misuse thinking, mitigation quality |
| 6 | [rubric-communication.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-communication.md) | Output communication quality | Structure, lead with answer, reasoning transparency, precision, calibrated depth, actionability, tradeoff honesty, mode alignment, tone and audience fit |
| 7 | [rubric-testing.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-testing.md) | Test quality and strategy | Coverage strategy, behavior vs implementation, test clarity, edge case coverage, independence, mock appropriateness, reliability, regression protection, feedback speed, maintainability |
| 8 | [rubric-performance.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-performance.md) | Performance optimization quality | Problem quantification, bottleneck identification, optimization targeting, measurement rigor, tradeoff awareness, regression safety, stopping discipline, system-level awareness, sustainability |
| 9 | [rubric-api.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-api.md) | API design and implementation | Contract clarity, URL correctness, response consistency, error handling, auth and authz, input validation, data exposure, pagination safety, backward compatibility, documentation, operational supportability |
| 10 | [rubric-release-readiness.md](file:///c:/Users/Oviks/antigravitygold/rubric/rubric-release-readiness.md) | Overall ship readiness | Functional completeness, code quality, test coverage, security posture, performance, UX readiness, data integrity, operational readiness, documentation, risk assessment |

***

## LOADING RULES

**Load ONLY during Phase 7 (Critique) or when explicitly evaluating
quality.** Rubrics are Tier 3 — never pre-loaded, never loaded "just
in case." Load the rubric that matches the current task.

| Task Type | Rubric to Load |
| :--- | :--- |
| After writing code | `rubric-code-quality.md` |
| After debugging | `rubric-debugging.md` |
| After architecture work | `rubric-architecture.md` |
| After UI work | `rubric-ux.md` |
| After security work | `rubric-security.md` |
| After delivering any significant response | `rubric-communication.md` |
| After writing tests | `rubric-testing.md` |
| After performance optimization | `rubric-performance.md` |
| After API work | `rubric-api.md` |
| Before shipping to production | `rubric-release-readiness.md` |

Use a rubric when:

- Quality judgment matters and the task is high-stakes
- The result should be benchmarked or compared
- The user explicitly wants a review or assessment
- Anti-Gravity should self-check before final output

***

## HOW RUBRICS WORK

Every rubric uses the same 4-level scoring system:

| Score | Meaning |
| :--- | :--- |
| **Excellent** | Exceeds the quality bar. Professional-grade output. |
| **Acceptable** | Meets the quality bar. Ready for delivery. |
| **Needs Work** | Below the quality bar. Improvement needed. May be deliverable with documented gaps. |
| **Failing** | Significantly below standards. Must be fixed before delivery. |

### Universal Blocking Rules

- **Security Failing** → ALWAYS blocks delivery
- **Correctness Failing** → ALWAYS blocks delivery
- **Any 3+ dimensions "Needs Work"** → Triggers review before delivery

***

## SKILL-TO-RUBRIC MAP

| Skill | Rubric |
| :--- | :--- |
| `skill-coding` | `rubric-code-quality.md` |
| `skill-debugging` | `rubric-debugging.md` |
| `skill-architecture` | `rubric-architecture.md` |
| `skill-ui-ux` | `rubric-ux.md` |
| `skill-security` | `rubric-security.md` |
| `skill-testing` | `rubric-testing.md` |
| `skill-performance` | `rubric-performance.md` |
| `skill-api-design` | `rubric-api.md` |
| `skill-review-audit` | `rubric-communication.md` |
| `skill-product-thinking` | `rubric-release-readiness.md` |

***

## INTERACTION WITH OTHER FOLDERS

| Folder | Relationship |
| :--- | :--- |
| `core/` | Rubrics implement the quality standards defined in `quality-bar.md`. The quality bar defines the universal floor; rubrics give domain-specific evaluation depth. |
| `skills/` | Each skill has a corresponding rubric. Skill = how to do it. Rubric = how to judge it. Rubrics evaluate the output of skill-driven work. |
| `workflows/` | Workflows invoke rubrics at Phase 7 (Critique). Rubrics are especially useful during the verify and critique phases of any workflow. |
| `templates/` | Filled templates can be evaluated using the corresponding rubric to judge whether the finished deliverable is actually high quality. |

***

## QUALITY BAR FOR FILES IN THIS FOLDER

A strong rubric:

- Defines meaningful, domain-specific criteria — not generic platitudes
- Uses the 4-level scoring system consistently
- Has specific criteria at each level — not vague descriptions
- Includes a scoring summary table
- Includes delivery decision guidance — when to block, when to ship with gaps
- Makes high-risk weaknesses visible quickly
- Helps Anti-Gravity avoid mistaking polish for quality
- Is evaluable in under five minutes — rubrics should be quick to apply
- Aligns with the real job of the domain it covers

A weak rubric:

- Is too generic — repeats the universal quality bar without adding specificity
- Uses criteria too vague to judge anything
- Contains dimensions that do not materially affect outcome quality
- Is used as box-checking theater rather than genuine judgment
- Treats plausible-sounding output as strong output

***

## COMMON MISTAKES TO AVOID

- Loading rubrics too early instead of using them during critique
- Treating rubric criteria as box-checking theater rather than real judgment
- Loading many rubrics at once when one task needs one rubric
- Writing rubric criteria too vaguely to apply in practice
- Using a domain rubric when the universal quality bar or a different rubric would be more appropriate
- Pre-loading rubrics before the task reaches the critique phase

***

## MAINTENANCE

Update rubrics when:

- Quality issues consistently slip through — rubric is missing a dimension
- A dimension is consistently irrelevant — rubric has noise to remove
- New quality concerns emerge from incidents or team feedback
- Corresponding skill files are updated with new quality expectations

Expected frequency: one to two updates per quarter.

***

## FINAL RULE

A rubric should make it harder for weak work to pass as strong work.
`rubrics/` should make Anti-Gravity better at knowing when its work
is truly good — and when it only looks good.
