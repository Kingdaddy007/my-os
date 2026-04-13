# TEMPLATE: PROJECT BRIEF

**Version:** Gold v1.0
**Layer:** 9 — Output Contract
**Tier:** 3 — Loaded on demand
**File:** templates/project-brief.md
**Purpose:** Standardized format for the output of project inception —
          the complete reference document that guides all subsequent
          engineering work. This is the "north star" for the project.
**Loaded When:** Completing workflow-project-inception.md Phase 5.
              Starting any new project, hackathon, or initiative.
**Referenced By:** workflow-project-inception.md

---

## WHEN TO USE THIS TEMPLATE

Use this template when:

- Completing the Project Inception workflow
- Starting a new project, hackathon, or competition
- Documenting the plan for a new product or major initiative
- Creating a reference document that the team (or just you) will use
  throughout the entire build

Do NOT use for:

- Individual features within an existing project → use `feature-plan.md`
- Large multi-quarter initiatives → use `prd-template.md`
- Architectural decisions within an existing project → use `architecture-decision-record.md`

---

## THE TEMPLATE

## PROJECT BRIEF: [Project Name]

### Metadata (Project Brief)

- **Author:** [Name]
- **Date:** [YYYY-MM-DD]
- **Type:** [New Product / Hackathon / Side Project / Competition / Client Project]
- **Timeline:** [Start date → End date / Deadline]
- **Status:** [Planning / In Progress / Shipped / Abandoned]

---

### 1. THE PROBLEM

#### Problem Statement (Section 1)

<!-- One paragraph. No technical language. A non-technical person should understand what problem you're solving. -->

