# WORKFLOW: PROJECT INCEPTION

**Version:** Gold v1.0
**Layer:** 8 — Execution Workflow
**Tier:** 2 — Loaded by task
**File:** workflows/workflow-project-inception.md
**Purpose:** The systematic sequence for taking a raw idea and turning it
          into a structured, sequenced, executable project plan — the
          bridge between "I have an idea" and "let's start building."
**Loaded When:** Starting a new project, hackathon, competition, side project,
              or any initiative that begins with an idea and needs a plan.
**Inherits From:** execution-workflow.md (8-phase universal process)
**Note:** This workflow is the PRODUCT MANAGER function. It happens BEFORE
       any engineering work begins. Its output IS the engineering plan.

---

## WHAT THIS WORKFLOW DOES

This workflow transforms a raw idea into a buildable plan. It is the
"product manager" that Anti-Gravity needs before it can be the
"senior engineer."

The output of this workflow is:

1. A clear problem definition
2. A defined target user and their job
3. A feature breakdown
4. A prioritized MVP scope
5. A technical architecture
6. A sequenced build plan (phase by phase or day by day)
7. A definition of "done" (what does shipped look like?)

After this workflow completes, every subsequent step uses the other
workflows (build-feature, design-api, design-ui, etc.) to execute
the plan.

---

## THE GAP THIS FILLS

| Without This Workflow | With This Workflow |
| :--- | :--- |
| "I have an idea, let me start coding" | "I have an idea, let me define what I'm building first" |
| Features discovered mid-build | Features mapped upfront, prioritized, sequenced |
| Architecture emerges accidentally | Architecture designed deliberately |
| No definition of done | Clear shipping criteria |
| Scope grows endlessly | Scope bounded with Phase 1 / Phase 2 separation |
| 80% built, never finished | Clear path to "version 1 is DONE" |

---

## ACTIVATION

### Use When

- "I have an idea for an app/tool/website"
- "I want to build [something new]"
- "Let's start a new project"
- "I'm entering a hackathon — help me plan"
- "I want to turn this idea into something real"
- Starting any initiative from scratch

### Do NOT Use When

- Adding a feature to an existing project → use `workflow-build-feature.md`
- The project plan already exists and you're executing → use the relevant execution workflow
- Evaluating whether an idea is worth pursuing → use Research Mode + `skill-product-thinking`

---

## REQUIRED FILES

### Skills to Load

| Priority | Skill | Why |
| :--- | :--- | :--- |
| Primary | `skill-product-thinking` | Problem definition, scoping, prioritization |
| Primary | `skill-architecture` | Technical structure and system design |
| Conditional | `skill-ui-ux` | If the product has a user interface |
| Conditional | `skill-database` | If the product involves data storage |
| Conditional | `skill-api-design` | If the product involves APIs |

### Contexts to Load

- Start FRESH — this workflow CREATES the context files
- Load `business-priorities.md` if this is for an existing organization

### Templates to Load (during output)

| Template | When |
| :--- | :--- |
| `project-brief.md` | Phase 5 — compiling the project brief |

### Rubrics to Load (during evaluation)

| Rubric | When |
| :--- | :--- |
| `project-planning-rubric.md` | After Phase 5 — evaluating planning quality before starting to build |

---

## EXECUTION SEQUENCE

### PHASE 1: DISCOVER THE PROBLEM (10-15 minutes)

#### Mode: Research + Product Thinking (Discovery)

#### Step 1: Extract the idea

Ask the user to explain their idea in plain language. Listen for:

- What does it do?
- Who is it for?
- Why does it matter?
- What triggered this idea? (pain point, opportunity, competition requirement)

#### Step 2: Define the problem

