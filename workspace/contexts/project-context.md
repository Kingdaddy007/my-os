# PROJECT CONTEXT

**Version:** Gold v2.0

**Type:** Context File

**Layer:** Context — Ground Truth

**Tier:** 2 — Loaded by task

**File:** contexts/project-context.md

**Loaded When:** Always loaded as the primary context anchor for any project-specific work. This is the FIRST context file loaded

**Purpose:** Grounds Anti-Gravity in what this product IS — who it serves what it does, why it exists, where it is in its lifecycle, and what constraints shape every decision made inside it

**Maintenance:** Review and update quarterly, or immediately after any significant pivot, target market change, or strategic shift

Stale project context is actively harmful — it causes Anti-Gravity to optimize for yesterday's priorities

---

## HOW ANTI-GRAVITY USES THIS FILE

This is the most important context file in the system. It shapes every
recommendation, every architectural suggestion, every scope decision, and
every tradeoff evaluation Anti-Gravity makes.

**When loaded**, Anti-Gravity will:

- Frame all solutions around YOUR users, their jobs, and their constraints
- Scope suggestions to your product's actual boundaries — not generic best
  practices divorced from reality
- Align technical tradeoffs with your business stage and strategic priorities
- Use your domain terminology consistently in all output
- Treat critical flows as high-sensitivity surfaces requiring elevated rigor
- Respect your team's capacity and decision-making structure when proposing
  work
- Tie product-facing recommendations to user behavior, business outcome, or
  operational value where possible

**When missing or incomplete**, Anti-Gravity will:

- Fall back to generic advice that may not fit your context
- Suggest features, patterns, or architectures that do not match your scale
  or stage
- Use wrong terminology or make assumptions about your domain
- Misjudge the appropriate complexity level for your team size and delivery
  reality

**When stale**, Anti-Gravity will:

- Optimize for yesterday's priorities instead of today's
- Misunderstand your current constraints and capacity

- Suggest work that conflicts with strategic shifts you have already made
- Treat resolved unknowns as still open, or open questions as settled

**Conflict rule:** If context from this file conflicts with another context
file, Anti-Gravity will flag the conflict explicitly rather than silently
choosing one over the other. Both files may need to be updated.

---

## CONTEXT FILE DESIGN PRINCIPLES

Every context file in this project — including this one — should:

1. **Be project-specific** — Describe reality, not generic advice. If a
   rule is universal, it belongs in `core/`. If a behavior is domain-
   specific, it belongs in `skills/`. If it is true for this project
   specifically, it belongs in `contexts/`.

2. **Avoid duplicating core or skills** — Context files ground the project.
   They do not re-teach reasoning patterns, skill behaviors, or engineering
   principles that already exist elsewhere in the system.

3. **Be update-friendly** — Easy to revise as the project evolves. Sections
   should be independently editable without requiring a full rewrite.

4. **Capture active truth, not wishful plans** — Distinguish current reality
   from intended future direction. Do not write what you hope will be true.
   Write what is true now.

5. **Be scoped cleanly** — One context file should have one primary grounding
   purpose. This file grounds project identity, users, and business reality.
   Stack details belong in `stack-context.md`. Architecture decisions belong
   in `architecture-context.md`.

---

## PROJECT IDENTITY

### Project Name
<!-- Fill in the project name. -->
[Project Name]

### One-Sentence Product Statement
<!-- WHY THIS MATTERS: Anti-Gravity uses this as the single anchor for
     every scope and tradeoff decision. When a feature request or
     architectural choice is unclear, this statement is the first filter.
     Does this fit what this product fundamentally is? -->

<!-- Template: "This project helps [user type] do [important job]
     with [main value proposition]." -->
[Fill in]

### What This Product Is
<!-- WHY THIS MATTERS: Anti-Gravity uses this to understand the fundamental
     nature of what is being built. Without this, it may suggest solutions
     appropriate for a different type of product — e.g., suggesting real-time
     collaboration patterns for a batch-processing tool, or enterprise-grade
     access controls for a consumer app. -->

<!-- Write one paragraph in plain language. No marketing language.
     What does the application actually DO for the person using it?
     Include: product type, target users, core job it performs,
     main workflows it supports, and any important scope boundaries
     (web-only, mobile, internal, etc.). -->
[Fill in]

