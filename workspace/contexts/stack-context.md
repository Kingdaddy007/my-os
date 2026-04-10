# STACK CONTEXT

**Version:** Gold v2.0

**Type:** Context File

**Layer:** Context — Ground Truth

**Tier:** 2 — Loaded by task

**File:** contexts/stack-context.md

**Loaded When:** Any task involving code generation, debugging, architecture performance analysis, dependency decisions, or technical choices. Loaded alongside project-context.md for all substantive technical work

**Purpose:** Defines the exact technology stack — languages, frameworks versions, tools, and runtime environment. Anti-Gravity uses this to generate code and make recommendations that match YOUR environment precisely, not generic ecosystem defaults

**Maintenance:** Update immediately when any dependency version changes a new library is adopted, or a tool is replaced. Review fully every quarter

---

## HOW ANTI-GRAVITY USES THIS FILE

This file is the technical ground truth. It ensures that every line of
code Anti-Gravity generates targets YOUR exact stack — not generic
examples from a different environment.

**When loaded**, Anti-Gravity will:

- Generate code using YOUR framework version's syntax and APIs — not
  deprecated patterns or patterns from a different major version
- Import from YOUR libraries — not suggest alternatives you do not use
- Use YOUR package manager's commands (`pnpm add` not `npm install`)
- Respect YOUR version constraints when suggesting upgrades or new
  dependencies
- Write patterns compatible with YOUR runtime and build tooling
- Follow YOUR architectural defaults before introducing new primitives
- Prefer idiomatic solutions in the existing stack over recommending
  new tools

**When missing or incomplete**, Anti-Gravity will:

- Generate code that may target wrong framework versions (e.g., Pages
  Router when you use App Router)
- Suggest libraries already in your stack under different names, or
  suggest competing libraries you have deliberately excluded
- Use generic patterns that may not work with your specific version
  combinations
- Miss version-specific gotchas and compatibility issues

**When stale**, Anti-Gravity will:

- Generate code for old versions you have already upgraded past
- Miss new APIs and patterns available in your current versions
- Suggest dependencies that conflict with your current version
  constraints

**Conflict rule:** If stack details here conflict with another context
file, Anti-Gravity will flag the conflict explicitly rather than silently
choosing one. Both files may need to be updated.

---

## CURRENT STACK REALITY

<!-- WHY THIS MATTERS: For projects that are not yet deployed as
     conventional applications — or that are in a spec/build phase —
     this section defines the actual current implementation medium.
     Anti-Gravity uses this to avoid assuming a runtime stack that does
     not yet exist, and to understand what environment it is actually
     operating inside. -->

### What This Stack Currently Is
<!-- Describe the current implementation medium honestly.
     If this is a deployed application, summarize the full stack here.
     If this is still in a spec/design/build phase, describe that reality.

     Example (deployed application):
     "The project uses Next.js + TypeScript on the frontend, Node.js +
     NestJS on the backend, PostgreSQL for primary persistence, Redis
     for caching/queues, and Docker-based deployments through GitHub
     Actions into AWS ECS."

     Example (spec/build phase — like Anti-Gravity Gold):
     "This project is currently a file-based intelligence system. The
     implementation medium is Markdown. The project is organized as a
     layered directory architecture and is in a design/specification
     build phase, not yet a deployed application runtime." -->
[Fill in]

### What the Stack Is NOT Yet
<!-- WHY THIS MATTERS: Naming undecided technology choices prevents
     future files from assuming runtime decisions that have not been
     made. This section protects against premature lock-in and tells
     Anti-Gravity what NOT to assume. -->

<!-- List all technology choices that are still open — frontend framework,
     backend runtime, database engine, cloud provider, CI/CD tooling,
     observability platform, container model, API protocol. -->
- [Technology choice 1 — not yet decided]
- [Technology choice 2 — not yet decided]
- [Technology choice 3 — not yet decided]

### Current Safe Assumptions
<!-- List the stack assumptions that ARE stable right now — even if the
     full runtime stack is not yet finalized. These are the facts future
     files can safely rely on. -->
- [Safe assumption 1]
- [Safe assumption 2]
- [Safe assumption 3]

---

## STACK SUMMARY

<!-- WHY THIS MATTERS: Anti-Gravity uses this as the quick orientation
     anchor. When working on any technical task, this summary provides
     the first-pass context before diving into section-level detail. -->

