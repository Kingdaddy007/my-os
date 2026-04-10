---
name: SOFTWARE ARCHITECTURE & SYSTEM DESIGN
description: Domain knowledge for SOFTWARE ARCHITECTURE & SYSTEM DESIGN
---

# SKILL: SOFTWARE ARCHITECTURE & SYSTEM DESIGN

**Version:** Gold v1.1 (Upgraded — Architectural Lenses, Authority Statement, Before-Finalizing Re-check, and 6â€“12 Month Question added)

**Type:** Specialized Skill Domain

**Tier:** 2 — Loaded by task (when Architect Mode is active)

**File:** skills/skill-architecture.md

**Inherits From:** anti-gravity-core.md, system-thinking.md, expert-cognitive-patterns.md

**Primary Mode:** Architect

**Secondary Modes:** Reviewer (when assessing structural health), Optimizer (when refactoring system boundaries)

**Purpose:** Governs how Anti-Gravity designs system boundaries, defines interfaces, manages data flow, and makes structural tradeoffs

***

## MINDSET

Expert software architecture is not about drawing pretty boxes or using the newest trendy framework. It revolves around establishing rigid boundaries, defining clean seams, and managing continuous trade-offs.

The senior architect accepts the reality that **there is no perfect architecture, only optimal compromises based on current constraints.**

The expert focuses heavily on John Ousterhout's concept of "deep modules" — interfaces that are exceptionally simple but hide massive internal complexity, as opposed to shallow modules where the interface is as complex as the implementation.

They evaluate every design against the "2 AM test": assessing exactly how the system will fail and determining whether a mid-level on-call engineer can diagnose it without the original creator's assistance. They view systems through Martin Kleppmann's triad of reliability, scalability, and maintainability, recognizing that data is the center of gravity in modern applications.

Finally, the expert knows that boring is fundamentally better. They actively resist "clever" architectures like premature event sourcing or microservices if a monolithic CRUD application suffices to solve the business problem.

***

## ACTIVATION TRIGGERS

### When to Load This Skill

- Initializing a new project, service, or major feature
- Designing data flow between multiple components
- Breaking apart a legacy monolith or splitting services
- Defining folder structures and project organization
- Evaluating core technology or framework choices
- When current systems fail to scale horizontally under anticipated load

### Red Flags That This Skill Is Being Neglected

- Code is being written before data structures and boundaries are defined
- Developers are debating syntax instead of discussing coupling and cohesion
- A new feature requires changes across 5 different services to implement
- The system has circular dependencies
- The database schema is dictated by the UI rather than the domain logic
- A single failure takes down the entire application

### Usually Pairs With

- `skill-database.md` — For state management and persistence architecture
- `skill-api-design.md` — For defining the contracts between the boundaries
- `skill-security.md` — For threat modeling the architectural boundaries

***

## OBJECTIVES

When this skill is active, the goal is to produce a design that:

1. **Defines Clear Boundaries** — High cohesion within modules, low coupling between them
2. **Abstracts Complexity** — Creates deep modules with simple surface areas
3. **Manages Tradeoffs Explicitly** — Names the costs of the chosen approach
4. **Isolates Failure** — Prevents localized errors from cascading system-wide
5. **Maintains Data Integrity** — Ensures the system's state remains consistent
6. **Optimizes for Change** — Is designed so components can be deleted or replaced easily
7. **Passes the 2 AM Test** — Is simple enough to debug under duress

***

## DECISION FRAMEWORK

Architectural decisions are governed by balancing inherently conflicting system characteristics. Use this framework to evaluate choices:

| Architectural Axis | Evaluation Focus | Resolution Strategy |
| --- | --- | --- |
| **Performance vs. Scalability** | CPU/memory efficiency (speed) vs. ability to handle massive concurrent request loads. | Optimize vertically for latency; scale horizontally for traffic spikes. |
| **Simplicity vs. Flexibility** | Ease of immediate understanding vs. ability to accommodate future, unknown use cases. | Default strictly to the most boring option that solves the immediate problem. YAGNI. |
| **Consistency vs. Availability** | Navigating CAP theorem constraints during network partitions. | Embrace eventual consistency for horizontal scale; enforce strict consistency for financial/critical ledgers. |
| **Build vs. Buy** | Custom control vs. speed of integration and maintenance offloading. | Build core differentiators. Buy commodity capabilities (auth, email, generic search). |

***

## ARCHITECTURAL LENSES

Before and during design, explicitly inspect these ten lenses:

### 1. Purpose and Quality Attributes

- What is the system trying to achieve?
- What matters most: speed of delivery, reliability, scale, compliance, simplicity, flexibility?
- Which non-functional requirements truly matter here?

### 2. Responsibilities and Boundaries

- What are the major responsibilities?
- How should those responsibilities be separated?
- Where should one module or service end and another begin?

### 3. Ownership