### What This Product Is NOT
<!-- WHY THIS MATTERS: This prevents Anti-Gravity from suggesting features,
     architectures, or solutions that are outside the product's intentional
     boundaries. Without this, it may try to solve problems deliberately
     decided against. -->

<!-- Be explicit. What does this product deliberately not do?
     What adjacent problems does it not try to solve?
     What may users ask for that is currently out of scope? -->
- [Fill in]
- [Fill in]
- [Fill in]

### Project Type
<!-- Examples: SaaS product / internal business platform / e-commerce system
     / marketplace / productivity app / developer tool / enterprise workflow
     system / data platform / consumer app / educational platform / AI tool -->
[Fill in]

### Current Stage
<!-- WHY THIS MATTERS: Anti-Gravity calibrates its suggestions to your stage.
     An MVP needs speed and learning. A scaling product needs reliability
     and performance. A mature product needs maintainability and debt
     reduction. Getting this wrong means getting the tradeoff balance wrong. -->

<!-- Options: Pre-launch / MVP / Early Growth / Scaling / Mature /
     Maintenance Mode / Sunset -->
<!-- Add brief context: how long has it been live, rough user count,
     current focus. -->
[Fill in]

---

## USERS AND STAKEHOLDERS

### Primary Users
<!-- WHY THIS MATTERS: Anti-Gravity uses this to evaluate features, scope
     decisions, and UX tradeoffs from the perspective of YOUR actual users —
     not hypothetical generic users. Different user types have different
     priorities, permissions, and tolerances for complexity. -->

<!-- List each user type with: what role they play, what they are trying
     to do, how frequently they use the product, and their complexity
     tolerance. Be specific — "user" is too vague. -->

<!-- Template:
- **[User Type]** — [what they need from the product, usage frequency,
  complexity tolerance]
-->
- [Fill in]
- [Fill in]

### Secondary Users
<!-- Who uses the system less frequently or indirectly?
     Examples: managers, auditors, finance users, partner integrators,
     developers maintaining internal tools -->
- [Fill in]
- [Fill in]

### Key Stakeholders
<!-- Who influences product and technical priorities?
     Examples: founders, product managers, engineering leads,
     compliance/security stakeholders, enterprise clients -->
<!-- Anti-Gravity distinguishes between direct product users, internal
     operators, and business stakeholders — their goals often differ and
     sometimes conflict. -->
- [Fill in]
- [Fill in]

---

## CORE USER PROBLEMS

<!-- WHY THIS MATTERS: Naming the real problems users face helps Anti-Gravity
     evaluate whether proposed work actually addresses user pain — or just
     adds complexity without relief. Problems should be written in user or
     business terms, not in implementation language. -->

<!-- Template:
1. Users struggle to [problem].
2. Existing workflows are too [slow / manual / fragmented / error-prone].
3. Users need to [important job] without [main friction].
4. The business needs to [business need] with better [speed / accuracy /
   control / visibility].
-->

1. [Fill in]
2. [Fill in]
3. [Fill in]

---

## CORE JOBS-TO-BE-DONE

<!-- WHY THIS MATTERS: This is the single most important section for
     product-level reasoning. Anti-Gravity uses these jobs to evaluate
     whether proposed features actually serve real user needs, to suggest
     scope reductions that preserve core value, and to challenge feature
     requests that do not connect to a real job. These statements also
     help Anti-Gravity reason about feature design, prioritization, UX,
     product scope, instrumentation, and architecture around user value. -->

<!-- Frame each job as: "When [situation], I want to [motivation / action],
     so that I can [desired outcome]."
     Focus on the 3-5 most critical jobs — not an exhaustive list. -->

1. "When [situation], I want to [motivation], so that I can [outcome]."
2. "When [situation], I want to [motivation], so that I can [outcome]."
3. "When [situation], I want to [motivation], so that I can [outcome]."

---

## BUSINESS CONTEXT

### Revenue Model
<!-- WHY THIS MATTERS: Anti-Gravity uses this to evaluate the business impact
     of technical decisions. Payment flow is always high-security, high-
     reliability priority. Understanding pricing tiers affects feature
     scoping — which tier does this feature belong to? Understanding the
     revenue model helps Anti-Gravity avoid recommending technically elegant
     solutions that undermine the business model. -->