<!-- Template:
     "The project is built with [frontend stack], [backend stack],
     [database], [deployment/runtime], and [key supporting tools].
     Primary development happens in [language(s)] using [framework(s)].
     The system is deployed via [deployment approach] and operated
     in [runtime environment]." -->
[Fill in]

---

## LANGUAGES

<!-- WHY THIS MATTERS: Anti-Gravity needs to know which languages are
     in play, which version features are available, and where each
     language is used. This prevents generating Python code for a
     TypeScript project or using language features not available in
     your version. -->

| Language | Version | Usage | Notes |
| --- | --- | --- | --- |
| [Language] | [Version] | [Where used] | [Any important notes] |
| [Language] | [Version] | [Where used] | [Any important notes] |

### Guidance for Anti-Gravity (Languages)

- Prefer idiomatic solutions in the project's primary language
- Do not suggest another language unless there is a strong, explicit
  reason
- Match naming, typing, and structure to the actual language ecosystem

---

## FRONTEND STACK

### Framework (Frontend)
<!-- WHY THIS MATTERS: The framework version determines which APIs,
     patterns, and features Anti-Gravity should use. Next.js App Router
     vs Pages Router produces completely different code. React 18 vs 19
     has different hook patterns. Getting this wrong means generating
     code that does not work in your environment. -->
[Fill in]

### State Management
<!-- WHY THIS MATTERS: Anti-Gravity uses this to generate the correct
     data-fetching and state patterns. If you use React Query, it should
     generate useQuery hooks — not useEffect + fetch. If you use Zustand,
     it should use Zustand stores — not Redux or Context. -->
[Fill in]

### Styling
<!-- WHY THIS MATTERS: Anti-Gravity generates styling code matching your
     approach. Tailwind classes vs CSS modules vs styled-components
     produce completely different output. The wrong approach creates code
     that cannot be merged without rewriting. -->
[Fill in]

### UI Component Library
<!-- WHY THIS MATTERS: Anti-Gravity needs to know which base components
     to use when building UI. Using Radix primitives vs Material UI vs
     custom components produces fundamentally different code structure
     and import paths. -->
[Fill in]

### Build and Bundling
<!-- WHY THIS MATTERS: Build tool configuration affects import patterns,
     tree-shaking behavior, and what optimizations are available. Package
     manager choice affects every CLI command Anti-Gravity suggests. -->
[Fill in]

### Key Frontend Libraries
<!-- WHY THIS MATTERS: Anti-Gravity should use THESE specific libraries
     instead of suggesting alternatives. If you use date-fns, it should
     not suggest moment.js or dayjs. This table is the authoritative list
     of what is in use. -->

| Library | Version | Purpose | Notes |
| --- | --- | --- | --- |
| [Library] | [Version] | [Purpose] | [Notes / exclusions] |
| [Library] | [Version] | [Purpose] | [Notes / exclusions] |

### Guidance for Anti-Gravity

- Prefer the stack's native patterns before introducing external
  alternatives
- Use existing state and data-fetching solutions unless there is a
  justified reason not to
- Match recommendations to the actual rendering and routing model
- Respect component, state, and styling conventions already in use
- Do not suggest libraries that are explicitly excluded above

---

## BACKEND STACK

### Runtime
<!-- WHY THIS MATTERS: Runtime version determines available APIs and
     performance characteristics. Node 18 vs 20 vs 22 have different
     built-in APIs (fetch, test runner, WebSocket). Getting this wrong
     means suggesting APIs that do not exist in your environment. -->
[Fill in]

### Framework (Backend)
<!-- WHY THIS MATTERS: Determines how API endpoints are structured,
     how middleware works, and what server-side patterns to apply.
     NestJS modules vs Express middleware vs Next.js route handlers
     produce completely different code. -->
[Fill in]

### API Architecture
<!-- WHY THIS MATTERS: Anti-Gravity needs to know the API style to
     generate correct endpoint code, error handling, and response
     formatting. REST vs GraphQL vs tRPC vs Server Actions each
     require fundamentally different patterns. -->
[Fill in]

### Authentication and Authorization
<!-- WHY THIS MATTERS: Auth is high-security, high-stakes code.
     Anti-Gravity must use YOUR exact auth implementation — not generate
     generic patterns that may conflict with your session management,
     token strategy, or role model. -->