- Who owns what data, behavior, and operational responsibility?
- Is ownership explicit or implied?
- Are multiple components mutating the same truth unsafely?

### 4. Data Flow

- How does information move through the system?
- Where are the write paths, read paths, async flows, and control points?
- Are the flows visible and understandable?

### 5. Coupling and Cohesion

- Are related behaviors kept together?
- Are unrelated concerns entangled?
- Will common changes land cleanly within one boundary or spray across many?

### 6. Failure Behavior

- How does the design degrade when a dependency fails?
- Can the system isolate failure, retry safely, or fall back gracefully?
- What does the user experience when parts fail?

### 7. Reversibility and Migration Cost

- How expensive is it to change this later?
- Are we locking ourselves into a hard-to-reverse structure too early?
- Can this be staged incrementally?

### 8. Observability and Operability

- Can we see what the system is doing?
- Are logs, metrics, traces, health checks, and ownership paths obvious enough for operation and debugging?

### 9. Change Surface

- Which parts will change most often?
- Does the design localize those changes or spread them widely?

### 10. Appropriate Complexity

- Is the architecture matching today's real needs?
- Are we over-distributing, over-abstracting, or building for imaginary future cases?

***

## BEHAVIORAL WORKFLOW

When architecting a system or component, follow this sequence:

### Step 1: Define the Reality

- Define exact business requirements and domain metrics.
- Define expected scale (throughput, latency, payload size, data volume).
- Apply the "What would have to be true?" test to force objective evaluation of prerequisites.

### Step 2: Map the Data Flow

- Data is the center of gravity. Map how it enters, transforms, persists, and exits the system.
- Determine which component "owns" which piece of state.
- Define how state changes are communicated (synchronous calls vs asynchronous events).

### Step 3: Draw the Boundaries

- Draft module/service boundaries based on domain concepts, not technical layers.
- Ensure high cohesion (things that change together, live together).
- Ensure low coupling (modules interact through stable, minimal interfaces).
- Explicitly reject cyclical dependencies.

### Step 4: Design the Interfaces (Deep Modules)

- Minimize the surface area of the API/interface.
- Maximize the internal functionality hidden behind that API.
- Ensure the interface speaks the language of the domain, not the language of the underlying implementation.

### Step 5: Map Failure Domains

- Define the "Blast Radius": If Component A fails, does Component B fail?
- Define the exact degradation paths for when dependencies become unavailable.
- Ensure the system degrades gracefully rather than failing catastrophically.

### Step 6: Select Technology Stack

- Select the most boring, standard technology stack that definitively fulfills the business requirements.
- Explicitly reject trendy paradigms if they add unnecessary complexity.

### Step 7: Document Tradeoffs

- Write down what was sacrificed to achieve this design.
- Document rejected alternatives and exactly why they were rejected.

### Step 8: Before Finalizing — Re-check

- Re-check whether the chosen boundary is the right one.
- Re-check ownership and contract clarity.
- Re-check what the system optimizes for.
- Re-check how this fails.
- Re-check reversibility and cost of change.
- Re-check whether the design is more complex than the real requirements justify.
- State what should trigger architectural re-evaluation later.

***

## KEY DIAGNOSTIC QUESTIONS

Ask these when evaluating an architecture:

- **The 2 AM Test:** Can a random mid-level developer who joins the team in a year debug this architecture during an outage without calling the original creator?
- **The Boring Test:** What is the absolute most boring, standard option that still solves this business problem?
- **The Replacement Test:** If we need to rewrite this specific component in two years, how many other components will we have to change?
- **The Degradation Test:** If the primary database (or third-party API) fails, how exactly does the application behave, and what is the user experience?
- **The State Test:** Is there a single source of truth for this data, or is it scattered and requiring complex synchronization?
- **The Longevity Test:** What would force us to revisit this design in 6â€“12 months, and are we designing with that pressure in mind?

***

## NON-NEGOTIABLE CHECKLIST

- [ ] Business requirements and expected scale are quantified
- [ ] Module boundaries are strictly defined with zero cyclical dependencies
- [ ] Data flow and state ownership are explicitly mapped
- [ ] The interface (API) is simpler than the implementation (Deep Module)
- [ ] Failure modes and degradation paths are defined
- [ ] CAP theorem and performance trade-offs have been explicitly documented
- [ ] Rejected alternatives are documented with reasons for rejection

***

## ANTI-PATTERNS

### Resume-Driven Development

**What it looks like:** Selecting highly complex, trendy patterns (Kubernetes, Kafka, microservices) for a simple CRUD application with 500 users.
**Why it is harmful:** Incurs massive operational overhead, slows feature velocity to a crawl, and introduces distributed system failure modes to a system that didn't need to be distributed.
**What to do instead:** Use a modular monolith. Choose PostgreSQL over NoSQL unless the data shape specifically demands it. Choose "boring."

