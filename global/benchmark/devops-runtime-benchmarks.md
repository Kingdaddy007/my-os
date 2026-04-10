# BENCHMARK: DEVOPS AND RUNTIME

**Version:** Gold v1.0
**Layer:** 11 — Verification
**Tier:** 3 — Loaded on demand
**File:** benchmarks/devops-runtime-benchmarks.md
**Purpose:** Repeatable test scenarios for evaluating Anti-Gravity's DevOps, infrastructure, and operational reasoning capability — deployment safety, observability, incident response, and operational realism.
**Evaluate With:** performance-rubric.md, release-readiness-rubric.md, security-rubric.md
**Tests:** skill-devops-infra.md, workflow-ship-to-production.md, workflow-optimize-performance.md

---

## WHAT THIS BENCHMARK TESTS

This benchmark evaluates whether Anti-Gravity can:

- Reason from actual runtime conditions rather than abstract best practice
- Design safer deployment paths with realistic rollout and rollback
- Identify and improve observability gaps
- Respond to production incidents systematically, not reactively
- Evaluate infrastructure tradeoffs honestly against team maturity and cost
- Match complexity of recommendations to the actual operational context
- Produce practical, reproducible, observable solutions

This benchmark should reveal whether Anti-Gravity behaves like an operationally mature engineer or a generic "just add monitoring, use Kubernetes" assistant.

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

1. Operational problem framing — was the real runtime problem identified?
2. Release scope and blast-radius clarity — what changes and who is affected?
3. Rollout realism — is the rollout matched to actual risk?
4. Rollback realism — could the change actually be reversed if needed?
5. Observability quality — can the team distinguish success from failure?
6. Environment and runtime awareness — staging versus production differences?
7. Incident response quality — systematic, not panicked?
8. Reproducibility and infra discipline — traceable, automated, controllable?
9. Team-operability realism — can this team actually operate what is recommended?
10. Complexity versus value judgment — does complexity earn its cost?

---

## SCENARIO 1 — Deployment Strategy Decision

### Prompt (Scenario 1)

We are launching a major new feature — a new analytics dashboard — next week. How should we roll it out to minimize risk?

### What Excellent Output Looks Like (Scenario 1)

- Asks clarifying questions before recommending — how many users, feature complexity, data dependencies, reversibility?
- Recommends a phased rollout strategy:
  1. Deploy behind a feature flag — environment variable or simple flag check
  2. Enable for internal team first — two to three days of dogfooding
  3. Enable for a small percentage of users — three to five days of observation
  4. Monitor error rates, performance metrics, and user feedback throughout
  5. If healthy, enable for all users
  6. Remove feature flag after a period of stable operation
- Defines rollback plan — disable feature flag immediately, no redeployment needed
- Defines monitoring criteria — what metrics to watch and what thresholds trigger a rollback decision
- Considers partial enabling — can some charts be visible while others are disabled if needed?
- Suggests notifying the support team about the new feature before users encounter it
- If feature flag infrastructure does not exist — recommends the simplest viable implementation, not a complex feature flag service

### Red Flags (Scenario 1)

- Recommends big-bang deployment to all users without phasing
- No rollback plan
- No monitoring criteria defined
- Recommends complex tooling when a simple solution would work
- No consideration of who needs to be informed before rollout

---

## SCENARIO 2 — Incident Response

### Prompt (Scenario 2)

It is 10 PM. An alert fires. Error tracking shows a spike of 500 errors on the login endpoint. Users are reporting they cannot log in. The error points to a database connection timeout. What do we do?

### What Excellent Output Looks Like (Scenario 2)

- Immediately classifies severity — login is down, all users affected, this is a P1 incident
- Systematic triage steps:
  1. Verify database reachability — check monitoring dashboards, try a manual connection
  2. Check database status — is the instance running? Is there a maintenance window?
  3. Check connection count — are we at or near the connection limit?
  4. Check recent deployments — was anything deployed in the last few hours?
- If database is healthy but connections are exhausted:
  - Immediate — restart the application to force connection pool reset
  - Short-term — reduce connections per function
  - Root cause — investigate what is holding connections open
- If database is actually down:
  - Check cloud provider events for outage information
  - If provider issue — wait for resolution, communicate to users
  - If our issue — check whether a recent migration caused the problem
- Communication — update status page, notify team in the incident channel
- Post-resolution — monitor for at least 30 minutes to confirm stability
- Flags — a P1 incident requires a post-mortem
- Considers — should the system have a degraded mode for when the database is unavailable?

### Red Flags (Scenario 2)

- Starts debugging application code instead of checking infrastructure
- No immediate verification of database connectivity
- No communication or status update plan
- No post-mortem suggestion for a production incident
- Does not check connection count given the timeout error type

---

## SCENARIO 3 — Monitoring Gap Assessment

### Prompt (Scenario 3)

We are preparing for our first enterprise customer. They want to see our monitoring capabilities. Review the current monitoring setup and identify what is missing.

### What Excellent Output Looks Like (Scenario 3)

- References the actual current monitoring context before assessing
- Evaluates what is present and what is missing against enterprise expectations:
  - What is working — error tracking, basic performance monitoring, database monitoring, uptime checks
  - What is missing — distributed tracing, log aggregation with search, business metric dashboards, SLA reporting, synthetic monitoring, security event monitoring
- Prioritizes gaps by enterprise impact:
  1. SLA monitoring — the customer will ask for uptime reports
  2. Log aggregation — for incident investigation transparency
  3. Synthetic monitoring — proactive over reactive detection
  4. Security event logging — audit trail for compliance