[Fill in]

### Background Jobs / Queues
<!-- What handles async processing — emails, reports, exports, scheduled
     work? List the queue system, backing store, and how jobs are
     defined and consumed. -->
[Fill in]

### Validation and Serialization
<!-- What library handles input validation and request/response
     serialization? Is it shared between frontend and backend? -->
[Fill in]

### Key Backend Libraries
<!-- WHY THIS MATTERS: Same as frontend — Anti-Gravity should use YOUR
     libraries, not suggest alternatives. This table is the authoritative
     list of what is in the backend dependency tree. -->

| Library | Version | Purpose | Notes |
| --- | --- | --- | --- |
| [Library] | [Version] | [Purpose] | [Notes / exclusions] |
| [Library] | [Version] | [Purpose] | [Notes / exclusions] |

### Guidance for Anti-Gravity (Backend)

- Follow framework-native patterns first
- Match middleware, validation, and controller/service layering to the
  current backend architecture
- Do not recommend patterns that conflict with the actual runtime model
- Respect the project's error handling, request lifecycle, and
  dependency injection style
- Do not suggest libraries that are explicitly excluded above

---

## DATABASE

<!-- WHY THIS MATTERS: Anti-Gravity uses this to write correct queries,
     suggest appropriate indexing, and respect your ORM and migration
     patterns. Using the wrong query style or migration approach can
     produce code that is incompatible with your toolchain.
     See database-context.md for full schema details. -->

### Primary Database
<!-- Database engine, version, hosting, instance size, and connection
     limits. Include ORM in use and any exceptions where raw SQL is used
     instead. -->
[Fill in]

### Schema Management
<!-- What tool manages migrations? Where do migration files live? How
     are migrations reviewed and applied? -->
[Fill in]

### Caching
<!-- What caching layer is in use, if any? What IS it used for?
     What is it explicitly NOT used for? Any application-level caching? -->
[Fill in]

### Other Data Stores
<!-- File storage, search engines, analytics databases, event stores,
     or any secondary data layer. Include size limits and key
     constraints. -->
[Fill in]

### Guidance for Anti-Gravity (Database)

- Prefer data access and migration approaches that match the project's
  actual tooling
- Do not recommend schema or query patterns that conflict with the
  chosen database model unless explicitly proposing a change
- Match indexing, relationship, and migration advice to the real
  storage engine and access layer
- Respect the ORM's conventions for relationships, transactions,
  and schema evolution

---

## INFRASTRUCTURE OVERVIEW

<!-- WHY THIS MATTERS: Gives Anti-Gravity awareness of deployment
     constraints, timeout limits, hosting characteristics, and
     operational boundaries. Without this, it may suggest patterns
     that work locally but fail in your actual runtime environment.
     See infra-context.md for full infrastructure details. -->

| Component | Provider | Service | Key Constraints |
| --- | --- | --- | --- |
| [Component] | [Provider] | [Service] | [Timeout / size / region / tier limits] |
| [Component] | [Provider] | [Service] | [Key constraints] |
| [Component] | [Provider] | [Service] | [Key constraints] |

### Guidance for Anti-Gravity (Infrastructure)

- Make deployment and operability recommendations that fit the actual
  runtime environment
- Prefer observability and deployment approaches consistent with the
  current infra maturity
- If the project lacks IaC or observability depth, acknowledge that
  instead of assuming mature infrastructure exists
- Respect hosting constraints — timeouts, connection limits, cold
  start behavior, and regional restrictions

---

## API AND INTEGRATION ENVIRONMENT

<!-- WHY THIS MATTERS: Anti-Gravity needs to understand what external
     systems this stack integrates with. Third-party APIs impose their
     own rate limits, retry requirements, idempotency expectations, and
     failure modes. Ignoring these leads to integration code that works
     in testing but fails in production. -->

### Internal Interfaces
<!-- How do internal services or layers communicate?
     Examples: REST between services, gRPC internal comms,
     Server Actions for mutations, event-driven boundaries -->
- [Fill in]
- [Fill in]

### External Integrations
<!-- What third-party services does this system integrate with?
     Examples: Stripe, Twilio, SendGrid, Slack, Auth provider,
     CRM, ERP, data providers -->
- [Service] — [what it is used for, any key constraints]
- [Service] — [what it is used for, any key constraints]

