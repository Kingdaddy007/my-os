# MEMORY: MISTAKES TO AVOID

**Version:** Gold v1.0
**Layer:** 12 — Institutional Learning
**Tier:** 3 — Loaded on demand
**File:** memory/mistakes-to-avoid.md
**Purpose:** Records mistakes that have been made, their root causes, and how to avoid repeating them. This is the organizational scar tissue — hard-won lessons that prevent repeat failures.
**Loaded When:** Working in an area where past mistakes occurred. Building something similar to a past failure. Reviewing an area that has a known trap. Onboarding to understand project history.
**Format:** Append-only. Never delete entries — past mistakes remain relevant even after fixes are in place.

---

## WHEN TO ADD AN ENTRY

Add an entry when:

- A bug reaches production that should have been caught earlier
- A technical decision turns out to be wrong and the cost was real
- The same type of mistake happens twice — a pattern has been detected
- An incident reveals a systemic or structural weakness
- A code review catches something that almost shipped
- You think — "I do not want to make this mistake again"

Do NOT log:

- Every small bug — only log bugs with lessons worth remembering
- Mistakes that are obvious and unlikely to recur in any form
- Mistakes already documented in `postmortems.md` — reference the postmortem instead
- Blame or emotional venting — this file is for pattern recognition and prevention, not attribution
- Tiny mistakes with no real recurrence risk or structural lesson

---

## HOW TO USE THIS FILE

Anti-Gravity should consult this file when:

- Working in an area where past mistakes are known to have occurred
- Building something similar to a previous failure
- Reviewing or auditing an area with known traps
- A recurring mistake or regression suggests a pattern exists

If a mistake happens more than once, it is no longer just an accident. It is a pattern, and it belongs in this file.

If the project has already paid for a mistake once, Anti-Gravity should try hard not to make it pay again.

---

## ENTRY FORMAT

[YYYY-MM-DD] — [Mistake Title]

Category
[Coding / Architecture / Testing / Security / API / Infra / Release / Product / Process / Domain]

What Happened
[Factual description of what went wrong — not blame, just facts]

Impact
[Who was affected? How severely? How long did it last?]

Root Cause
[Why did this happen? Not "someone made an error" — what structural issue allowed this mistake to occur and not be caught?]

Warning Signs
[What signals usually appear before this mistake happens again?]

- [signal 1]
- [signal 2]
- [signal 3]

How It Was Fixed
[What was done to resolve the immediate issue?]

How to Prevent Recurrence
[What check, test, process, or pattern prevents this class of mistake?]

- [prevention 1]
- [prevention 2]
- [prevention 3]

The Lesson
[One sentence: what to remember next time you are in a similar situation]

Related Files / Areas

- [postmortem / benchmark / context / workflow / ADR / code area]
- [related item 2]

Tags: #auth #database #deployment #testing #scope-creep #performance

---

## CATEGORY INDEX

> **For Anti-Gravity:** Before starting any task, scan the relevant category below.
> Only read the full entries if a category title matches your current work area.