<!-- Examples: subscription SaaS, transaction fees, internal cost reduction,
     enterprise licensing, service revenue enablement, marketplace
     commissions, freemium with paid tiers -->
[Fill in]

### Key Business Metrics
<!-- WHY THIS MATTERS: Features that do not connect to a tracked metric are
     harder to justify and impossible to evaluate after shipping.
     Anti-Gravity uses these to tie technical recommendations to measurable
     business outcomes. -->

| Metric | Current Value | Target | Why It Matters |
| --- | --- | --- | --- |
| [Metric 1] | [Value] | [Target] | [Why] |
| [Metric 2] | [Value] | [Target] | [Why] |
| [Metric 3] | [Value] | [Target] | [Why] |

### Revenue and Value Drivers
<!-- List the main activities or outcomes that generate business value.
     Examples: successful paid conversion, retained active users, enterprise
     contract expansion, reduced operational cost, lower fraud/loss,
     faster support resolution -->
- [Fill in]
- [Fill in]
- [Fill in]

### Current Strategic Priorities
<!-- WHY THIS MATTERS: This directly shapes Anti-Gravity's tradeoff
     recommendations. When priorities conflict with the default hierarchy,
     these indicate which direction to lean. List the top 2-3 priorities
     RIGHT NOW with brief context. -->

1. **[Priority 1]** — [brief context on why this is the current focus]
2. **[Priority 2]** — [brief context on why this is the current focus]
3. **[Priority 3]** — [brief context on why this is the current focus]

---

## PRODUCT AREAS

<!-- List the main areas or capabilities of the system.
     This helps Anti-Gravity map feature requests to broader domains
     and understand which areas are high-sensitivity vs low-sensitivity. -->

<!-- Template:
- [Area Name] — [what it does]
-->
- [Fill in]
- [Fill in]
- [Fill in]

---

## CRITICAL USER FLOWS

<!-- WHY THIS MATTERS: Anti-Gravity treats critical flows as high-sensitivity
     surfaces when designing, reviewing, testing, or debugging. Failures in
     these flows have disproportionate business and user impact. -->

<!-- For each critical flow, define: who performs it, what the goal is,
     what failure looks like, and why it matters to the business. -->

### [Flow Name]

- **User:** [who performs this flow]
- **Goal:** [what they want to accomplish]
- **Failure looks like:** [what breaks when this goes wrong]
- **Why it matters:** [business / user impact of failure]

### [Flow Name 2]

- **User:** [who]
- **Goal:** [what]
- **Failure looks like:** [what breaks]
- **Why it matters:** [impact]

---

## TEAM CONTEXT

### Team Size and Structure
<!-- WHY THIS MATTERS: Anti-Gravity calibrates solution complexity to your
     team's capacity. A 4-person team cannot maintain a microservices
     architecture. A team without dedicated DevOps needs simpler
     infrastructure. Solutions must be maintainable by YOUR actual team. -->

<!-- Describe: number of engineers, specializations, whether there is
     dedicated QA, dedicated DevOps, design support, product management. -->
[Fill in]

### Development Cadence
<!-- WHY THIS MATTERS: Anti-Gravity uses this to scope suggestions
     appropriately. If you deploy weekly, a complex feature flag rollout
     strategy makes sense. If you deploy monthly, rapid A/B testing does
     not. Cadence shapes what kinds of operational complexity are realistic. -->

<!-- Describe: sprint length, deploy frequency, staging process,
     hotfix process, feature flag approach. -->
[Fill in]

### Decision-Making Context
<!-- WHY THIS MATTERS: Anti-Gravity needs to know who it is helping make
     decisions. If the user is the sole decision-maker, it can recommend
     directly. If decisions require consensus, it should frame
     recommendations for group evaluation. -->

<!-- Describe: who owns the roadmap, who owns technical decisions,
     how architecture decisions are made, who the primary Anti-Gravity
     user is and what decisions they can make independently. -->
[Fill in]

---

## DOMAIN TERMINOLOGY

<!-- WHY THIS MATTERS: Anti-Gravity will use these terms exactly as defined
     here in all output — code, explanations, variable names, and
     documentation. Using wrong terminology creates confusion and
     inconsistency. This is especially important when common words have
     specific meanings in your domain that differ from their general usage. -->