Restate the idea as a PROBLEM STATEMENT:
[Target user] struggles with [specific problem] because [root cause].
Currently they [current workaround], which is [why it's inadequate].

#### Step 3: Define the user

Create a brief user profile:
PRIMARY USER: [Who]
CONTEXT: [When/where they encounter the problem]
CURRENT BEHAVIOR: [What they do today]
DESIRED OUTCOME: [What they wish they could do]
TECHNICAL COMFORT: [Low / Medium / High]

#### Step 4: Define the Job-to-be-Done

When [situation], [user] wants to [motivation] so that they can [outcome].

#### Step 5: Define success

This project succeeds when [measurable outcome].
MVP is "done" when [specific criteria].

#### Phase 1 Output

- Problem statement, user profile, JTBD, success definition.

**Gate:** Do NOT proceed until the problem is clearly stated and the user agrees: "Yes, that's exactly what I'm trying to solve."

---

### PHASE 2: DEFINE THE SOLUTION (15-20 minutes)

#### Mode: Architect + Product Thinking (Scoping)

#### Step 1: Brainstorm features

List EVERYTHING the product could do. Don't filter yet. Generate 10-20 capabilities:

- [Feature]
- [Feature]
- [Feature]

#### Step 2: Categorize and prioritize

Sort every feature into:

| Category | Rule | Features |
| :--- | :--- | :--- |
| **🔴 Core (Must Have)** | Without this, the product doesn't solve the problem | [list] |
| **🟡 Important (Should Have)** | Makes the product significantly better but not essential for v1 | [list] |
| **🟢 Nice-to-Have (Could Have)** | Would be great but can wait for v2 | [list] |
| **⚫ Out of Scope (Won't Have)** | Deliberately excluded | [list] |

#### Step 3: Define the MVP

The MVP is ONLY the 🔴 Core features. Nothing else.

MVP SCOPE:

- [Core feature 1]
- [Core feature 2]
- [Core feature 3]
- [Core feature 4]

EXPLICITLY NOT IN MVP:

- [Everything else — listed to prevent scope creep]

#### Step 4: Define what "shipped" looks like

VERSION 1 IS DONE WHEN:

- [ ] [Core feature 1] works end to end
- [ ] [Core feature 2] works end to end
- [ ] [Core feature 3] works end to end
- [ ] User can [complete the primary job] without assistance
- [ ] Deployed to [target environment]
- [ ] [Any competition-specific requirements met]

#### Phase 2 Output

- Feature list (prioritized), MVP scope, definition of done.

**Gate:** User confirms: "Yes, this MVP scope is what I want to build first."

---

### PHASE 3: DESIGN THE ARCHITECTURE (20-30 minutes)

#### Mode: Architect (Structural Design)

Load `skill-architecture`. Follow `workflow-plan-architecture.md` in abbreviated form.

#### Step 1: Choose the tech stack

Based on:

- User's existing skills and comfort
- Project requirements
- Timeline constraints
- Deploy target (Vercel, Netlify, VPS, etc.)
- Competition requirements (if applicable)

Output a stack decision:
TECH STACK:

- Frontend: [framework]
- Backend: [framework/approach]
- Database: [engine]
- Auth: [approach]
- Hosting: [provider]
- Deployment: [approach]

#### Step 2: Design the data model

- What entities exist?
- What are the relationships?
- Draw a simple ERD or table list

ENTITIES:

- [Entity 1]: [key fields]
- [Entity 2]: [key fields]
- [Entity 3]: [key fields]

RELATIONSHIPS:

- [Entity 1] has many [Entity 2]
- [Entity 2] belongs to [Entity 1]

#### Step 3: Define the API shape (if applicable)

- What endpoints are needed?
- What are the primary CRUD operations?

#### Step 4: Define the folder structure

Based on the stack and patterns:
project/
├── [folder structure]

#### Step 5: Identify the riskiest technical decision

- What is the one technical choice that, if wrong, would cost the most to fix?
- How can we validate it early?

#### Phase 3 Output

- Stack, data model, API shape, folder structure, key technical decisions.

**Write these into context files:**

- Create `contexts/stack-context.md`
- Create `contexts/architecture-context.md`
- Create `contexts/database-context.md`
- Create `contexts/project-context.md`

---

### PHASE 4: CREATE THE BUILD SEQUENCE (15-20 minutes)

#### Mode: Architect + Product Thinking (Sequencing)

This is the execution plan. It turns the MVP features into an ordered
sequence of buildable steps.

#### The Universal Build Order

For most web applications, the build order is:

STEP 1: PROJECT SETUP (Foundation)
├── Initialize project with chosen stack
├── Set up folder structure
├── Configure dev environment (database, env vars)
├── Set up linting, formatting, git
└── Verify: project runs locally with blank page

STEP 2: DATABASE + DATA MODEL (Skeleton)
├── Define schema (Prisma, SQL, etc.)
├── Create migrations
├── Seed with test data
└── Verify: can read/write data from CLI/script

STEP 3: AUTHENTICATION (Security Foundation)
├── Implement auth (login, register, session)
├── Protect routes
├── Set up basic role model (if needed)
└── Verify: can log in, protected pages redirect

STEP 4: CORE FEATURE 1 — Backend (Most Important Feature)
├── API endpoints or Server Actions
├── Database queries
├── Input validation
├── Error handling
└── Verify: feature works via API/action (no UI yet)

STEP 5: CORE FEATURE 1 — Frontend
├── Pages and components
├── Data fetching (React Query / SWR / etc.)
├── All states: loading, empty, error, success
├── Forms and interactions
└── Verify: feature works end-to-end in browser

STEP 6: CORE FEATURE 2 — Full Stack
├── Backend (API + DB)
├── Frontend (pages + components)
├── All states
└── Verify: works end-to-end

STEP 7: CORE FEATURE 3 — Full Stack
├── [Same pattern]
└── Verify: works end-to-end

STEP 8: INTEGRATION + POLISH
├── Connect features together
├── Navigation and routing
├── Error handling across all flows
├── Responsive design check
├── Basic accessibility check
└── Verify: user can complete the full primary job

STEP 9: TESTING + HARDENING
├── Test critical paths
├── Fix edge cases discovered during testing
├── Security review (auth, input validation)
├── Performance check (any obvious bottlenecks?)
└── Verify: no broken flows, no obvious security holes

STEP 10: DEPLOY
├── Set up hosting
├── Configure environment variables
├── Deploy
├── Smoke test on production
├── Submit (if competition)
└── Verify: live and working

#### For Time-Constrained Projects (Hackathon)

Map the steps to available time:
DAY-BY-DAY PLAN (4-day competition example):

DAY 1 (June 28):
Morning: Steps 1-2 (Setup + Database)
Afternoon: Step 3 (Auth)
Evening: Step 4 (Core Feature 1 — Backend)

DAY 2 (June 29):
Morning: Step 5 (Core Feature 1 — Frontend)
Afternoon: Step 6 (Core Feature 2)
Evening: Step 7 (Core Feature 3)

DAY 3 (June 30):
Morning: Step 8 (Integration + Polish)
Afternoon: Step 9 (Testing + Hardening)
Evening: Bug fixes and final polish

DAY 4 (July 1):
Morning: Step 10 (Deploy)
Afternoon: Final testing on production
Evening: Submit + Documentation

#### Risk Mitigation for Time-Constrained Projects

- **Deploy early (Day 2).** Don't wait until Day 4. Deploy a skeleton on Day 1-2 so deployment issues are discovered early.
- **Commit to GitHub frequently.** Every completed step = a commit.
- **Cut scope, not quality.** If behind schedule, move features to "Nice-to-Have" — don't ship broken features.
- **One feature at a time.** Complete Feature 1 fully before starting Feature 2. Half-built features are worthless.

#### Phase 4 Output

- Numbered build sequence with verification points. Time-mapped if deadline exists.

---

### PHASE 5: CREATE THE PROJECT BRIEF (Summary Document)

#### Mode: Communicate (Consolidation)

Compile everything from Phases 1-4 into a single reference document:
PROJECT BRIEF: [Project Name]

**Problem**
[Problem statement from Phase 1]

**User**
[User profile from Phase 1]

**Solution**
[What we're building — one paragraph]

**MVP Scope**
[Core features only — from Phase 2]

**Out of Scope**
[Explicitly excluded — from Phase 2]

**Definition of Done**
[What "shipped" looks like — from Phase 2]

**Tech Stack**
[From Phase 3]

**Data Model**
[From Phase 3]

**Build Sequence**
[Numbered steps from Phase 4]

**Timeline**
[Day-by-day plan if time-constrained — from Phase 4]

**Key Risks**
[Riskiest technical decisions and assumptions]

Save this as a reference document in the project.

**Quality Check:** Load `rubrics/project-planning-rubric.md` and evaluate
the brief against all 8 dimensions. If any dimension is Failing,
address it before proceeding to Phase 6 (Execution).

**This document becomes the project's north star.** When scope creep threatens, refer back to it. When the build stalls, check which step you're on. When motivation dips, look at the Definition of Done and see how close you are.

---

### PHASE 6: BEGIN EXECUTION

#### Mode: Switch to Builder (Execution)

Hand off to the engineering workflows:

1. Start Step 1 from the build sequence
2. Use `workflow-build-feature.md` for each feature
3. Use the relevant skill files for each step
4. Commit after each completed step
5. Check off items in the Definition of Done as they're completed
6. When 80% done: Anti-Gravity shifts to finishing mode — resist scope creep, push to ship

**Memory Integration:**

- Save key technical decisions to `memory/decisions-log.md`
- If this is a new project type: note the inception approach in `memory/common-patterns.md`
- After project ships: record lessons in `memory/mistakes-to-avoid.md`

---

## QUALITY GATE CHECKLIST

Before leaving this workflow and starting execution:

- [ ] Problem clearly defined (user confirmed)
- [ ] Target user identified
- [ ] Features brainstormed and prioritized (Core / Important / Nice-to-Have / Out of Scope)
- [ ] MVP scope is ONLY Core features
- [ ] Definition of done is specific and checkable
- [ ] Tech stack chosen
- [ ] Data model designed
- [ ] Build sequence numbered and ordered
- [ ] Time mapped (if deadline exists)
- [ ] Risk identified
- [ ] Context files created or updated
- [ ] Project brief document compiled

---

## ANTI-PATTERNS THIS WORKFLOW PREVENTS

| Anti-Pattern | How This Workflow Prevents It |
| :--- | :--- |
| "Let me just start coding" | Phase 1 forces problem definition first |
| Endless feature creep | Phase 2 separates Core from Nice-to-Have |
| No definition of done | Phase 2 defines explicit shipping criteria |
| Architecture by accident | Phase 3 designs structure deliberately |
| Random build order | Phase 4 sequences steps logically |
| Building for 3 months, never shipping | Definition of Done + push-to-finish behavior |
| Hackathon panic on Day 3 | Phase 4 time-maps everything, deploy early |

---

## FOR HACKATHONS AND COMPETITIONS

Additional rules when time is constrained:

1. **Phase 1-4 of this workflow should take 2-3 hours MAX.** Don't over-plan. Plan enough to start.
2. **Deploy a skeleton on Day 1.** Not Day 4. Day 1.
3. **Commit every 30-60 minutes.** Frequent commits to GitHub.
4. **If behind schedule by >4 hours:** immediately cut one Core feature to Important. Ship fewer features that WORK.
5. **No premature optimization.** It works > it's fast > it's pretty. In that order.
6. **Last 20% of time = polish + deploy + test.** Not new features.
7. **README matters.** Judges read the README. Write it well.