### Webhooks and Events
<!-- Are there inbound webhooks, outbound event streams, or pub/sub
     systems? List what receives webhooks, what emits events, and
     any signing/verification requirements. -->
- [Fill in]
- [Fill in]

### Guidance for Anti-Gravity (Integrations)

- Consider third-party integration constraints when designing features
  or debugging flows
- Remember external APIs impose their own rate limits, retry
  expectations, and idempotency requirements
- Match integration recommendations to existing patterns and SDK usage
- Do not recommend re-implementing integrations that already exist in
  the stack

---

## DEVELOPER TOOLING

<!-- WHY THIS MATTERS: Anti-Gravity uses this to suggest correct CLI
     commands, configuration approaches, and development workflows.
     If you use pnpm, it should never suggest npm commands. If you use
     ESLint flat config, it should not reference .eslintrc patterns. -->

| Tool | Purpose | Notes |
| --- | --- | --- |
| [Tool] | [Purpose] | [Version, config location, key notes] |
| [Tool] | [Purpose] | [Notes] |
| [Tool] | [Purpose] | [Notes] |

### Local Development Environment
<!-- What does a developer need running locally to work on this project?
     Examples: Docker Compose for services, seeded database, mock
     services, remote dev environment, environment variable setup -->
[Fill in]

### Guidance for Anti-Gravity (Tooling)

- Recommendations should align with the actual developer workflow
- Prefer commands and examples that are executable in the project's
  tooling environment
- Match formatting, linting, and type-safety expectations
- Use the correct package manager for all install and run commands

---

## ARCHITECTURAL DEFAULTS

<!-- WHY THIS MATTERS: Every stack develops preferred patterns for common
     problems — how async data is fetched, how forms are validated, how
     background jobs are defined. Anti-Gravity uses these defaults to
     stay consistent with existing code rather than introducing new
     primitives that fragment the codebase.

     Anti-Gravity should not recommend introducing new stack primitives
     casually when existing stack conventions already solve the problem
     well. -->

### Default Patterns by Concern

| Concern | Default Approach | Notes |
| --- | --- | --- |
| Async data fetching | [Fill in] | [Notes] |
| Form handling and validation | [Fill in] | [Notes] |
| Backend structure | [Fill in] | [Notes] |
| Database access | [Fill in] | [Notes] |
| Background / async jobs | [Fill in] | [Notes] |
| Deployment mechanism | [Fill in] | [Notes] |
| Logging and observability | [Fill in] | [Notes] |
| Error handling | [Fill in] | [Notes] |
| Authentication access | [Fill in] | [Notes] |

### Guidance for Anti-Gravity (Defaults)

- Use these defaults as the first answer to any implementation question
  in the relevant concern area
- Only deviate from a default with explicit justification
- When proposing a deviation, explain the gap the default cannot fill

---

## CRITICAL VERSION CONSTRAINTS

<!-- WHY THIS MATTERS: Prevents Anti-Gravity from suggesting upgrades
     that would break your application or are explicitly blocked by
     compatibility, stability, or operational reasons. When a version
     is pinned, the reason matters — it prevents well-intentioned
     suggestions that would cause real harm. -->

| Dependency | Current | Constraint | Reason |
| --- | --- | --- | --- |
| [Dependency] | [Version] | [Do NOT upgrade / Can upgrade within X.x] | [Why this constraint exists] |
| [Dependency] | [Version] | [Constraint] | [Reason] |
| [Dependency] | [Version] | [Constraint] | [Reason] |

### Guidance for Anti-Gravity (Constraints)

- Never suggest upgrading a pinned dependency without explicitly
  acknowledging the constraint and its reason
- If a recommendation depends on a newer version or capability,
  state that dependency explicitly
- If a version constraint has an expiry date or review trigger, note it

---

## KNOWN STACK LIMITATIONS

<!-- WHY THIS MATTERS: Anti-Gravity should be aware of pain points in
     the current stack so it can suggest workarounds, avoid recommending
     patterns that hit known limitations, and set realistic expectations.
     Ignoring known limitations leads to solutions that look correct but
     fail in practice. -->

