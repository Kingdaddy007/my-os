# BENCHMARK: API AND DATA DESIGN

**Version:** Gold v1.0
**Layer:** 11 — Verification
**Tier:** 3 — Loaded on demand
**File:** benchmarks/api-data-benchmarks.md
**Purpose:** Repeatable test scenarios for evaluating Anti-Gravity's API design and database modeling capability — consumer fit, contract clarity, data integrity, migration safety, and query performance awareness.
**Evaluate With:** api-quality-rubric.md, architecture-rubric.md, security-rubric.md
**Tests:** skill-api-design.md, skill-database.md, workflow-design-api.md

---

## WHAT THIS BENCHMARK TESTS

This benchmark evaluates whether Anti-Gravity can:

- Design consumer-friendly API contracts without leaking internals
- Shape data models around real access patterns and invariants
- Reason about pagination, validation, and compatibility
- Think carefully about migrations and schema change safety
- Optimize queries through measurement, not assumption
- Preserve integrity, data ownership, and evolvability
- Handle auth, authorization, and abuse resistance at the API level
- Design idempotent, observable async systems

This benchmark should reveal whether Anti-Gravity behaves like a contract-aware systems engineer or a table and endpoint generator.

---

## HOW TO USE THESE BENCHMARKS

1. Pick a scenario below
2. Present it to Anti-Gravity as a real task — do not mention it is a benchmark
3. Let Anti-Gravity process it using its full system — skills, contexts, and workflows active as appropriate
4. Evaluate the output against the rubrics listed above
5. Record the score in `memory/benchmark-results.md`
6. Compare scores across runs and versions to track improvement

---

## EVALUATION DIMENSIONS

Score benchmark outputs across these dimensions:

1. Consumer and use-case fit — designed for the consumer's task?
2. Contract clarity — request, response, and errors explicit?
3. Compatibility awareness — additive evolution, no casual breakage?
4. Auth and protection — auth, authz, limits, validation enforced?
5. Data model quality — normalized, constrained, indexed correctly?
6. Access-pattern reasoning — modeled around how data is actually used?
7. Migration safety — changes safe, staged, reversible where possible?
8. Integrity and invariant awareness — domain rules enforced at the right layer?
9. Performance and query awareness — N+1 avoided, indexes planned?
10. Communication clarity — can a teammate implement from this output?

---

## SCENARIO 1 — Design a New API Endpoint

### Prompt (Scenario 1)

Design the API for getting a project's sprint board data — all tasks for the active sprint, grouped by status, with assignee information.

### What Excellent Output Looks Like (Scenario 1)

- Identifies the consumer — the frontend sprint board page — before designing the contract
- Decides the right mechanism for the context — not leaking the choice to the consumer
- Defines the response shape around consumer needs, not the raw database model:
  - Sprint metadata — id, name, dates, status
  - Tasks grouped by status column — todo, in progress, in review, done
  - Per-task — id, title, priority, story points, assignee name and avatar
  - Summary counts and point totals for the board header
- Defines error scenarios explicitly — no active sprint, project not found, not authorized — each with distinct handling
- Considers performance — single query with joins, not N+1 per task for assignee data
- Applies soft-delete filter on tasks
- Considers ordering — tasks sorted by position within each column
- Enforces authorization — checks project membership before returning any data
- Validates input — project ID must be a valid format

### Red Flags (Scenario 1)

- Returns the raw database model structure — exposes internal schema
- No grouping by status — leaves the frontend to sort
- N+1 query pattern for assignee data
- No authorization check
- Includes unnecessary fields — timestamps, foreign keys the UI does not need
- Does not define error scenarios

---

## SCENARIO 2 — Design a Database Schema Change

### Prompt (Scenario 2)

We need to add a labels feature to tasks. Users should be able to create custom labels with a name and color, and apply multiple labels to a task. Labels are scoped to a project.

### What Excellent Output Looks Like (Scenario 2)

- Designs a proper relational model — not JSON array storage:
  - Labels table — id, name, color, project id, created and updated timestamps
  - Task labels junction table — task id, label id, created timestamp
- Applies correct uniqueness constraints:
  - No duplicate label names within a project
  - No duplicate label applications to the same task
- Follows project database naming conventions throughout
- Migration approach — purely additive, no breaking changes, no Expand-Contract needed for a new table
- Plans appropriate indexes:
  - Labels by project — for listing a project's available labels
  - Task labels by task — for fetching labels on a task
  - Task labels by label — for filtering tasks by label
- Considers label deletion behavior — what happens to applied labels when a label is deleted? Cascade or soft delete?
- Considers validation — color format, name length limit, maximum labels per task
- Shows the schema definition addition

### Red Flags (Scenario 2)

- Stores labels as a JSON array on the task record
- No junction table — prevents efficient filtering tasks by label
- No uniqueness constraints
- No indexes planned
- No consideration of deletion cascade behavior
- Does not follow project naming conventions

---

## SCENARIO 3 — Optimize a Slow Query

### Prompt (Scenario 3)

A query powers the project dashboard and takes over three seconds for a project with 45 sprints and 1,800 tasks. The query joins sprints to tasks and aggregates task counts and story points per sprint, filtered by project.

### What Excellent Output Looks Like (Scenario 3)

- Asks for the query execution plan before recommending anything
- Does NOT jump to caching as the first recommendation
- Identifies likely causes through analysis:
  1. Missing covering index — the aggregation join has no index aligned to the query pattern
  2. Loading all historical sprints — the dashboard likely only needs recent sprints
  3. Aggregation computed on every request — could be pre-computed on sprint completion
