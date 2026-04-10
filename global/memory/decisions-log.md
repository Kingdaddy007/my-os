# MEMORY: DECISIONS LOG

**Version:** Gold v1.0
**Layer:** 12 — Institutional Learning
**Tier:** 3 — Loaded on demand
**File:** memory/decisions-log.md
**Purpose:** Records significant technical decisions and their reasoning so they are not re-litigated and future work can reference WHY choices were made.
**Loaded When:** Making a decision similar to one already made. Onboarding new contributors. Reviewing past architectural choices. Evaluating whether a past decision should be reconsidered.
**Format:** Append-only. Never edit past entries — add corrections as new entries.

---

## WHEN TO ADD AN ENTRY

Add an entry when:

- A Type 1 or Type 1.5 decision is made — architectural, technology, data model, API contract, deployment strategy, security posture
- The team debates an approach and reaches consensus
- A significant tradeoff is consciously accepted
- A decision is made that someone might question or re-litigate later
- A previous decision is reversed, updated, or superseded

Do NOT log:

- Routine implementation choices — variable naming, local refactoring
- Type 2 decisions that are easily and cheaply reversible
- Decisions already documented in Architecture Decision Records — reference the ADR instead
- Temporary task choices with no long-term impact
- Raw brainstorming or transient notes

---

## HOW TO USE THIS FILE

Anti-Gravity should consult this file when:

- A recurring decision topic or architecture question reappears
- The team is tempted to re-open a resolved issue without new evidence
- Historical rationale matters for current work
- Onboarding a new contributor or reviewing past choices

If the team keeps having the same argument repeatedly, the decision probably belongs in this file.

---

## ENTRY FORMAT

[YYYY-MM-DD] — [Decision Title]

Context
[What situation prompted this decision? What problem were we solving? What need led to this choice?]

Options Considered

[Option A] — [brief description and why it was considered]
[Option B] — [brief description and why it was considered]
[Option C] — [brief description and why it was considered]

Decision
[What we chose and WHY — one sentence summary, then reasoning]

Why This Path Was Chosen

[reason 1]
[reason 2]
[reason 3]

Tradeoffs Accepted
[What we sacrificed and why it is acceptable given the context]

Assumptions
[What must remain true for this decision to hold]

Review Trigger
[Under what condition should this decision be reconsidered? What new evidence or changed constraint would make it worth revisiting?]

Related Files / Areas

[ADR / context file / workflow / feature area / postmortem]
[related item 2]

