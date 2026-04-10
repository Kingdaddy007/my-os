# MEMORY: COMMON PATTERNS

**Version:** Gold v1.0
**Layer:** 12 — Institutional Learning
**Tier:** 3 — Loaded on demand
**File:** memory/common-patterns.md
**Purpose:** Captures reusable patterns that work well in YOUR project — proven solutions to recurring problems that should be applied consistently rather than reinvented each time.
**Loaded When:** Implementing something that has a known pattern. Building a feature similar to a previous one. Looking for the standard way to do something in this project.
**Format:** Append-only. Mark patterns as deprecated rather than deleting.

---

## WHEN TO ADD AN ENTRY

Add an entry when:

- You solve a problem and realize the same pattern will apply elsewhere
- A pattern has proven valuable across three or more uses — the Rule of Three
- The team standardizes an approach that should become the default
- A code review reveals a better way that should replace prior practice

Do NOT log:

- Patterns already documented in `coding-standards.md` — that is the conventions file
- Generic programming patterns that are not project-specific
- One-off solutions that are unlikely to recur
- Patterns that are still too speculative to validate
- Vague observations with no practical implementation guidance

---

## HOW TO USE THIS FILE

Anti-Gravity should consult this file when:

- Implementing something that may have a known solution shape
- Building a feature similar to a previous one
- Looking for the standard way to solve a recurring problem in this project
- A code review or postmortem suggests a pattern should be standardized

This file helps Anti-Gravity become faster and more accurate by reusing known-good approaches instead of rediscovering them every time. If the same good solution shape appears repeatedly and predictably, it belongs here as reusable knowledge rather than accidental repetition.

---

## ENTRY FORMAT

[YYYY-MM-DD] — [Pattern Name]

Category
[Architecture / Coding / Testing / API / UI-UX / Security / Infra / Workflow / Product / Auth]

Problem It Solves
[What recurring problem does this pattern address?]

The Pattern
[Concise description of the approach — with code example if applicable]

When to Apply
[What signals indicate this pattern should be used?]

- [condition 1]
- [condition 2]
- [condition 3]

When NOT to Apply
[What situations look similar but require a different approach?]

- [condition 1]
- [condition 2]

Why It Works Here
[Why this pattern fits this project specifically — not just in general]

Tradeoffs and Limits
[What cost comes with it? When does it break down?]

- [tradeoff or limit 1]
- [tradeoff or limit 2]

Where It Is Used
[List of existing places this pattern is already applied]

Related Files / Areas

- [skill / workflow / context / ADR / code area]
- [related item 2]

Tags: #architecture #coding #auth #api #error-handling #validation

---

## QUALITY BAR FOR ENTRIES

A strong pattern entry:

- Has reuse value across more than one task or module
- Is validated in this project — not just a general best practice
- Explains why the pattern fits this project specifically
- Includes clear "when NOT to use" limits so it is not over-applied
- Reduces ambiguity, repeated mistakes, inconsistency, or implementation time

A weak pattern entry:

- Is too generic to guide actual work
- Describes taste or preference rather than an operational solution
- Records something seen only once with no evidence of recurrence
- Lacks limits — treating the pattern as universally applicable
- Becomes a random snippet dump rather than reusable knowledge

---

## USAGE RULES

1. Store patterns that have been validated in this project, not generic best practices imported from elsewhere.
2. Prefer patterns that reduce:
   - Ambiguity about the right approach
   - Repeated mistakes and inconsistency
   - Implementation time on recurring problems
3. Mark deprecated patterns clearly rather than deleting them — the history of why something was retired is itself useful.
4. Update patterns as the system evolves and better approaches emerge.
5. Most recent entries appear at the top.

---

## EXAMPLE ENTRY

2024-04-10 — Server Action Result Pattern

Category
Coding / Error Handling

Problem It Solves
Server Actions need a consistent way to return success or failure without throwing exceptions, which are hard for the client to handle gracefully and produce inconsistent error experiences.

The Pattern
Every Server Action returns a discriminated union:

```typescript
type ActionResult<T> =
| { success: true; data: T }
| { success: false; error: string; code?: string };
```

Pattern in action:

```typescript
export async function createTask(
  input: unknown
): Promise<ActionResult<Task>> {
  const parsed = taskSchema.safeParse(input);
  if (!parsed.success) {
    return {
      success: false,
      error: 'Invalid input',
      code: 'VALIDATION_ERROR'
    };
  }

  const session = await auth();
  if (!session) {
    return {
      success: false,
      error: 'Not authenticated',
      code: 'AUTH_ERROR'
    };
  }

  try {
    const task = await insertTask(parsed.data);
    return { success: true, data: task };
  } catch (error) {
    logger.error('Failed to create task', { error });
    return {
      success: false,
      error: 'Failed to create task',
      code: 'INTERNAL_ERROR'
    };
  }
}
```

When to Apply

- Any Server Action called directly from the UI
- Any mutation that can fail in multiple distinct ways
- Any operation where the client needs to distinguish error types

When NOT to Apply