<!-- List every domain-specific term and its precise meaning.
     Include terms that might be confused with common alternatives. -->

| Term | Meaning | NOT the Same As |
| --- | --- | --- |
| [Term] | [Precise meaning in this product] | [What it should not be confused with] |
| [Term] | [Precise meaning] | [Common alternative to avoid] |
| [Term] | [Precise meaning] | [Common alternative to avoid] |

---

## KNOWN CONSTRAINTS

<!-- WHY THIS MATTERS: Anti-Gravity uses these to eliminate suggestions that
     violate real-world limitations. Without this, it may recommend solutions
     that are technically excellent but practically impossible given your
     resources, budget, policies, or compliance requirements. Be specific
     about WHY each constraint exists — the reason often matters as much
     as the constraint itself. -->

| Constraint | Type | Why It Exists | Implications |
| --- | --- | --- | --- |
| [Constraint 1] | [Capacity / Budget / Legal / Compliance / Expertise] | [Why] | [What this rules out or shapes] |
| [Constraint 2] | [Type] | [Why] | [Implications] |
| [Constraint 3] | [Type] | [Why] | [Implications] |

---

## USER ENVIRONMENT

<!-- WHY THIS MATTERS: Anti-Gravity uses this to make appropriate UX and
     performance decisions. If users are on slow connections, payload size
     matters more. If users are on mobile browsers, responsive design is
     critical. If peak usage is predictable, capacity planning changes.
     Knowing the environment prevents recommending solutions that work
     perfectly in development but fail in production conditions. -->

| Dimension | Details |
| --- | --- |
| Access method | [Web only / Mobile app / Desktop app / API-only / etc.] |
| Browser support | [List supported browsers and minimum versions] |
| Network conditions | [Generally good / Mixed / Often slow / Enterprise proxies / etc.] |
| Device types | [% desktop / % tablet / % mobile] |
| Average session | [Duration and frequency for active users] |
| Peak usage | [When does load spike — time of day, day of week, events] |
| Accessibility needs | [WCAG requirements, screen reader support, etc.] |
| Offline requirements | [Always-connected / Partial offline / Full offline] |

---

## QUALITY AND DELIVERY PRIORITIES

<!-- WHY THIS MATTERS: When priorities conflict — and they always do —
     this section tells Anti-Gravity which direction to lean. Generic best
     practices often assume a priority order that does not match your stage.
     This section overrides the default hierarchy with YOUR hierarchy. -->

### Priority Order for This Project
<!-- Rank these in order of importance for the current stage.
     This ordering shapes every recommendation Anti-Gravity makes when
     tradeoffs arise. -->

1. [Example: correctness and behavioral reliability]
2. [Example: speed of shipping and iteration]
3. [Example: UX clarity and user trust]
4. [Example: maintainability and code health]
5. [Example: performance and scalability]

### Non-Negotiables
<!-- What must never be compromised regardless of delivery pressure,
     timeline, or stage? These are the lines Anti-Gravity must protect. -->
- [What absolutely must not be cut or degraded]
- [What Anti-Gravity must protect even under pressure]
- [What would cause serious harm if compromised]

### Acceptable Tradeoffs
<!-- What can be relaxed temporarily or deferred at the current stage?
     This prevents Anti-Gravity from over-engineering areas where
     shortcuts are genuinely acceptable right now. -->
- [What can be simplified or deferred without serious consequence]
- [What is acceptable to do imperfectly at current stage]
- [What can wait until a later product or team maturity phase]

---

## PRODUCT RISKS AND HIGH-SENSITIVITY AREAS

<!-- WHY THIS MATTERS: Not all surfaces carry equal risk. Failures in
     high-sensitivity areas are disproportionately costly — they damage
     user trust, cause revenue loss, trigger compliance violations, or
     require expensive incident response. Anti-Gravity should escalate
     rigor, testing depth, and review care proportionally in these areas. -->

### Product Risks
<!-- What risks matter most to this product right now?
     Examples: user trust erosion, conversion loss, operational errors,
     compliance or data risk, support overload, low feature adoption,
     onboarding friction, revenue-impacting downtime, permissions
     exposure, data loss -->
- [Risk 1]
- [Risk 2]
- [Risk 3]

### High-Sensitivity Areas
<!-- List product surfaces where quality failures are especially costly.
     Anti-Gravity will automatically apply elevated rigor when working
     in or near these areas. -->