| Limitation | Impact | Workaround | Plan |
| --- | --- | --- | --- |
| [Limitation] | [User or system impact] | [Current workaround in use] | [Future plan or accepted risk] |
| [Limitation] | [Impact] | [Workaround] | [Plan] |
| [Limitation] | [Impact] | [Workaround] | [Plan] |

---

## STACK INTERPRETATION BY LAYER

<!-- WHY THIS MATTERS: For projects with a layered architecture — whether
     code layers, module layers, or file system layers — each layer has
     a specific stack role. Anti-Gravity uses this to understand what
     lives where and why, preventing misplaced logic and layer leakage. -->

<!-- Fill in the layer structure relevant to this project.
     For a conventional application, this might be:
     - Presentation layer — React components, routing, UI state
     - API layer — Route handlers, controllers, request validation
     - Service layer — Business logic, orchestration
     - Data layer — ORM queries, database access, migrations

     For a file-based / specification project like Anti-Gravity Gold:
     - core/ — permanent kernel layer, always active, markdown-defined
     - skills/ — domain behavior packs, reusable across projects
     - contexts/ — local grounding, active truth, project-specific rules
     - workflows/ — planned execution procedures, not yet built
     - templates/, rubrics/, benchmarks/, memory/ — future support layers
-->

| Layer | Stack Role | Implementation Medium | Status |
| --- | --- | --- | --- |
| [Layer] | [What it is responsible for] | [How it is implemented] | [Active / Planned / Not yet built] |
| [Layer] | [Role] | [Medium] | [Status] |
| [Layer] | [Role] | [Medium] | [Status] |

---

## STACK RISKS

<!-- WHY THIS MATTERS: Named stack risks help Anti-Gravity give
     appropriately cautious advice in transitional or unstable areas.
     When a risk is active, recommendations in that area should
     acknowledge the risk rather than proceed as if the stack is clean. -->

- **[Risk name]** — [Description of the risk and what it affects]
- **[Risk name]** — [Description]
- **[Risk name]** — [Description]
- **[Risk name]** — [Description]

### Common Stack Risks to Consider
<!-- Pre-filled with the most common risks — replace or extend with
     project-specific ones. -->
- **Premature runtime assumptions** — Future files or recommendations
  may assume implementation technologies not yet officially chosen
- **Version drift** — Stack context may become stale as dependencies
  are upgraded without updating this file
- **Layer leakage** — Logic appropriate for one layer may drift into
  another, eroding separation and making the stack harder to maintain
- **Known limitation blindness** — Recommendations may hit documented
  limitations if this file is not consulted

---

## ADOPTION RULES FOR NEW TECHNOLOGY

<!-- WHY THIS MATTERS: Stack sprawl is a real cost. Every new library,
     framework, or service adds maintenance burden, learning cost, and
     potential compatibility surface. Anti-Gravity should not casually
     expand the stack — every addition must justify itself against the
     cost of adding it. -->

### Threshold for Introducing New Tools

- Prefer existing libraries before adding new dependencies
- New infrastructure tooling requires clear operational justification
- New frontend state or data-fetching libraries require strong evidence
  that the existing approach cannot serve the need
- New backend services should not be introduced unless existing
  boundaries are genuinely insufficient
- Third-party managed services should be favored for commodity
  capabilities over building custom equivalents

### Required Justification for New Technology

Any new technology recommendation must justify:

1. **Problem solved** — What specific problem does this solve that the
   existing stack cannot?
2. **Migration cost** — What is the cost of adopting this alongside or
   instead of the existing approach?
3. **Maintenance burden** — Who will own this dependency and at what
   ongoing cost?
4. **Ecosystem fit** — Does this integrate cleanly with the current
   stack without version conflicts or architectural friction?
5. **Team learning cost** — Does the team have the knowledge to use
   this well, or is there a learning curve that affects delivery?

### Guidance for Anti-Gravity (Adoption)

- Do not casually expand the stack
- When recommending a new tool, provide the full 5-point justification
- When an existing stack primitive can solve the problem adequately,
  prefer it — even if the new tool is technically superior in isolation

---

## WHAT GOOD TECHNICAL ADVICE LOOKS LIKE IN THIS STACK

<!-- WHY THIS MATTERS: "Good advice" is stack-relative. An elegant
     solution for one environment may be wrong for another. This section
     defines what good means specifically for this stack and project
     context. -->

- Advice is idiomatic for the actual language and framework version
  in use — not for a different version or a hypothetical cleaner stack