### Build / Compile Failures
<!-- Entries tagged: #build #compile #dependency #import -->
- [Jump to entries tagged #build]

### Data Integrity
<!-- Entries tagged: #data-integrity #timestamp #candles #database #migration -->
- [2026-03-27] Candle Jump Bug From Epoch Format Mismatch — mixed seconds/milliseconds

### UI / Frontend Bugs
<!-- Entries tagged: #lwc #crash #split-view #rendering #css -->
- [2026-04-05] Zombie Series Crash on Split-View Timeframe Switch — stale series references

### Architecture / Design Decisions
<!-- Entries tagged: #architecture #refactor #structure #module -->
- (none yet)

### Security / Auth
<!-- Entries tagged: #auth #security #authorization #data-leakage -->
- (none yet — see Example Entry for reference pattern)

### API / Integration
<!-- Entries tagged: #api #websocket #integration #deriv -->
- (none yet)

### Testing / Verification
<!-- Entries tagged: #testing #regression #edge-case -->
- (none yet)

### Tooling / Process
<!-- Entries tagged: #tooling #python #process #npm #config -->
- [undated] NotebookLM MCP Server Module Name Mismatch — package≠module name

### Performance
<!-- Entries tagged: #performance #memory #cpu #bottleneck -->
- (none yet)

> **Rule:** When adding a new entry below, also add a one-line summary to the relevant category above.
> This index should always be scannable in under 10 seconds.

---

## QUALITY BAR FOR ENTRIES

A strong entry:

- Describes a recurring or important failure mode with real cost
- Identifies the structural root cause — not just the surface event
- Gives concrete prevention rules that can be applied proactively
- Includes warning signs so the mistake can be caught before it recurs
- Is specific enough to guide future reviews and recommendations

A weak entry:

- Is too vague or emotional to guide future behavior
- Records something trivial with no future relevance
- Lacks a prevention principle — only describes what went wrong
- Attributes blame without identifying structural cause
- Records something already obvious and unlikely to recur

---

## USAGE RULES

1. Record recurring mistakes and mistakes with real cost — not one-off trivial errors.
2. Focus on mistakes that produced:
   - Real bugs or production incidents
   - Repeated confusion or regressions
   - Security risk or data integrity issues
   - Structural weakness that persisted over time
3. Keep corrective guidance concrete and actionable.
4. Do not delete history silently — if a mistake is no longer relevant, mark it as historical rather than removing it.
5. Use this file to improve future recommendations, reviews, and workflow discipline.
6. Most recent entries appear at the top.

---

## EXAMPLE ENTRY

2024-05-22 — Read Queries Missing Project Membership Check

Category
Security / Authorization

What Happened
A user who was removed from a project could still view that project's tasks on the sprint board. Write operations correctly returned 403, but read operations only checked if the project existed — not whether the user was still a member.

Impact
Data leakage across authorization boundaries. Unknown number of removed users may have viewed project data after removal. Duration approximately three months since the feature was originally built.

Root Cause
The authorization check pattern was applied inconsistently. Write operations all checked project membership. Read operations only checked that the project existed. There was no centralized membership check helper — each developer implemented their own check, and reads were not treated as requiring the same authorization rigor as writes.

Warning Signs

- Authorization is only applied in Server Actions but not in query functions or data fetching paths
- A new read endpoint is added without a corresponding membership or permission check
- "Works for me" testing only tests the happy path as a valid member

How It Was Fixed

- Created a centralized membership verification helper used by ALL data access paths — read and write
- Added the check to all read query functions
- Wrote integration tests for every read path verifying non-member access returns 403
- Added to the security review checklist: "verify read AND write authorization"

How to Prevent Recurrence

- The centralized membership helper is now mandatory for all data access
- Code review checklist explicitly includes authorization check verification for read paths
- Integration tests cover non-member access for every endpoint

The Lesson
Authorization checks must be applied to reads, not just writes. If a user cannot modify data, they should not be able to see it either.

Related Files / Areas

- memory/postmortems.md
- contexts/security-baselines.md
- skill-security.md

Tags: #auth #security #authorization #data-leakage

---

## ENTRIES

<!-- Append new entries below this line. Most recent at the top. -->
2026-04-05 — Zombie Series Crash on Split-View Timeframe Switch

Category
Coding / UI

What Happened
Switching timeframes in split-view mode caused chart crashes. Old series objects remained attached to the chart after a new series was created for the new timeframe. LWC threw errors when data updates hit the stale (zombie) series references.

Impact
Terminal crashes during active trading analysis. Required page refresh to recover. Lost tick buffer history each time.

Root Cause
The `switchTimeframe()` method created new series without first removing the old ones. The old series references persisted in the slot's state object and continued receiving data updates from the tick pipeline, causing LWC to throw "series was removed" errors.

Warning Signs

- Console errors mentioning series that should no longer exist
- Chart slots showing mixed data from two timeframes
- Crashes only occurring during timeframe switching, not on initial load

How It Was Fixed
Added explicit `chart.removeSeries(oldSeries)` before creating new series. Updated the slot state to null out old series references immediately upon removal. Added a guard in the tick pipeline to skip updates if series reference is null.

How to Prevent Recurrence

- Always remove old series before creating new ones — treat series lifecycle as create/destroy, never reuse
- Add null guards in any data pipeline that writes to series references
- Test timeframe switching explicitly — it is a different code path from initial creation

The Lesson
When replacing a visual component backed by a library, always clean up the old instance BEFORE creating the new one. The library holds internal state that becomes toxic if the old instance receives updates.

Related Files / Areas
- client/js/core/App.js (ChartSlot.switchTimeframe)
- memory/decisions-log.md

Tags: #coding #lwc #crash #split-view

---

2026-03-27 — Candle Jump Bug From Epoch Format Mismatch

Category
Coding / Data Integrity

What Happened
Candles appeared to "jump" — showing impossibly large price movements between adjacent candles. The chart looked broken with massive gaps and spikes that did not correspond to real price action.

Impact
Charts were unreliable for analysis. Multiple hours debugging across server and client before root cause was identified.

Root Cause
The Deriv API returns tick epochs in seconds, but some client-side processing paths were treating them as milliseconds (or vice versa). When a candle time bucket was calculated with the wrong unit, ticks were assigned to the wrong candle, producing artificial jumps.

Warning Signs

- Candle OHLC values that don't make physical sense (e.g., 10x normal range)
- Candle timestamps that are 1000x too large or too small
- Charts that look correct initially but break after a specific timeframe switch

How It Was Fixed
Standardized all timestamp handling to seconds-epoch throughout the entire pipeline. Added `sanitizeCandleBar()` validation that rejects candles with time values above a reasonable threshold (indicating milliseconds were passed instead of seconds).

How to Prevent Recurrence

- ALL timestamps in the pipeline must be in seconds-epoch — never milliseconds
- The boundary guard wrapper (sanitizeCandleBar) catches this class of error automatically
- When integrating any new data source, verify its epoch format before connecting to the pipeline

The Lesson
Pick ONE timestamp format for the entire system and enforce it at every boundary. Mixed formats are invisible until they produce catastrophic visual bugs.

Related Files / Areas
- server/candleAggregator.js
- client/js/core/App.js (sanitizeCandleBar)

Tags: #coding #data-integrity #timestamp #candles

---



Category
Process / Tooling

What Happened
The system prompt used `notebooklm_mcp_server` as the module name in `mcp_config.json`, assuming it matched the pip package name exactly. This caused a connection failure.

Impact
Approximately 30 minutes of troubleshooting and user confusion before the correct module path was identified.

Root Cause
Assuming package-to-module parity without verifying the `site-packages` structure or using `pip show -f`. 

Warning Signs

- [ ] "No module named X" error when running a tool via `python -m`.
- [ ] Package name contains hyphens (`notebooklm-mcp-server`) while modules usually use underscores.

How It Was Fixed
Audited the `site-packages` folder using `run_command` and identified `notebooklm_mcp` as the base folder and `server.py` as the entry point. Updated config to `notebooklm_mcp.server`.

How to Prevent Recurrence

- Always run `pip show -f <package>` to verify the actual module names before updating `mcp_config.json`.
- Test the module invocation manually using `python -m <module> --help` before committing to the config file.

The Lesson
Never assume the module name matches the package name. Verify the entry point in the environment before configuration.

Related Files / Areas
memory/decisions-log.md
mcp_config.json

Tags: #tooling #python #process