- API routes for external consumers — use HTTP status codes instead
- Webhook handlers — use standard HTTP responses
- Read-only data fetching that throws on error is acceptable

Why It Works Here
The project uses Server Actions as the primary mutation mechanism. A consistent result shape means all UI components handle errors the same way — no inconsistent try/catch patterns scattered across feature files.

Tradeoffs and Limits

- Adds a small wrapper layer to every action
- Requires discipline to not mix this pattern with raw throws
- Does not replace proper logging — errors should still be logged before returning a failure result

Where It Is Used

- features/tasks/actions/
- features/sprints/actions/
- features/projects/actions/

Related Files / Areas

- contexts/coding-standards.md
- skill-coding.md

Tags: #server-action #error-handling #coding #pattern

---

## ENTRIES

<!-- Append new entries below this line. Most recent at the top. -->
2026-03-28 — LWC Series Boundary Guard Wrapper

Category
Coding / Crash Prevention

Problem It Solves
LightweightCharts v5 crashes with opaque errors when receiving null values, duplicate timestamps, or millisecond-epoch timestamps. Every chart slot needs the same protection.

The Pattern
Wrap all series data methods through a centralized guard:

```javascript
function wrapGridSeries(series, slotLabel) {
  const origUpdate = series.update.bind(series);
  series.update = (bar) => {
    const clean = sanitizeCandleBar(bar, slotLabel);
    if (!clean) return; // drop invalid data, don't crash
    origUpdate(clean);
  };
  // Same wrapping for setData
}
```

Plus a Black Box Recorder: `window.__lastSeriesCall = { method, data, slot, time }` — captures the last call for instant crash diagnosis.

When to Apply

- Any new chart slot or series is created
- Any time LWC v5 receives data from an external source (API, WebSocket)
- After any chart library upgrade

When NOT to Apply

- Static demo charts with hardcoded data
- Non-LWC charting libraries that handle invalid data gracefully

Why It Works Here
The terminal receives thousands of ticks per minute over WebSocket. One malformed tick used to crash the entire chart grid. The wrapper makes crashes impossible from bad data.

Tradeoffs and Limits

- Small performance overhead per data point (microseconds)
- Must be maintained if LWC API changes

Where It Is Used

- client/js/core/App.js — all chart slots

Related Files / Areas

- memory/decisions-log.md (LWC Boundary Guard decision)

Tags: #coding #crash-prevention #lwc #error-handling

---

2026-04-07 — Tick Dedup and Gap Detection Pattern

Category
Coding / Data Integrity

Problem It Solves
Deriv WebSocket sometimes sends duplicate ticks (same epoch) or has gaps. Without detection, duplicate ticks cause LWC "non-increasing time" crashes to occur, and gaps result in misleading candles.

The Pattern
Store `lastTickEpoch` per symbol. On each tick:

```javascript
if (tick.epoch <= lastTickEpoch) return; // dedup
if (tick.epoch - lastTickEpoch > GAP_THRESHOLD) {
  console.warn(`Tick gap detected: ${tick.epoch - lastTickEpoch}s`);
}
lastTickEpoch = tick.epoch;
```

When to Apply

- Any real-time tick pipeline from Deriv API
- Any system that feeds sequential data to LWC

When NOT to Apply

- Historical backfill (timestamps may have expected gaps)
- Aggregated candle data (already deduplicated by time bucket)

Why It Works Here
V100 1-second synthetic index generates ticks every ~500ms. Dedup prevents the most common LWC crash. Gap detection alerts if the feed is unhealthy.

Tradeoffs and Limits

- Drops valid ticks if server sends same-epoch updates (rare)
- Gap detection is informational only — no auto-recovery

Where It Is Used

- server/index.js — tick processing pipeline

Tags: #coding #data-integrity #websocket #lwc

---

2026-04-07 — Historical Candle Merge Strategy

Category
Architecture / Data Pipeline

Problem It Solves
Tick-derived candles only go back ~5 hours. Higher timeframes need deeper history. Need to merge API-fetched historical candles with live tick-derived candles without duplicates.

The Pattern
Use a Map keyed by candle time (seconds epoch). Historical candles go in first. Tick-derived candles override for the same key. Convert back to sorted array:

```javascript
function _mergeCandles(historicalArray, tickDerivedArray) {
  const map = new Map();
  historicalArray.forEach(c => map.set(c.time, c));
  tickDerivedArray.forEach(c => map.set(c.time, c)); // overrides
  return [...map.values()].sort((a, b) => a.time - b.time);
}
```

When to Apply

- Any timeframe candle data that combines historical API data with live data
- Bootstrap phase when connecting a new client

When NOT to Apply

- Pure tick-derived timeframes (5s, 15s) that have sufficient history from ticks alone

Why It Works Here
The terminal needs instant chart history. Map-based merge is O(n), handles dedup automatically, and always prefers the freshest data.

Tradeoffs and Limits

- Memory: holds all candles in a Map briefly during merge
- Assumes historical and live candles use the same time format (seconds epoch)

Where It Is Used

- server/index.js — _mergeCandles() during bootstrap and client reconnection

Tags: #architecture #data-pipeline #candles #pattern