- Suggestions minimize unnecessary tool churn — improvement of current
  stack usage is preferred over recommending a new stack component
- Examples are executable or easily adaptable in the current tooling
  environment without significant rewriting
- Recommendations respect current repo structure, deployment reality,
  and known stack limitations
- Version-sensitive advice explicitly acknowledges the version
  dependency rather than assuming the latest API is available
- New primitives are introduced only when the existing stack is
  genuinely insufficient — not because the new approach is newer

---

## INSTRUCTIONS FOR ANTI-GRAVITY

When working inside this stack, Anti-Gravity must:

1. **Prefer idiomatic solutions in the existing stack** before
   suggesting new technologies or patterns.

2. **Match implementation advice to actual framework and runtime
   constraints** — not to a generic or idealized version of the
   framework.

3. **Respect version-specific realities.** If a recommendation requires
   a newer API, say so explicitly rather than generating code that will
   silently fail.

4. **Avoid recommending stack changes casually.** Every new dependency
   or tool must satisfy the 5-point adoption justification.

5. **Tie architecture and coding advice to the actual tooling
   environment.** Do not assume packages, runtimes, or services that
   are not listed in this file.

6. **Use current deployment, data, and observability constraints** when
   making runtime recommendations. Do not assume infrastructure
   capabilities that are not confirmed.

7. **If the user asks for a stack-altering recommendation**, explain
   migration cost, ecosystem fit, and team learning cost explicitly.

8. **If stack context is incomplete**, state what is being assumed
   rather than silently proceeding on a guess.

9. **If the stack reality is inconsistent** — for example, two
   competing libraries for the same concern — flag the inconsistency
   rather than smoothing it away.

10. **Keep examples and code aligned with the actual stack.** Every
    import path, CLI command, and configuration example should be
    correct for this specific environment.

---

## TEMPLATE FILL-IN SUMMARY

A quick reference for the sections that need to be populated when
deploying this file for a new project:

### Required (Anti-Gravity is significantly degraded without these)

- [ ] Current Stack Reality — what the stack is right now
- [ ] Primary Languages with versions
- [ ] Framework (frontend and/or backend) with version
- [ ] API Architecture
- [ ] Authentication approach
- [ ] Primary Database with ORM
- [ ] Known Stack Limitations

### High Value (strongly recommended)

- [ ] Stack Summary paragraph
- [ ] Key Frontend Libraries table
- [ ] Key Backend Libraries table
- [ ] Infrastructure Overview table
- [ ] Critical Version Constraints table
- [ ] Architectural Defaults by concern
- [ ] Adoption Rules threshold

### Useful When Relevant

- [ ] State Management
- [ ] Styling approach
- [ ] UI Component Library
- [ ] Background Jobs / Queues
- [ ] API and Integration Environment
- [ ] Developer Tooling table
- [ ] Stack Interpretation by Layer
- [ ] Stack Risks
- [ ] What the Stack Is NOT Yet

---

## CROSS-REFERENCES

<!-- WHY THIS MATTERS: This file defines the stack but does not stand
     alone. Related context files extend and specialize what this file
     provides. Anti-Gravity should load cross-referenced files when their
     domain is relevant to the task at hand. -->

| Related Context File | Relationship |
| --- | --- |
| `project-context.md` | What this stack is building — users, goals, stage |
| `architecture-context.md` | How this stack is organized into an architecture — layers, boundaries, decisions |
| `database-context.md` | Deep dive on database schema, patterns, and data operations |
| `infra-context.md` | Deep dive on hosting, deployment, CI/CD, and monitoring |
| `coding-standards.md` | Conventions applied when writing code with this stack |
| `design-system.md` | Visual language implemented with this frontend stack |
| `naming-conventions.md` | File, variable, and domain naming rules for this stack |
| `api-conventions.md` | API design and contract conventions for this stack |
| `security-baselines.md` | Security requirements and boundaries enforced at the stack level |

---

## FINAL RULE

All technical recommendations must be grounded in the actual stack in
use — not generic ecosystem advice from a different environment,
a different version, or an idealized project that does not exist.

When the stack is still forming: acknowledge what is not yet decided.
When the stack has limitations: work within them honestly.
When a new tool is needed: justify the cost before recommending it.
When the stack has gaps: name them rather than assuming they are filled.

---