<!-- Examples: auth and access, payments, onboarding, billing,
     permissions, customer-facing reporting, notification accuracy,
     data exports, compliance workflows -->
- [Area 1] — [why failures here are especially costly]
- [Area 2] — [why failures here are especially costly]
- [Area 3] — [why failures here are especially costly]

---

## PRODUCT PRIORITIZATION HEURISTICS

<!-- WHY THIS MATTERS: When it is unclear whether a piece of work is worth
     doing, these signals help Anti-Gravity reason about relative priority.
     They prevent over-investment in low-leverage work and under-investment
     in high-leverage work. -->

### What Tends to Matter Most
<!-- What signals push work toward higher priority in this product? -->
- [Example: affects conversion or retention directly]
- [Example: reduces repeated high-volume support tickets]
- [Example: enables a major customer or enterprise use case]
- [Example: lowers risk in a critical workflow]
- [Example: removes a major operational bottleneck]

### What Tends to Matter Less
<!-- What is intentionally lower priority at the current stage? -->
- [Example: aesthetics in internal-only tools]
- [Example: performance optimization in low-traffic areas]
- [Example: edge case handling in rarely-used flows]

---

## KNOWN OPEN QUESTIONS

<!-- WHY THIS MATTERS: Anti-Gravity should not treat unresolved assumptions
     as settled facts. This section flags areas where context is incomplete
     or still evolving. When reasoning about these areas, Anti-Gravity
     should surface the uncertainty rather than silently filling the gap
     with a default assumption. -->

<!-- These are unresolved areas where assumptions may still be required.
     Update this section as questions are resolved. -->

- [Open question 1 — what is still unknown or unresolved]
- [Open question 2 — what is assumed but not confirmed]
- [Open question 3 — what may change soon and affect decisions]

---

## WHAT GOOD TECHNICAL WORK LOOKS LIKE IN THIS PROJECT

<!-- WHY THIS MATTERS: Generic engineering quality standards exist.
     But "good" has a project-specific meaning that depends on stage,
     team size, user needs, and business context. This section defines
     what quality means HERE — so Anti-Gravity does not apply the wrong
     standard for the wrong context. -->

<!-- Examples of what to include:
- Changes should improve user clarity and reduce friction in critical flows.
- Technical decisions should preserve delivery speed without creating
  avoidable fragility.
- Product-facing work should be measurable after release.
- Security-sensitive areas must favor safety over convenience.
- Critical workflows should be easy to observe, test, and debug.
- Scope should be kept lean unless there is strong evidence for broader
  investment.
- Recommendations should connect to user behavior, business outcome,
  or operational value — not just technical elegance. -->

- [What good looks like for this project]
- [What good looks like for this project]
- [What good looks like for this project]

---

## INSTRUCTIONS FOR ANTI-GRAVITY

When using this file, Anti-Gravity must:

1. **Interpret technical tasks relative to product goals** — not in
   isolation from the product's users, stage, and business context.

2. **Prioritize clarity around user and business impact** when making
   recommendations. "This is technically cleaner" is not a sufficient
   justification on its own.

3. **Treat critical flows as high-sensitivity surfaces.** Elevate rigor,
   test depth, and review care proportionally when working in or near
   these areas.

4. **Use product stage and delivery reality to calibrate complexity and
   rigor.** Do not apply enterprise-grade patterns to an MVP. Do not
   recommend startup-speed shortcuts in a mature, stability-critical
   product.

5. **Avoid recommending technically elegant solutions that do not fit
   the product's actual constraints** — team size, budget, delivery
   cadence, or user environment.

6. **When scoping features, prefer the smallest version that meaningfully
   serves the product goal.** Scope creep has a real cost in this context.

7. **Tie product-facing recommendations to user behavior, business
   outcome, or operational value** where possible. Generic best practices
   must be justified against this product's specific reality.

8. **If the request is purely technical, remain aware of what product
   surface it affects** — and whether that surface is high-sensitivity.

9. **If context from this file conflicts with another context file, flag
   the conflict explicitly** rather than silently choosing one. Both
   files may need to be updated.

10. **Do not treat this file as immutable.** Project context evolves.
    If information here appears outdated or inconsistent with what the
    user describes, surface the discrepancy and ask for a context update.
    Stale project context is actively harmful — it causes Anti-Gravity
    to optimize for yesterday's reality.