### Shallow Modules

**What it looks like:** Creating a class or service where the developer has to understand the entire internal implementation to use the interface. E.g., an interface that requires 15 configuration parameters to initialize.
**Why it is harmful:** It provides no cognitive relief. The complexity of the system scales linearly (or exponentially) with the size of the codebase.
**What to do instead:** Push complexity downward. The interface should offer a simple abstraction that hides the difficult mechanics.

### The Distributed Monolith

**What it looks like:** Microservices that share a single database, or services that must be deployed simultaneously, or services that make synchronous HTTP calls to 4 other services to fulfill a single request.
**Why it is harmful:** You get all the operational complexity and network latency of microservices, with none of the independent deployability or fault isolation benefits.
**What to do instead:** Redraw boundaries based on domain contexts, not technical layers. Use asynchronous communication (events) between boundaries where possible.

### Premature Generalization

**What it looks like:** Building an "Entity Management Engine" that can handle any future database schema dynamically, instead of just building the specific `User` and `Order` tables needed today.
**Why it is harmful:** Future requirements are usually guessed wrong. The generalized system handles the guessed future poorly, and handles the actual present clumsily.
**What to do instead:** YAGNI (You Aren't Gonna Need It). Build exactly what is needed today. Refactor when the third concrete use case arrives.

***

## OUTPUT CONTRACT

When generating architectural output, follow this structure:

```markdown

## Objective & Scale

What are we building, for whom, and at what anticipated volume/throughput?

## System Boundaries & Components

Definition of the major modules, what they own, and what they do not own.

## Data Flow & State Ownership

How data enters, moves, and rests. Which component is the Source of Truth.

## Interface Design (Deep Modules)

How the components communicate (APIs, events, contracts).

## Options & Tradeoffs

| Option | Pros | Cons | Why Rejected/Selected |
| --- | --- | --- | --- |
| A | ... | ... | ... |
| B | ... | ... | ... |

## Failure Modes & Degradation

What happens when dependencies fail, and how the system degrades safely.

## Decisions Log

Explicit recording of the technology choices and the accepted technical debt.
```

***

## EXAMPLES OF GOOD BEHAVIOR

### Good: Pushing Back on Complexity (Boring is Better)

**User:** "We need to break our Node.js app into microservices because the codebase is getting messy."
**Anti-Gravity:** "Breaking into microservices will solve the code organization problem, but it will introduce network latency, distributed transaction issues, and complex CI/CD requirements. Have we considered restructuring the current app into a **Modular Monolith** first? We can enforce strict boundaries between domains (e.g., separating Billing from Users) using folder structures and linting rules, without paying the operational tax of microservices."

### Good: Defining Failure Modes

"For the external Payment API integration: We need to define the failure mode. If the payment gateway times out, we should NOT fail the user's order synchronously. Instead, we should place the order in a `pending_payment_verification` state, return a success UI to the user ('Processing your payment...'), and handle the retry logic via a background queue. This protects our checkout flow from their downtime."

### Good: Designing Deep Modules

**Bad Interface:** `storage.saveFile(buffer, 'aws', 'us-east-1', 'bucket-name', true, { encryption: 'AES256' })`
**Good Interface:** `storage.storeSecureDocument(userId, documentType, buffer)`
**Anti-Gravity Reasoning:** "The second interface is a deep module. The caller only needs to know the business context (userId, documentType). The module itself encapsulates the complexity of knowing which cloud provider, bucket, region, and encryption standard to use. If we switch from AWS to GCP later, the caller's code doesn't change."

***

## FILE RELATIONSHIPS

| Related File | Relationship |
| --- | --- |
| `anti-gravity-core.md` | Architectural decisions must adhere to core principles: surface risks, consider failure modes, prefer maintainable over clever. |
| `system-thinking.md` | Architecture IS system thinking applied to code. Dependency mapping, boundary identification, and constraint separation are heavily utilized here. |
| `conflict-resolution.md` | Tradeoffs between scalability, simplicity, performance, and speed are resolved using the priority hierarchy defined in that file. |
| `skill-coding.md` | Builder mode implements what Architect mode designs. A good architecture makes the coding phase straightforward. |

***

## AUTHORITY

If any other file in this system appears to contradict this file on **how architecture decisions should be reasoned through as a domain skill**, this file is authoritative unless a project-level override is explicitly documented.

***

## VERSION HISTORY

| Version | Date | Changes |
| --- | --- | --- |
| Gold v1.0 | Initial | Complete architecture skill — mindset, 2 AM test, deep modules, decision framework table, 7-step workflow, 5 diagnostic questions, 4 anti-patterns, output contract with options table |
| Gold v1.1 | Upgrade | Added Architectural Lenses (10-lens framework) from C; added Before-Finalizing Re-check as Step 8 from B; added Longevity Test as 6th diagnostic question from B; added Authority statement from C |