- Recommends specific tools with cost awareness
- Provides a phased implementation plan rather than a full overhaul
- Distinguishes "good enough for now" from "required for enterprise"

### Red Flags (Scenario 3)

- Says current monitoring is fine without assessing it
- Recommends a full observability platform overhaul for one enterprise customer — overkill
- No prioritization of gaps
- No cost or team burden awareness
- Generic monitoring advice not grounded in the actual setup

---

## SCENARIO 4 — Release a Feature With a Risky Schema Change

### Prompt (Scenario 4)

A new feature requires a schema change that is risky to reverse. The application is deployed continuously and old and new versions may run briefly at the same time. How should this be shipped?

### What Excellent Output Looks Like (Scenario 4)

- Identifies this as a high-risk release that needs explicit sequencing
- Recommends the expand-contract pattern or equivalent staged approach:
  1. Step one — deploy the additive schema change only, with no application code that depends on it. Both old and new code work.
  2. Step two — deploy the application code that uses the new schema. Old schema is still present, new schema is active.
  3. Step three — after confirming stability, remove the old schema elements in a separate migration.
- Addresses mixed-version compatibility — during the brief overlap, both old and new code must function correctly
- Rollback plan — at each step, define what reversal looks like. Step one and two are reversible. Step three is not.
- Post-release validation — what signals confirm the migration was applied correctly and the feature is behaving as expected?
- Monitoring — what to watch in the first 30 minutes after each step

### Red Flags (Scenario 4)

- "Run the migration, then deploy" — no staged thinking
- No compatibility reasoning for mixed-version overlap
- No rollback plan at each step
- No post-release validation or monitoring
- Destructive schema changes without a safe sequencing approach

---

## SCENARIO 5 — Assess Whether Infra Complexity Is Justified

### Prompt (Scenario 5)

A small team running a moderately sized SaaS is considering moving from simple managed hosting to a complex container orchestration setup because they think it will make them "more scalable." How should this be evaluated?

### What Excellent Output Looks Like (Scenario 5)

- Asks what scaling problem they are actually experiencing right now
- Evaluates team maturity and operational burden honestly:
  - Complex container orchestration adds significant operational overhead — deployment, monitoring, networking, secrets, scaling policies
  - A small team without dedicated DevOps will spend substantial time maintaining the platform instead of building the product
- Distinguishes real need from prestige complexity:
  - If current hosting is not a bottleneck, this is speculative over-engineering
  - "More scalable" is not a specific requirement — what does scaling actually mean for this product at this stage?
- Recommends evaluating simpler scaling paths first:
  - Vertical scaling of the managed host
  - Read replicas for database load
  - CDN for static assets
  - Only revisit complex orchestration when a specific bottleneck demands it
- If complex orchestration is genuinely needed — recommends starting with managed options that reduce operational burden

### Red Flags (Scenario 5)

- Endorses the complex approach without challenging the premise
- No operational cost or team burden discussion
- No simpler alternatives considered
- No distinction between present bottleneck and imagined future need
- Recommends the most complex option because it is technically impressive

---

## SCENARIO 6 — Improve a Fragile Manual Deployment Process

### Prompt (Scenario 6)

A team deploys by running a set of manual steps from a shared document. Production issues sometimes occur after releases. Review the process and recommend improvements.

### What Excellent Output Looks Like (Scenario 6)

- Identifies the core risks — tribal knowledge dependency, reproducibility failure, no deployment traceability, no consistent rollback path
- Recommends improvements in priority order:
  1. Automate the deployment steps into a repeatable pipeline — not necessarily complex, even a simple script with documented steps is better than a shared document
  2. Add a pre-deployment checklist — tests pass, migrations reviewed, rollback path confirmed
  3. Add post-deployment validation — key health checks automatically run after deploy
  4. Define a rollback path explicitly — what is the specific procedure to revert if the deploy causes an issue?
- Matches recommendations to team maturity — does not recommend enterprise CI/CD tooling for a team that cannot yet operate it
- Addresses the "production issues sometimes happen" root cause — is it from untested changes? Missing validation? Lack of staging parity?

### Red Flags (Scenario 6)

- "Just use CI/CD" with no practical structure or implementation path
- No rollback focus
- No operator burden awareness
- Prestige tool recommendation without team or context fit
- Does not address why production issues are occurring

---

## SCORING GUIDE

For each scenario, evaluate using `release-readiness-rubric.md` and `performance-rubric.md` dimensions:

| Dimension | Weight for DevOps and Runtime |
| --- | --- |
| Risk awareness | Critical — deployment risks identified and mitigated? |
| Operational thinking | High — monitoring, rollback, communication considered? |
| Infrastructure knowledge | High — recommendations grounded in actual constraints? |
| Incident response quality | High — systematic, not panicked or guess-driven? |
| Team capability fit | Medium — recommendations the team can actually operate? |
| Cost awareness | Medium — solutions proportionate to budget and scale? |
| Phased approach | Medium — incremental rollout over big-bang deployment? |

Record all scores in `memory/benchmark-results.md`.

---

## FINAL RULE

A strong DevOps and runtime benchmark response makes the system easier to deploy, observe, recover, and trust in production — without adding operational complexity the team cannot safely run.

It makes it easier to:

- Deploy safely with a realistic rollout and rollback
- Understand failures when they happen
- Recover quickly under real pressure
- Avoid infrastructure complexity that costs more than it saves
