---
description: The systematic sequence for identifying and resolving performance bottlenecks — always measurement-first, never premature optimization.
---

# WORKFLOW: PERFORMANCE OPTIMIZATION

**Version:** Gold v1.1
**Layer:** 8 — Execution Workflow
**Tier:** 2 — Loaded by task
**File:** global_workflows/workflow-optimize-performance.md
**Purpose:** Systematically identify and resolve performance bottlenecks.
**Loaded When:** Application is slow, high resource usage, or explicit optimization request.

---

## EXECUTION SUMMARY

| Phase | Goal | Key Action |
| :--- | :--- | :--- |
| **P1. Measure** | Establish Baseline | Profile the application under load |
| **P2. Identify** | Locate Bottleneck | Find the specific slow operation |
| **P3. Isolate** | Reproduce | Create a minimal test case |
| **P4. Fix** | Optimize | Implement the targeted improvement |
| **P5. Verify** | Validate | Compare metrics against baseline |

---

## QUALITY GATES

- **G1 (Metrics):** Never optimize without measurement. "I think it's slow" is not a bug.
- **G2 (Isolation):** Isolate the bottleneck before touching code.
- **G3 (Regression):** Performance fixes must not break functionality.

---

## VERSION HISTORY

| Version | Date | Changes |
| :--- | :--- | :--- |
| Gold v1.1 | Initial | Systematic sequence for identifying and resolving bottlenecks |
