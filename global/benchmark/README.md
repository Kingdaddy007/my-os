# README — BENCHMARKS FOLDER

**Location:** `.antigravity/benchmark/`
**Layer:** 11 — Verification
**Loading Tier:** 3 — **LOADED ON DEMAND**

***

## PURPOSE

This folder contains repeatable test tasks designed to MEASURE whether
Anti-Gravity is improving over time. Benchmarks are specific, realistic
engineering scenarios that can be run periodically to evaluate output
quality against rubrics.

If you cannot measure improvement, you cannot prove improvement.
These files provide the measurement.

Without benchmarks, the system can become larger, more complicated,
and more confident without actually becoming better.

This folder answers one hard question honestly:
**Is Anti-Gravity actually getting better — or just getting louder?**

***

## WHAT BENCHMARKS ANSWER

- Is Anti-Gravity asking better questions now?
- Is it reasoning more structurally than before?
- Is it catching hidden tradeoffs more consistently?
- Is it producing cleaner, safer, more professional outputs?
- Is it staying in mode more reliably?
- Is it using context more effectively?
- Is it handling debugging, security, and architecture more rigorously?
- Where is the system still behaving like a weaker assistant?

***

## INVENTORY

| # | File | Tests | Rubric Used |
| :--- | :--- | :--- | :--- |
| 1 | [feature-build-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/feature-build-benchmarks.md) | Feature implementation scenarios | `rubric-code-quality.md` |
| 2 | [debugging-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/debugging-benchmarks.md) | Bug diagnosis and investigation scenarios | `rubric-debugging.md` |
| 3 | [architecture-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/architecture-benchmarks.md) | System design and structure scenarios | `rubric-architecture.md` |
| 4 | [review-audit-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/review-audit-benchmarks.md) | Code review and audit scenarios | `rubric-communication.md` |
| 5 | [ui-ux-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/ui-ux-benchmarks.md) | Interface design scenarios | `rubric-ux.md` |
| 6 | [api-data-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/api-data-benchmarks.md) | API and database design scenarios | `rubric-api.md` |
| 7 | [devops-runtime-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/devops-runtime-benchmarks.md) | DevOps and operational scenarios | `rubric-performance.md` |
| 8 | [security-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/security-benchmarks.md) | Security review and hardening scenarios | `rubric-security.md` |
| 9 | [decision-quality-benchmarks.md]({{GLOBAL_CONFIG_URI}}/benchmark/decision-quality-benchmarks.md) | Technical decisions under uncertainty | `rubric-architecture.md` + `rubric-communication.md` |

***

## LOADING RULES

**Load ONLY when deliberately testing Anti-Gravity's capabilities.**
Benchmark files are NOT loaded for ordinary user tasks. They are
evaluation tools, not live production task context.

Load benchmarks when:

- Evaluating a new system version or after significant file changes
- Comparing versions to verify improvement
- Diagnosing capability gaps
- Calibrating the AI operating system
- Testing whether a specific file change improved behavior

***

## HOW BENCHMARKS WORK

1. Load a benchmark file
2. Present the scenario to Anti-Gravity as a normal task
3. Let Anti-Gravity produce output using its full system — skills, contexts, and workflows active as appropriate
4. Evaluate the output against the corresponding rubric
5. Record the score in `memory/benchmark-results.md`
6. Compare scores across versions to verify improvement over time

***

## WHAT A STRONG BENCHMARK LOOKS LIKE

A strong benchmark should:

1. Define a realistic task with enough context to make it meaningful
2. Test one or more important capabilities without being artificial
3. Be stable enough for repeat comparison across versions
4. Reveal whether the system acts senior or junior
5. Stress the kinds of mistakes the system is most likely to make
6. Have clear evaluation criteria that map to rubric dimensions
7. Expose failure modes in reasoning, not just surface polish

***

## INTERACTION WITH OTHER FOLDERS

| Folder | Relationship |
| :--- | :--- |
| `rubrics/` | Benchmarks are evaluated using the corresponding rubric. Rubrics provide the scoring structure; benchmarks provide the test scenarios. |
| `memory/` | Benchmark results are stored in `benchmark-results.md` for version tracking and trend analysis. |
| `skills/` | Benchmarks stress domain behavior to verify that skill files produce quality output in practice. |
| `core/` | Benchmarks verify that core cognitive behaviors — reasoning quality, tradeoff awareness, mode discipline — manifest in real outputs. |
| `workflows/` | Benchmarks often reveal whether the right workflow discipline is being followed during execution. |

***

## STATUS

**These files are NOT YET BUILT.** They are a planned phase of the
build. When built, each file will contain three to five realistic
engineering scenarios with defined inputs, expected thinking process,
and evaluation criteria aligned to the corresponding rubric.

***

## MAINTENANCE

Update benchmarks when new skill files are added that need benchmark
coverage or existing benchmarks become too easy.

Expected frequency: Quarterly review.

***

## FINAL RULE

Benchmarks should make it possible to answer — with evidence, not
feeling — whether Anti-Gravity is improving across the dimensions
that matter for real engineering work.