- Provides optimization recommendations ordered by impact and effort:
  1. Add a covering index aligned to the join and aggregation pattern
  2. Add a LIMIT — paginate historical sprints rather than loading all
  3. If still slow — pre-compute sprint metrics on completion and store in a denormalized metrics table
- Explains why each optimization helps — not just what to add
- Notes the trade-offs introduced by each option — staleness, write overhead, operational cost
- Defines how to verify improvement — run EXPLAIN ANALYZE before and after

### Red Flags (Scenario 3)

- Suggests adding Redis caching without understanding the query problem
- No request for query execution plan or measurement first
- Recommends adding indexes on every column separately rather than a covering index
- Recommends full denormalization as the first option
- Does not notice that loading all 45 sprints is unnecessary

---

## SCENARIO 4 — Evolve an Existing API Without Breaking Clients

### Prompt (Scenario 4)

A public API currently returns a customer name as a flat field. The team wants to move to a richer customer object with nested name fields for future consumers, but current clients must keep working.

### What Excellent Output Looks Like (Scenario 4)

- Distinguishes additive changes from breaking changes explicitly
- Recommends additive evolution as the default path:
  - Keep the existing flat field in the response
  - Add the new nested object alongside it — both present
  - Existing consumers see no change
  - New consumers use the richer structure
- Defines what would actually constitute a breaking change — field removal, type change, semantic drift, status code change
- Addresses the deprecation lifecycle — when and how is the old field retired?
- Consumer communication plan — how are external clients notified of the deprecation timeline?
- Versioning decision — additive evolution avoids versioning for now; true versioning only if a break cannot be avoided
- Distinguishes internal consumers (can update simultaneously) from external consumers (need migration time)

### Red Flags (Scenario 4)

- "Just rename the field" — casual breaking change
- "Make a v2" with no consideration of the additive path
- No deprecation lifecycle or consumer communication plan
- No distinction between internal and external consumer impact

---

## SCENARIO 5 — Model a Complex Data Domain

### Prompt (Scenario 5)

Design the data model for a system that tracks subscriptions, invoices, and payment attempts.

### What Excellent Output Looks Like (Scenario 5)

- Identifies the domain invariants before designing:
  - A subscription can have many invoices
  - An invoice can have many payment attempts
  - Payment amounts must match invoice amounts
  - State transitions must be valid — no moving from cancelled back to active without explicit process
- Designs entities around access patterns:
  - Subscription — status, plan, billing cycle, customer reference
  - Invoice — subscription reference, amount, due date, status, issued date
  - Payment attempt — invoice reference, amount, gateway reference, status, attempted at, failure reason
- Applies integrity constraints — foreign keys, amount validation, status enum constraints
- Addresses the source-of-truth question — payment gateway is the authoritative source for payment status; local records are a copy
- Designs for auditability — payment attempts are never deleted, only appended
- Considers dangerous states — what happens when a payment attempt is pending? What prevents double processing?

### Red Flags (Scenario 5)

- Noun-only schema with no invariants
- No state machine or transition reasoning
- No payment and subscription coordination thinking
- No source-of-truth or authoritative data clarity
- No integrity constraints beyond basic primary keys

---

## SCENARIO 6 — Design an Idempotent Webhook Ingestion API

### Prompt (Scenario 6)

Design an inbound webhook ingestion path for a third-party payment provider. Repeated deliveries are possible. Out-of-order deliveries are possible. Processing may be async. Failures must be observable.

### What Excellent Output Looks Like (Scenario 6)

- Identifies the core constraints — idempotency and at-least-once delivery are the governing design forces
- Designs the ingestion path:
  - Receive webhook, verify signature, return 200 immediately
  - Persist the raw event with its provider-supplied event ID
  - Enqueue for async processing — do not process synchronously
- Deduplication strategy — check event ID before processing; if already seen, skip processing but return 200 to stop retries
- Out-of-order handling — check event timestamp and current state before applying; reject or queue events that arrive before their predecessors
- Observability — log event ID, type, receipt time, processing status; alert on processing failures
- Failure containment — processing failures move event to a dead letter state for manual review; the ingestion endpoint always returns 200 to the provider

### Red Flags (Scenario 6)

- "Just process the webhook" inline in the request handler
- No idempotency — duplicate deliveries create duplicate side effects
- No signature verification
- No async processing — failure blocks the response to the provider
- No deduplication or ordering awareness
- No observability or failure containment

---

## SCORING GUIDE

For each scenario, evaluate using `api-quality-rubric.md` and `architecture-rubric.md` dimensions:

| Dimension | Weight for API and Data |
| --- | --- |
| Consumer-driven design | High — designed for the consumer, not the schema? |
| Response shape quality | High — right data, right structure, nothing extra? |
| Error handling | High — all failure scenarios covered explicitly? |
| Security — auth and authz | High — data access properly controlled? |
| Data model quality | High — normalized, constrained, indexed correctly? |
| Migration safety | Medium — safe, additive, reversible where possible? |
| Performance awareness | Medium — N+1 avoided, indexes planned thoughtfully? |
| Convention compliance | Medium — follows project conventions throughout? |

Record all scores in `memory/benchmark-results.md`.

---

## FINAL RULE

A strong API and data benchmark response designs for consumers, protects data truth, and treats change as something that must be survived safely. It produces contracts and models that are:

- Clear to the consumer
- Correct to the domain
- Safe to evolve over time
- Hard to misuse
- Practical to operate and maintain