---

## CROSS-REFERENCES

<!-- WHY THIS MATTERS: This file is the primary context anchor, but it
     does not stand alone. Related context files extend and specialize
     the grounding this file provides. Anti-Gravity should load
     cross-referenced files when their domain is relevant to the task. -->

| Related Context File | Relationship |
| --- | --- |
| `stack-context.md` | Technical implementation details — languages, frameworks, infrastructure |
| `architecture-context.md` | How this product is structured internally — layers, boundaries, decisions |
| `build-status.md` | What is complete, in progress, deferred, and out of scope in the current build |
| `naming-conventions.md` | File, folder, variable, and domain naming rules and style decisions |
| `decision-log.md` | Important architectural and structural decisions that should not be forgotten |
| `business-priorities.md` | Detailed priority framework and tradeoff overrides for this product |
| `domain-rules.md` | Business logic rules that implement this product's specific behavior |
| `skill-registry.md` | Canonical list of skills, their phase placement, and current status |
| `file-format-standards.md` | Preferred spec-style file structure for skills and similar artifacts |

---

## RECOMMENDED EARLY CONTEXT FILES

<!-- If this is the first context file being created for this project,
     these are the most valuable companion files to build next.
     Each addresses a distinct grounding dimension that this file
     does not cover. -->

```text
contexts/
├── project-context.md       ← this file — overall project grounding
├── build-status.md          ← what exists, what is pending, build phase
├── stack-context.md         ← languages, frameworks, infrastructure
├── architecture-context.md  ← layer boundaries, live architecture decisions
├── naming-conventions.md    ← file/folder/variable naming rules
├── file-format-standards.md ← preferred spec-style format for skills/artifacts
├── skill-registry.md        ← canonical skill list with phase placement
└── decision-log.md          ← architectural decisions that must not be forgotten

Build these in the order listed — each one depends on the grounding
provided by the ones before it.
TEMPLATE FILL-IN SUMMARY
A quick reference for the sections that need to be populated when
deploying this file for a new project:
Required (Anti-Gravity is significantly degraded without these)
 Project Name and One-Sentence Product Statement
 What This Product Is
 What This Product Is NOT
 Current Stage
 Primary Users
 Core User Problems
 Core Jobs-to-be-Done
 Current Strategic Priorities
 Critical User Flows
 High-Sensitivity Areas
 Non-Negotiables
High Value (strongly recommended)
 Revenue Model
 Key Business Metrics
 Team Size and Structure
 Domain Terminology
 Known Constraints
 Known Open Questions
 Quality and Delivery Priority Order
Useful When Relevant
 Secondary Users and Key Stakeholders
 Development Cadence
 Decision-Making Context
 User Environment
 Product Risks
 Acceptable Tradeoffs
 What Good Technical Work Looks Like
FINAL RULE
This project context should guide Anti-Gravity toward decisions that make
sense for this specific product, its users, and its current stage — not
generic best practices divorced from reality.
When in doubt: serve the user's job. Respect the team's constraints.
Match the product's stage. Protect the high-sensitivity surfaces.
And when context is stale or missing — ask before assuming.
VERSION HISTORY
VersionDateChanges
VersionDateChanges
Gold v2.0
2026-03
Complete synthesis of all four versions. Full metadata header with maintenance schedule. "How Anti-Gravity Uses This File" section with loaded/missing/stale/conflict behaviors. Context File Design Principles from C. WHY THIS MATTERS commentary on every section from D. JTBD with full When/want/so-that framing from A. Business model, metrics table, and revenue drivers from D and A. Domain Terminology table from D. User Environment table from D. Known Constraints table from D. Quality/Delivery Priorities triad from B. Non-Negotiables and Acceptable Tradeoffs from B. Product Risks and High-Sensitivity Areas from A. Prioritization Heuristics from A. Known Open Questions from B. Instructions for Anti-Gravity 10-rule list from A. Cross-References table from D. Recommended Early Context Files from C. Template Fill-In Summary new addition. Final Rule from B.
AUTHORITATIVENESS
If another file appears to contradict this one on the current project
identity, user reality, business context, or product stage, this file
is authoritative unless an explicit project-level override is documented
in decision-log.md or another designated context file.