[Target user] struggles with [specific problem] because [root cause].
Currently they [current workaround], which is [why it's inadequate].

#### Target User (Section 1)

| Dimension | Details |
| :--- | :--- |
| **Who** | [Specific description — not "everyone"] |
| **Context** | [When/where they encounter the problem] |
| **Current behavior** | [What they do today to solve this] |
| **Technical comfort** | [Low / Medium / High] |
| **Scale** | [How many people have this problem?] |

#### Job-to-be-Done (Section 1)

When **[situation]**, **[user]** wants to **[motivation]** so that they can **[outcome]**.

#### Why Now (Section 1)

<!-- What makes this the right time to build this? Competition deadline? Market opportunity? Personal need? -->

[Urgency justification]

---

### 2. THE SOLUTION

#### One-Sentence Description (Section 2)

<!-- If you can't explain it in one sentence, you don't understand it yet. -->

**[Product name]** is a **[type of product]** that helps **[user] [accomplish job]** by **[key differentiator]**.

#### Core Value Proposition (Section 2)

<!-- What is the ONE thing this product does better than alternatives? -->

[The single most important value this provides]

---

### 3. MVP SCOPE

#### 🔴 Core Features (Must Have for V1)

<!-- These are the ONLY features you're building. Everything else waits. -->

| # | Feature | User Value | Why It's Core |
| :--- | :--- | :--- | :--- |
| 1 | [Feature] | [What it enables the user to do] | [Why MVP doesn't work without it] |
| 2 | [Feature] | [Value] | [Why core] |
| 3 | [Feature] | [Value] | [Why core] |
| 4 | [Feature] | [Value] | [Why core] |

#### 🟡 Phase 2 Features (After MVP Ships)

<!-- Important but NOT in v1. Listed to prevent scope creep. -->

- **[Feature]** — [why it can wait]
- **[Feature]** — [why it can wait]
- **[Feature]** — [why it can wait]

#### 🟢 Future Ideas (Maybe Someday)

- [Feature]
- [Feature]

#### ⚫ Explicitly Out of Scope

<!-- Things you've DECIDED not to build. Be specific. -->

- [NOT building X because Y]
- [NOT building X because Y]

---

### 4. DEFINITION OF DONE

#### MVP is SHIPPED when (Section 4)

- [ ] [Core feature 1] works end to end
- [ ] [Core feature 2] works end to end
- [ ] [Core feature 3] works end to end
- [ ] User can [complete the primary job] without assistance
- [ ] Deployed to [target environment]
- [ ] [Competition-specific: submitted to GitHub / demo-ready / etc.]

#### Quality Minimum (Section 4)

- No broken flows in the core features
- Basic error handling (user sees helpful message, not crash)
- Works on [target devices/browsers]
- Basic security (auth works, inputs validated)
- README written (especially for competitions)

---

### 5. TECH STACK

| Layer | Technology | Why |
| :--- | :--- | :--- |
| **Frontend** | [Framework + version] | [Brief rationale] |
| **Backend** | [Framework/approach] | [Brief rationale] |
| **Database** | [Engine] | [Brief rationale] |
| **Authentication** | [Approach] | [Brief rationale] |
| **Hosting** | [Provider] | [Brief rationale] |
| **Deployment** | [Approach] | [Brief rationale] |

#### Key Technical Decisions (Section 5)

| Decision | Choice | Why | Alternatives Rejected |
| :--- | :--- | :--- | :--- |
| [Decision 1] | [Choice] | [Rationale] | [What else was considered] |
| [Decision 2] | [Choice] | [Rationale] | [Alternatives] |

---

### 6. DATA MODEL

#### Entities (Section 6)

| Entity | Key Fields | Relationships |
| :--- | :--- | :--- |
| [Entity 1] | [fields] | [relationships] |
| [Entity 2] | [fields] | [relationships] |
| [Entity 3] | [fields] | [relationships] |

#### Entity Relationship Diagram (Simple)

```text
[Entity 1] ──has many──▶ [Entity 2]
[Entity 2] ──belongs to──▶ [Entity 1]
[Entity 2] ──has many──▶ [Entity 3]
```

---

### 7. BUILD SEQUENCE

#### Step-by-Step (Section 7)

| Step | What | Estimated Time | Depends On | Verify |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Project setup + folder structure + dev environment | [time] | Nothing | Runs locally |
| 2 | Database schema + migrations + seed data | [time] | Step 1 | Can read/write data |
| 3 | Authentication | [time] | Steps 1-2 | Can log in, routes protected |
| 4 | [Core Feature 1] — Backend | [time] | Steps 1-3 | Works via API/action |
| 5 | [Core Feature 1] — Frontend | [time] | Step 4 | Works end-to-end in browser |
| 6 | [Core Feature 2] — Full stack | [time] | Steps 1-3 | Works end-to-end |
| 7 | [Core Feature 3] — Full stack | [time] | Steps 1-3 | Works end-to-end |
| 8 | Integration + Polish | [time] | Steps 4-7 | Full user flow works |
| 9 | Testing + Hardening | [time] | Step 8 | No broken flows |
| 10 | Deploy + Submit | [time] | Step 9 | Live and working |

#### Timeline Mapping (Section 7)

| Day/Period | Steps | Goal |
| :--- | :--- | :--- |
| [Day 1] | Steps 1-3 | Foundation + Auth working |
| [Day 2] | Steps 4-6 | Core features working |
| [Day 3] | Steps 7-8 | All features + integration |
| [Day 4] | Steps 9-10 | Polish + Deploy + Submit |

#### Deploy Early Rule

> Deploy a skeleton by [Day/Step]. Don't wait until the last day.
> Discover deployment issues early.

---

### 8. RISKS AND MITIGATION

| # | Risk | Likelihood | Impact | Mitigation |
| :--- | :--- | :--- | :--- | :--- |
| 1 | [Risk] | [H/M/L] | [H/M/L] | [Plan] |
| 2 | [Risk] | [H/M/L] | [H/M/L] | [Plan] |
| 3 | [Risk] | [H/M/L] | [H/M/L] | [Plan] |

#### Riskiest Assumption (Section 8)

- **Assumption:** [The one thing that must be true for this to work]
- **If wrong:** [What we'd do instead]

#### Scope Pressure Plan (Section 8)

If behind schedule:

1. **First to cut:** [lowest-priority Core feature → move to Phase 2]
2. **Second to cut:** [next lowest]
3. **NEVER cut:** [the one feature that IS the product]
4. **NEVER cut:** quality (broken features are worse than missing features)

---

### 9. COMPETITION-SPECIFIC (Section 9)

| Dimension | Details |
| :--- | :--- |
| **Competition name** | [Name] |
| **Dates** | [Start → End] |
| **Submission method** | [GitHub repo / Demo link / Presentation] |
| **Judging criteria** | [What judges evaluate — map features to criteria] |
| **Required deliverables** | [README, demo video, presentation, etc.] |
| **Team size** | [Solo / Team of N] |

#### README Strategy (Section 9)

The README should include:

- What the project does (one paragraph)
- The problem it solves
- Screenshots or demo GIF
- Tech stack
- How to run locally
- What you'd build next (shows vision beyond MVP)

---

### 10. REFERENCE LINKS

- **GitHub repo:** [link]
- **Live URL:** [link]
- **Design mockups:** [link]
- **Competition page:** [link]

---

## QUALITY CRITERIA FOR A GOOD PROJECT BRIEF

- [ ] Problem stated in user language (no technical jargon in Section 1)
- [ ] Target user is specific (not "everyone")
- [ ] MVP scope contains ONLY core features (no gold-plating)
- [ ] "Out of Scope" is populated (scope boundaries are explicit)
- [ ] Definition of Done is checkable (not vague)
- [ ] Tech stack has rationale (not "because I like it")
- [ ] Build sequence is ordered with verification points
- [ ] Timeline is realistic given available time
- [ ] Risks identified with mitigation plans
- [ ] Scope pressure plan exists (what to cut if behind)
