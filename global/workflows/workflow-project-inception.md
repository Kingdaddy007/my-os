# WORKFLOW: PROJECT INCEPTION

**Version:** Gold v1.1
**Layer:** Execution workflow
**Tier:** 2 - loaded by task
**Purpose:** Turn a raw idea into a buildable plan, initialize runtime context, and set up local project memory before implementation begins.

---

## WHAT THIS WORKFLOW DOES

This workflow is the bridge between:

- "I have an idea"
- and
- "We have a scoped project, runtime context files, local memory, and a build sequence"

Its outputs are:

1. a clear problem definition
2. a target user and job-to-be-done
3. a scoped MVP with explicit non-goals
4. a technical direction
5. a sequenced build plan
6. runtime-ready context files in `contexts/`
7. initialized workspace memory files in `.agents/memory/`

---

## WHEN TO USE IT

Use this workflow when:

- starting a new product, tool, side project, or hackathon build
- turning a rough idea into a plan
- creating the first project context for a workspace

Do not use it when:

- adding a feature to an existing project
- debugging an existing system
- reviewing an already-planned build

---

## REQUIRED FILES

### Primary skills

- `skill-product-thinking`
- `skill-architecture`

### Conditional skills

- `skill-ui-ux` if the project has a real user interface
- `skill-database` if the project has persistence or a meaningful data model
- `skill-api-design` if the project exposes or consumes APIs

### Templates this workflow should use

- `global_templates/project-context-template.md`
- `global_templates/stack-context-template.md`
- `global_templates/coding-standards-template.md` when conventions are already clear
- `project-brief.md` when producing a formal project brief

### Runtime context files this workflow creates or initializes

- `contexts/project-context.md`
- `contexts/stack-context.md`
- `contexts/architecture-context.md`
- `contexts/database-context.md` if relevant
- `contexts/app-flow.md` if the product has real user journeys
- `contexts/visual-identity.md` if the product has a meaningful UI direction
- `contexts/coding-standards.md` if project-specific conventions are known

### Workspace memory files this workflow initializes

- `.agents/memory/decisions-log.md`
- `.agents/memory/common-patterns.md`
- `.agents/memory/mistakes-to-avoid.md`
- `.agents/memory/postmortems.md`

> [!IMPORTANT]
> The files in `contexts/` are **runtime truth**, not authoring templates.
> Use templates to scaffold them, then save concise project truth into the runtime files.

---

## EXECUTION SEQUENCE

### PHASE 1: DISCOVER THE PROBLEM

Goal:

- understand the real problem
- identify the user
- define the job-to-be-done
- agree on what success means

Output:

- problem statement
- user profile
- JTBD
- success definition

Gate:

- do not continue until the problem statement feels accurate and the user agrees it captures the real problem

---

### PHASE 2: DEFINE THE MVP

Goal:

- list candidate features
- separate must-have from nice-to-have
- define the smallest version that delivers the core value
- define what "done" means for version 1

Output:

- prioritized feature list
- MVP scope
- explicit non-goals
- definition of done

Gate:

- do not proceed with an unbounded feature list

---

### PHASE 2A: MAP THE APP FLOW

Use when:

- the product has users, screens, states, routes, or task flows

Goal:

- map the main user journeys
- define key transitions and failure paths
- establish navigation logic before architecture or UI polish

Output:

- `contexts/app-flow.md` as the live runtime truth for user flows

Authoring rule:

- use scaffolding if needed, but save `app-flow.md` as a live context file, not as a template exercise

---

### PHASE 3: DEFINE THE TECHNICAL DIRECTION

Goal:

- choose the practical stack
- define the main architecture shape
- identify the riskiest technical decision
- determine what should be validated early

Output:

- stack decision
- architecture direction
- initial data model
- integration and deployment assumptions

Gate:

- if the stack or architecture choice is still highly unstable, name the uncertainty explicitly before moving on

---

### PHASE 3A: DEFINE THE VISUAL IDENTITY

Use when:

- the product has a meaningful user interface

Goal:

- define the intended look and feel
- choose a visual direction that fits the users and product type
- avoid generic UI drift

Output:

- `contexts/visual-identity.md` as the live runtime truth for the product's visual identity

Authoring rule:

- use brainstorming or reference material if needed, but save the final file as current truth

---

### PHASE 4: CREATE RUNTIME CONTEXTS

Goal:

- turn the planning work into runtime-ready context files
- make sure the next workflow has real project truth to work from

Required writes:

- create `contexts/project-context.md` using `global_templates/project-context-template.md` as scaffolding
- create `contexts/stack-context.md` using `global_templates/stack-context-template.md` as scaffolding
- create `contexts/architecture-context.md`
- create `contexts/database-context.md` if relevant
- initialize `contexts/coding-standards.md` if concrete conventions are already known, using `global_templates/coding-standards-template.md`
- verify that `contexts/app-flow.md` exists if Phase 2A applied
- verify that `contexts/visual-identity.md` exists if Phase 3A applied

Context-writing rule:

- runtime contexts should be concise, factual, and updateable
- longer fill guidance belongs in `global_templates/`

---

### PHASE 5: INITIALIZE WORKSPACE MEMORY

Goal:

- prevent project knowledge from leaking into global memory
- create a local continuity layer before implementation begins

Required writes:

- create `.agents/memory/decisions-log.md`
- create `.agents/memory/common-patterns.md`
- create `.agents/memory/mistakes-to-avoid.md`
- create `.agents/memory/postmortems.md`

First entry:

- log the initial stack and architecture choice in local `decisions-log.md`

Memory rule:

- project-specific lessons go local first
- global memory is reserved for cross-project or Anti-Gravity-level lessons

---

### PHASE 6: CREATE THE BUILD SEQUENCE

Goal:

- turn the MVP into a practical implementation order
- expose dependencies and critical path
- make the first execution workflow obvious

Typical build sequence:

1. project setup
2. data model and persistence
3. authentication or trust boundary
4. core feature 1 backend
5. core feature 1 frontend
6. additional core features
7. integration and polish
8. testing and hardening
9. deployment

Output:

- sequenced implementation plan
- optional day-by-day version for hackathons or time-boxed builds

---

### PHASE 7: PACKAGE THE NORTH STAR

Goal:

- capture the result in a form that is reusable by later workflows

Outputs:

- concise project brief
- MVP scope
- build sequence
- initialized runtime contexts
- initialized local memory

Optional:

- load `project-brief.md` if a formal brief is useful
- apply the project planning rubric during critique if the project is high-stakes or especially fuzzy

---

## QUALITY GATES

Before calling project inception complete, verify:

- the problem is clearly defined
- the MVP is smaller than the full idea
- runtime context files exist for the core project truth
- workspace memory is initialized
- the first build steps are explicit
- the next execution workflow is obvious

---

## RECOVERY RULES

- If the idea keeps growing, return to MVP scope and re-lock the non-goals.
- If the stack is too uncertain, document assumptions and the validation plan instead of pretending certainty.
- If context files become essays, move the scaffolding back into `global_templates/` and keep the runtime files factual.
- If project-specific knowledge starts heading toward global memory, stop and reroute it to workspace memory.

---

## FINAL RULE

This workflow does not just plan the project. It creates the runtime truth and local memory the rest of Anti-Gravity depends on.
