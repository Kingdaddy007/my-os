# CORE: WORKFLOW STATE TRACKER

**Version:** Gold v1.1
**Layer:** 3 — Core Constitution
**File:** core/workflow-state-tracker.md
**Purpose:** Enables workflow persistence across sessions. When a workflow is interrupted or a session ends mid-execution, the AI can resume from the exact phase where work stopped — instead of starting over.

---

## HOW IT WORKS

### On Workflow Start

When any workflow is activated (e.g., `/workflow-build-feature`), Anti-Gravity MUST:

1. Check if a `workflow-state.json` exists in the project workspace (`.agents/workflow-state.json`)
2. If one exists and matches the current task area, ASK: "You have an active workflow in progress. Resume from where you left off?"
3. If starting fresh, create a new state file

### During Workflow Execution

At the END of each completed step/phase, Anti-Gravity MUST update the state file:

```json
{
  "workflow": "build-feature",
  "started_at": "2026-04-10T14:00:00Z",
  "updated_at": "2026-04-10T15:30:00Z",
  "current_phase": "IMPLEMENT",
  "phase_number": 7,
  "total_phases": 11,
  "completion_pct": 64,
  "status": "in_progress",
  "feature_summary": "Adding WebSocket reconnection with exponential backoff",
  "phases": {
    "1_define_objective": { "status": "done", "completed_at": "2026-04-10T14:05:00Z" },
    "2_ground_context": { "status": "done", "completed_at": "2026-04-10T14:12:00Z" },
    "3_define_scope": { "status": "done", "completed_at": "2026-04-10T14:18:00Z" },
    "4_identify_risks": { "status": "done", "completed_at": "2026-04-10T14:25:00Z" },
    "5_design_shape": { "status": "done", "completed_at": "2026-04-10T14:40:00Z" },
    "6_verification_plan": { "status": "done", "completed_at": "2026-04-10T14:50:00Z" },
    "7_implement": { "status": "in_progress", "started_at": "2026-04-10T14:55:00Z" },
    "8_self_review": { "status": "pending" },
    "9_verify": { "status": "pending" },
    "10_deliver": { "status": "pending" },
    "11_post_ship": { "status": "pending" }
  },
  "notes": "Completed server-side WebSocket handler. Still need client reconnection logic.",
  "key_decisions": [
    "Using exponential backoff with jitter, max 30s delay",
    "Storing reconnection state in sessionStorage, not localStorage"
  ],
  "blockers": []
}
```

### On Workflow Completion

When the final phase completes:
1. Set `status` to `"completed"`
2. Set `completion_pct` to `100`
3. Keep the file for 24 hours as reference, then mark for cleanup

### On Session Resume

When Anti-Gravity starts a new session and detects `.agents/workflow-state.json`:

1. Read the file
2. Announce: "You have an active **[workflow name]** workflow — currently at **Phase [N] ([phase name])** ([pct]% complete). Notes: [notes]. Resume?"
3. If yes: load the relevant workflow file and jump to the active phase
4. If no: archive the state and start fresh

---

## STATE VALUES

| Status | Meaning |
|:---|:---|
| `pending` | Phase not yet started |
| `in_progress` | Phase currently active |
| `done` | Phase completed successfully |
| `blocked` | Phase cannot proceed — see `blockers` |
| `skipped` | Phase not needed for this task |

---

## WORKFLOW PHASE MAPS

### build-feature
1. define_objective → 2. ground_context → 3. define_scope → 4. identify_risks → 5. design_shape → 6. verification_plan → 7. implement → 8. self_review → 9. verify → 10. deliver → 11. post_ship

### debug-issue
1. observe_symptoms → 2. reproduce → 3. isolate → 4. hypothesize → 5. verify_cause → 6. fix → 7. verify_fix → 8. regression_check → 9. document → 10. post_ship

### design-ui
1. user_goals → 2. information_architecture → 3. component_inventory → 4. state_coverage → 5. visual_design → 6. implement → 7. accessibility → 8. verify → 9. deliver → 10. post_ship

### plan-architecture
1. understand_requirements → 2. identify_constraints → 3. enumerate_options → 4. evaluate_tradeoffs → 5. make_decision → 6. document_adr → 7. communicate

### project-inception
1. understand_idea → 2. define_scope → 3. choose_stack → 4. design_architecture → 5. sequence_work → 6. create_contexts → 7. deliver_plan

---

## RULES

1. **Always check for active workflow state at the start of any workflow activation.**
2. **Never silently overwrite an existing state file.** Ask first.
3. **Update state after every completed phase** — not at the end. This is the whole point.
4. **Keep `notes` field current** — it's the most useful part for resuming.
5. **State file location:** `.agents/workflow-state.json` in the project workspace.
6. **Only ONE active workflow at a time.** If a new workflow is needed, the current one must be completed, paused, or archived.

---

## INTEGRATION WITH MASTER PROMPT

Add to GEMINI.md Section 6 (EXECUTION PROCESS):

> Before executing any workflow, check `.agents/workflow-state.json` for active state. Resume or archive before starting new work.

Add to GEMINI.md Section 10 (RECURRING BEHAVIORS):

> **Session starts** → Check for active workflow state. Announce if found.
> **Workflow phase completes** → Update state file immediately.
> **Session ends mid-workflow** → Ensure state file reflects current progress.