Tags
[#architecture #database #auth #performance #tooling #process etc.]

---

## QUALITY BAR FOR ENTRIES

A strong entry:

- Captures something future work may genuinely need to reference
- Explains why the decision mattered at the time
- Records reasoning, not just outcomes
- Makes future reversal conditions explicit
- Is specific enough to reduce repeated debates

A weak entry:

- Stores trivial choices with no long-term consequence
- Lacks rationale — records what but not why
- Becomes a noisy history dump instead of useful decision memory
- Overwrites or silently edits past decisions instead of adding a new entry

---

## USAGE RULES

1. Record decisions that materially affect:
   - Architecture and system structure
   - Stack and tooling choices
   - API contracts and compatibility posture
   - Deployment and release strategy
   - Security posture and trust-boundary decisions
   - Product and engineering tradeoff patterns
   - Naming conventions and standards with long-term impact
2. Do not overwrite history silently — if a decision is revisited, add a new entry and mark the old one as superseded.
3. Most recent entries appear at the top.
4. Use this file to reduce repeated debates, not to freeze the system permanently against legitimate reconsideration.

---

## EXAMPLE ENTRY

2024-03-15 — Chose Zustand and React Query Over Redux

Context
Needed a state management approach for the frontend. Team debated the options during sprint planning. Multiple engineers had different prior experience and preferences.

Options Considered

Redux Toolkit — full-featured, some team experience, significant boilerplate
Zustand plus React Query — minimal client state plus server state separation with caching built in
Jotai — atomic state model, very lightweight, less ecosystem

Decision
Chose Zustand plus React Query. Zustand handles minimal client-only state such as UI toggles, modals, and sidebar state. React Query handles all server state — caching, refetching, and optimistic updates. This keeps client state trivially simple while giving robust server state management without building a caching layer ourselves.

Why This Path Was Chosen

Clear separation of concerns — server state and client state are fundamentally different problems
Less boilerplate than Redux for our actual usage pattern
React Query handles caching that we would have built manually anyway
Zustand is trivial to learn and leaves no footprint when not needed

Tradeoffs Accepted

Two tools instead of one unified state solution
Team needs to learn React Query patterns — upfront investment
Acceptable because the separation of concerns reduces total complexity over time

Assumptions

Server state remains dominant over complex client-only state
React Query continues to be actively maintained
Our client state needs remain simple — UI toggles, not complex local state machines

Review Trigger
If client-only state becomes complex beyond UI toggles, reconsider whether Zustand is sufficient or a different atomic model is better.

Related Files / Areas

contexts/stack-context.md
contexts/architecture-context.md

Tags: #architecture #frontend #state-management

---

## ENTRIES

<!-- Append new entries below this line. Most recent at the top. -->
2026-04-07 — Integrated Edge Lens Into Primary Terminal

Context
Edge Lens was a standalone HTML page (68KB). Two separate pages meant context switching, duplicate WebSocket connections, and fragmented UX.

Options Considered

Option A: Keep Edge Lens as a separate page — low effort but fragmented UX.
Option B: Embed Edge Lens as a tab within the terminal sharing the tick pipeline — higher effort but unified.
Option C: Build Edge Lens as a floating overlay — moderate effort but cluttered screen.

Decision
Chose Option B. Refactored into a self-contained ES module (EdgeLens.js, 67KB) integrated as a tab. Receives data from the shared tickBuf array, no separate WebSocket.

Why This Path Was Chosen

- Unified one-screen trading environment
- Shared tick pipeline eliminates data duplication
- Tab navigation keeps screen clean with instant access

Tradeoffs Accepted
67KB single module is large. Accepted because separate-page alternative was worse for UX and maintenance.

Assumptions
The terminal remains the primary interface. Module can be extracted back if needed.

Review Trigger
If terminal becomes too slow due to Edge Lens weight, consider lazy-loading or splitting back out.

Related Files / Areas
client/js/edgelens/EdgeLens.js, client/js/core/App.js, client/terminal.html

Tags: #architecture #ui #trading-terminal

---

2026-04-06 — Removed Bot Infrastructure, Pivoted to Manual Trading

Context
After building 5 automated strategies with a Swarm Engine, backtesting via the Discovery Engine showed insufficient edge (below 65% win rate) for V100 1-second ONETOUCH contracts.

Options Considered

Option A: Keep refining bot strategies — high ongoing effort, uncertain payoff.
Option B: Remove bot UI/controllers, keep strategy files, pivot to manual trading with Edge Lens — moderate effort, immediate UX improvement.
Option C: Abandon entire project — rejected.

Decision
Chose Option B. Bot controllers and panels removed from terminal. Strategy files and discovery engine preserved for future research.

Why This Path Was Chosen

- Data-driven: backtesting proved strategies lacked sufficient edge
- Removes UI complexity: bot panels were cluttering the terminal
- Preserves optionality: strategy code kept, not deleted

Tradeoffs Accepted
Weeks of bot development paused. Server-side bot files remain as dead code. Accepted because preserved code can be revived with better data.

Assumptions
Manual trading with indicators outperforms current bot strategies. Future data collection may reveal profitable patterns.

Review Trigger
If 30+ days of tick data reveals patterns above 65% win rate, reconsider bots.

Related Files / Areas
server/botController.js, server/swarmEngine.js, discovery-engine/, server/index.js

Tags: #architecture #strategy #bots #pivot

---

2026-04-07 — Multi-Timeframe Candle Aggregation With Historical Backfill

Context
Terminal originally only supported tick-derived candles (5s through 2m). Higher timeframes (5m, 15m, 1h, 4h, daily) needed for multi-timeframe analysis but could not be derived from the 5-hour tick history alone.

Options Considered

Option A: Only show tick-derived candles — limited analysis capability.
Option B: Fetch historical candles from Deriv API on bootstrap, merge with tick-derived — complete history instantly.
Option C: Use persistent database to accumulate history over time — best long-term but slow to populate.

Decision
Chose Option B. Server fetches 500-1000 candles per timeframe from Deriv API during bootstrap, stores in candleHistoryCache, merges with tick-derived candles via _mergeCandles(). Tick-derived candles override API candles for same time bucket.

Why This Path Was Chosen

- Instant chart history from moment of connection
- No persistence needed — acceptable for a trading terminal
- Merge strategy is simple: newer data always wins

Tradeoffs Accepted
Bootstrap takes 2-3 seconds longer. Accepted because users wait once and benefit is substantial.

Assumptions
Deriv API candle history endpoint remains available. 1000 candles per timeframe is sufficient.

Review Trigger
If bootstrap time exceeds 10 seconds, consider lazy-loading higher timeframes.

Related Files / Areas
server/index.js, server/derivClient.js, server/candleAggregator.js

Tags: #architecture #data-pipeline #candles

---

2026-03-28 — LWC Boundary Guard Pattern for Crash Prevention

Context
LightweightCharts v5 crashes with "Value is null" when it receives invalid data — null values, duplicate timestamps, or millisecond-epoch timestamps. Crashes were frequent and hard to debug.

Options Considered

Option A: Validate at every call site — error-prone, duplicated.
Option B: Wrap LWC series.update() and series.setData() with validation middleware — centralized.
Option C: Patch LightweightCharts source — fragile, breaks on updates.

Decision
Chose Option B. Created wrapGridSeries(), sanitizeCandleBar(), sanitizeTickPoint() functions that intercept all series data operations. Invalid data logged and dropped. Black Box Recorder (window.__lastSeriesCall) captures last call for crash forensics.

Why This Path Was Chosen

- Centralized validation: one fix covers all chart slots
- Black Box Recorder makes crash diagnosis instant
- LWC library remains unmodified — clean upgrade path

Tradeoffs Accepted
Small performance overhead per data point. Accepted because crash prevention is worth microseconds per tick.

Assumptions
LWC v5 API remains stable. Wrapper becomes redundant if they add built-in validation.

Review Trigger
When upgrading LightweightCharts, check if their API handles these cases natively.

Related Files / Areas
client/js/core/App.js

Tags: #architecture #crash-prevention #lwc #pattern

---



Context
The NotebookLM MCP server was failing to connect with a "No module named" error despite `notebooklm-mcp-server` being installed via pip.

Options Considered

Option A: Reinstall the package — discarded after confirming package files existed.
Option B: Update configuration to use `python -m notebooklm_mcp.server` — chosen after environment audit.

Decision
Chose Option B. The package name (`notebooklm-mcp-server`) and the module name (`notebooklm_mcp`) are different. The server entry point is a sub-module (`notebooklm_mcp.server`).

Why This Path Was Chosen

- Correctness: Matches the actual file structure found in `site-packages`.
- Precision: Avoids unnecessary re-installation which would fail anyway.
- Speed: Resolves the issue with a single config line change.

Tradeoffs Accepted
Accepted a slight deviation from the typical "package_name == module_name" convention common in simpler Python tools.

Assumptions

- Python 3.14 environment remains the primary runtime.
- The `notebooklm-mcp-server` package maintains its internal structure.

Review Trigger
If the package is updated and the entry point changes again, reconsider the configuration.

Related Files / Areas
mcp_config.json
brain/a74fba61-d9de-4d5b-b0cf-cb6479b038f2/walkthrough.md

Tags: #tooling #mcp #python #notebooklm
