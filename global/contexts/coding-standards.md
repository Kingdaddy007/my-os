# CODING STANDARDS

**Version:** Gold v2.0
**Type:** Context File
**Layer:** 6 — Context (Ground Truth)
**Tier:** 2 — Loaded by task
**File:** contexts/coding-standards.md

**Purpose:** Defines the project-specific coding conventions Anti-Gravity must follow when generating, modifying, or reviewing code.

**Two layers:** project-level philosophy (applies regardless of stack) and concrete conventions (filled in per stack).

**Loaded When:** Any code generation, code modification, code review or refactoring task.

**Maintenance:** Update when the team agrees on new conventions, adopts new patterns, or deprecates old ones. Review quarterly. Convention changes must be agreed upon before updating this file — not made unilaterally.

---

## HOW ANTI-GRAVITY USES THIS FILE

This file is the style guide that governs every line of code Anti-Gravity
produces. It ensures generated code looks like **your team** wrote it —
not like a generic AI output.

**When loaded**, Anti-Gravity will:

- Name files, variables, functions, and types using your conventions exactly
- Organize imports, exports, and file structure to match your patterns
- Handle errors using your established patterns
- Follow your language's strictness level and type conventions
- Write git commit messages in your format
- Place new code in the correct location per your organizational rules
- Match the surrounding local style unless there is a strong reason not to

**When missing or incomplete**, Anti-Gravity will:

- Use its own naming conventions, which may conflict with your codebase
- Organize code in ways that look foreign to your team
- Use error handling patterns inconsistent with your existing code
- Generate code that passes functionally but fails code review for style

**When stale**, Anti-Gravity will:

- Follow deprecated conventions the team has moved away from
- Miss new patterns the team has adopted
- Generate code that looks outdated compared to recent team output

**Conflict rule:** If this file conflicts with a stack-specific context
file (`stack-context.md`, `typescript-standards.md`, etc.), the more
specific file takes precedence for that area. Flag the conflict rather
than silently choosing.

**Authoritativeness rule:** This file is the declared winner for
project-level coding conventions. When Anti-Gravity's general training
conflicts with a convention in this file, this file wins. Do not override
it silently with general AI judgment. If a convention seems wrong,
surface the concern — do not quietly substitute a different pattern.

---

## CURRENT PROJECT POSITION

<!-- WHY THIS MATTERS: Naming what this file covers and what it defers
     prevents Anti-Gravity from applying wrong-stack rules before the
     stack is chosen, or over-applying philosophy as concrete convention.
     The two-layer boundary also controls maintenance scope — editors
     should know exactly what to touch and what to leave alone. -->

This file has two layers:

| Layer | Name | Contents | When Active |
| :--- | :--- | :--- | :--- |
| **Layer 1** | Philosophy | Core standards, coding values, anti-patterns, security and performance floors, review expectations | Active now — applies regardless of stack |
| **Layer 2** | Conventions | Naming tables, TypeScript conventions, component structure, error handling, code organization, git conventions | Filled in when the concrete stack is confirmed |

> **Maintenance rule:** When the stack changes, only Layer 2 needs
> updating. Layer 1 stays. Never modify Layer 1 during a stack migration
> unless the team has explicitly agreed to change the project-level
> philosophy.

### What This File Does NOT Decide Yet

Until a stack-specific file says otherwise, this file does not prescribe:

- Exact language syntax conventions (JavaScript vs Python vs Go)
- Framework-specific directory trees
- Import ordering by language
- Linter and formatter tool choices and exact configuration
- Exact commenting style by language
- Exact typing conventions by language beyond the philosophy layer

These will be added when a concrete runtime stack is confirmed and
needs stack-specific standards.

### What Future Files Should Assume

- Clarity is the default implementation standard
- Coding style should remain behavior- and responsibility-oriented
- Stack-specific lint rules do not override these project-level
  standards unless a later, more specific file explicitly says so
- Reviewers and builders use this file as the shared coding baseline
  unless a later, more specific standard replaces part of it

---

## CODING PHILOSOPHY

<!-- WHY THIS MATTERS: These are the values behind every concrete
     convention. Without the philosophy layer, conventions feel arbitrary.
     With it, Anti-Gravity understands not just what the rules are but
     why they exist — and can apply them correctly in edge cases the
     rules do not explicitly cover. -->

Code in this project should optimize for:

1. **Clarity over cleverness**
   A competent engineer should be able to understand the code quickly.
   If a future engineer must mentally decode the code before understanding
   it, the standard is too low.

2. **Change safety over short-term speed**
   Future edits should be easier, not harder, because of the current
   implementation.

3. **Stable responsibility boundaries**
   Code units should have understandable jobs. A reader should be able
   to say what a code unit does in one or two sentences.

4. **Explicitness over hidden behavior**
   Important assumptions, side effects, and state transitions should
   not be obscured.

5. **Behavior-first structure**
   Code should reflect real domain behavior, not just transient
   implementation convenience.

6. **Local simplicity before abstraction**
   Abstraction is a tool, not a virtue signal.

### Code Should Avoid

- Clever one-liners that obscure meaning
- Unnecessary abstraction
- Dense nested logic
- Vague naming
- Mixed responsibilities in one unit
- Hidden side effects
- Silent failure handling
- Comment-heavy code that compensates for poor naming or structure

---

## SECURITY FLOOR

<!-- WHY THIS MATTERS: This file does not replace `security-baselines.md`.
     But coding conventions and security are not separate concerns — the
     way code is written is the first line of defense. These are the
     minimum security behaviors expected at the code level. Any code that
     violates these floors fails review regardless of other quality. -->

This file does not replace `security-baselines.md`. It sets the minimum
security standard at the code level:

- **Never** concatenate user input into queries, shell commands, or
  HTML — use parameterized queries, ORM methods, or safe templating
- **Never** log passwords, tokens, API keys, session identifiers, or
  full request bodies containing PII
- **Always** validate user-controlled input at the boundary where it
  enters the system — before it reaches business logic or persistence
- **Always** enforce authentication and authorization checks before
  executing mutations — do not assume the caller has already checked
- Treat secrets as configuration — never hardcode them in source files

If a convention in this file conflicts with a security requirement,
the security requirement wins. Raise the conflict — do not suppress it.

---

## PERFORMANCE FLOOR

<!-- WHY THIS MATTERS: This file does not replace performance profiling
     or optimization work. It sets the minimum performance awareness
     expected at the code level — the habits that prevent obvious,
     avoidable problems from being written in the first place. -->

This file does not replace `performance-baselines.md`. It sets the
minimum performance awareness standard at the code level:

- **Avoid** fetching data inside loops — batch where possible
- **Avoid** loading large dependencies in hot paths — import only
  what is needed
- **Avoid** triggering expensive re-renders through unstable object
  references or unnecessary state updates
- **Prefer** server-side data fetching over client-side fetching where
  the framework supports it and the data is not user-interaction-driven
- **Do not** optimize prematurely — profile first; a comment explaining
  a non-obvious optimization is required when it exists

If a performance-critical hot path genuinely requires deviation from
a coding convention, the deviation is acceptable — with a comment that
names the bottleneck and references a profile or measurement.

---

## WHAT GOOD CODE LOOKS LIKE

<!-- WHY THIS MATTERS: Rules and tables describe what to do and what
     to avoid. This section describes the feeling of code that meets
     the standard — so that reviewers, builders, and Anti-Gravity have
     a shared picture of the target, not just a checklist. -->

Code that meets this project's standard has the following qualities:

- **A new team member can orient quickly.** File names, function names,
  and directory structure give enough signal to navigate without a guide.
- **Behavior is predictable from names alone.** Reading a function name
  and its parameters gives a reliable first guess about what it does.
- **The hard parts are visible.** Complex logic, non-obvious assumptions,
  and important side effects are in plain sight — not buried in helpers
  or hidden by abstraction.
- **Tests protect the important things.** Critical paths have coverage.
  Edge cases the team discussed are represented. The test suite can be
  trusted as a regression net.
- **It feels like one codebase.** Style, structure, and naming are
  consistent enough that new files do not look out of place next to
  old ones.
- **It does not fight its readers.** A reviewer should be able to follow
  the logic of a change without re-deriving the entire mental model from
  scratch.

This is the bar. Not perfection — orientation, predictability, and
honesty. Code that meets these qualities is code the team can maintain,
extend, and trust.

---

## CORE CODING STANDARDS

<!-- WHY THIS MATTERS: These eight standards are the practical expression
     of the coding philosophy. Each follows the same structure:
     Rule (the principle), Prefer (positive behaviors), Avoid (negative
     behaviors), Meaning (one-sentence test for whether the standard is
     being met). Anti-Gravity uses the Meaning field to self-check
     generated code before producing it. -->

### 1. Naming Standards

**Rule:** Names should reflect intent and domain meaning — not temporary
implementation detail.

**Prefer:**

- Names that describe what a thing is *for*
- Names that reveal business meaning where relevant
- Names that make behavior predictable

**Avoid:**

- Vague names: `data`, `temp`, `helper`, `stuff`, `manager`, `util`
- Misleading names that describe a past implementation instead of the
  current role
- Over-compressed names that save characters but lose meaning

**Meaning:** If someone reads the name in isolation, they should gain a
reasonable first guess about the purpose of the unit.

---

### 2. Responsibility Standards

**Rule:** Functions, modules, classes, handlers, and services should have
clear, bounded responsibilities.

**Prefer:**

- One clear reason for a unit to change
- Narrow units with understandable jobs
- Separation of transport, domain logic, persistence, and presentation

**Avoid:**

- Giant mixed-responsibility functions
- Handlers that validate input, execute business logic, manage
  persistence, and shape side effects all in one place
- Utility dumping grounds that become dependency magnets

**Meaning:** A reader should be able to say what a code unit is
responsible for in one or two sentences.

---

### 3. Abstraction Standards

**Rule:** Abstract only when the abstraction reduces cognitive load or
removes proven repeated structure.

**Prefer:**

- Small, justified abstractions
- Extraction after repeated concrete patterns emerge
- Abstractions that make usage clearer than the inline alternative

**Avoid:**

- Speculative abstractions for imagined future cases
- "Universal" wrappers that hide domain behavior
- Generic managers, processors, or engines with unclear ownership
- Abstracting for hypothetical future use

**Meaning:** The project standard is clarity first, abstraction second.
Prefer duplication over the wrong abstraction. Wait for stable repetition
before generalizing.

---

### 4. State and Side-Effect Standards

**Rule:** State changes and side effects should be easy to locate and
reason about.

**Prefer:**

- Explicit mutation points
- Clearly bounded side effects
- Visible ordering of important actions
- Separation between pure logic and side-effect execution where it
  meaningfully improves clarity

**Avoid:**

- Hidden writes
- Implicit global state dependencies
- Surprising side effects buried in helpers
- Difficult-to-follow control flow that changes state in many places

**Meaning:** If behavior changes system state, that fact should be
discoverable without detective work.

---

### 5. Error Handling Standards

**Rule:** Errors should be handled deliberately, not cosmetically.

**Prefer:**

- Failing clearly when continuing would create misleading or corrupt
  behavior
- Propagating errors when callers need to decide recovery
- Logging where it materially improves diagnosis
- Explicit handling of important edge and failure paths

**Avoid:**

- Swallowed exceptions
- Fake success states
- Catch blocks that hide useful information
- Empty catches without documented justification
- Sprinkling logs everywhere without diagnostic purpose

**Meaning:** The project standard is not "never fail." The standard is
fail honestly and observably.

---

### 6. Structural Consistency Standards

**Rule:** Code should fit the surrounding local structure unless there is
a strong reason to introduce a better pattern.

**Prefer:**

- Following established repository organization
- Consistent layering
- Similar problems solved in similar ways
- Deliberate evolution rather than random style drift

**Avoid:**

- Inventing a new local pattern without need
- Style inconsistency across neighboring code for no gain
- Changing structure casually because of personal taste alone

**Meaning:** Consistency reduces friction for future readers and
maintainers. Code should feel like it belongs in this codebase — not
just like it works in isolation.

---

### 7. Testability Standards

**Rule:** Code should be shaped so important behavior can be verified
without extreme setup or fragile hacks.

**Prefer:**

- Clear boundaries
- Dependency structures that make verification practical
- Logic isolated enough that it can be tested at the right level
- Explicit inputs and outputs

**Avoid:**

- Designs that require heroic mocking to verify basic behavior
- Tightly coupled code that makes regression protection expensive
- Shared mutable state that makes tests order-dependent

**Meaning:** Testability is not a separate concern from design quality.
It is part of design quality.

---

### 8. Refactoring Standards

**Rule:** Refactoring should improve structure without casually changing
behavior.

**Prefer:**

- Small incremental structural improvements
- Behavior protection before major shape changes
- Changes that reduce future friction clearly

**Avoid:**

- Rewrites disguised as cleanup
- Cosmetic churn with no structural gain
- "While we're here" scope expansion without justification

**Meaning:** Cleanup should leave the system easier to change, not
merely different. Refactor for leverage, not vanity.

---

## NAMING CONVENTIONS

<!-- WHY THIS MATTERS: Consistent naming is the first thing a developer
     notices when navigating a codebase. Inconsistent naming forces
     mental translation on every file open, every variable read, every
     function call. Anti-Gravity uses these tables to name every file,
     variable, type, and database entity it creates or suggests —
     making generated code immediately recognizable as belonging to
     this project. -->

### Files and Directories

<!-- Fill in your project's file naming conventions.
     The counter-example column is critical — it prevents the most
     common wrong choice for each file type. -->

| File Type | Convention | Example | Counter-Example (DON'T) |
| :--- | :--- | :--- | :--- |
| React Components | PascalCase.tsx | `TaskCard.tsx`, `SprintBoard.tsx` | `task-card.tsx`, `taskCard.tsx` |
| React Hooks | camelCase with `use` prefix | `useTaskList.ts`, `useDebounce.ts` | `TaskListHook.ts`, `task-list.ts` |
| Server Actions | camelCase verb-first | `createTask.ts`, `updateProject.ts` | `TaskCreator.ts`, `task-create.ts` |
| Query Functions | camelCase verb-first | `getTaskById.ts`, `listProjects.ts` | `TaskQuery.ts`, `tasks.ts` |
| Utility Functions | camelCase | `formatDate.ts`, `validateInput.ts` | `DateFormatter.ts`, `utils.ts` (too vague) |
| Schema / validation | camelCase + `Schema` suffix | `taskSchema.ts`, `projectSchema.ts` | `TaskValidation.ts`, `schemas.ts` |
| Type files | camelCase | `types.ts` (per feature) | `Types.ts`, `interfaces.ts` |
| Test files | Same name + `.test` suffix | `TaskCard.test.tsx` | `TaskCard.spec.tsx`, `__tests__/TaskCard.tsx` |
| Constants | camelCase filename | `limits.ts`, `routes.ts` | `LIMITS.ts`, `Constants.ts` |
| Directories | kebab-case | `sprint-board/`, `user-settings/` | `SprintBoard/`, `sprint_board/` |

---

### Variables and Functions

<!-- WHY THIS MATTERS: Variable and function naming is the primary
     mechanism for code readability. The handle vs on distinction is
     the most commonly violated naming rule in component-heavy
     codebases — it is enforced here, not optional. -->

| Category | Convention | Good Examples | Bad Examples |
| :--- | :--- | :--- | :--- |
| Booleans | `is`, `has`, `should`, `can` prefix | `isActive`, `hasPermission`, `shouldRefresh`, `canEdit` | `active`, `permission`, `flag`, `check` |
| Event handlers (implementation) | `handle` prefix | `handleSubmit`, `handleTaskClick`, `handleFilterChange` | `onSubmit` (reserved for props), `submitForm` |
| Event handler props | `on` prefix | `onClick`, `onSubmit`, `onTaskSelect` | `handleClick` (that is the implementation, not the prop) |
| Callbacks | `on` prefix for props | `onSuccess`, `onError`, `onTaskCreated` | `callback`, `cb`, `fn` |
| Constants | `SCREAMING_SNAKE_CASE` | `MAX_RETRY_COUNT`, `DEFAULT_PAGE_SIZE`, `API_BASE_URL` | `maxRetryCount`, `defaultPageSize` |

---

### Types and Interfaces

<!-- WHY THIS MATTERS: The No-I-prefix rule and the Props-suffix rule
     are the two most commonly violated naming rules in typed codebases.
     Zod-inferred types prevent the silent drift that happens when
     schemas and type definitions are maintained separately.
     Anti-Gravity uses these to generate types that integrate
     seamlessly with the existing type system. -->

| Category | Convention | Good Examples | Bad Examples |
| :--- | :--- | :--- | :--- |
| Domain types | PascalCase, noun-based | `Task`, `Sprint`, `UserProfile` | `TaskType`, `ITask`, `TaskInterface` |
| Interfaces | No `I` prefix | `UserProfile`, `ProjectSettings` | `IUserProfile`, `IProjectSettings` |
| Props types | ComponentName + `Props` | `TaskCardProps`, `SprintBoardProps` | `Props`, `TaskCardP`, `ITaskCardProps` |
| Enum types | PascalCase | `TaskStatus`, `UserRole` | `TASK_STATUS`, `taskStatus` |
| Enum values | PascalCase | `TaskStatus.InProgress`, `UserRole.Admin` | `TaskStatus.IN_PROGRESS`, `TaskStatus.inProgress` |
| Generic params | Single uppercase or descriptive | `T`, `TData`, `TError` | `type`, `data`, `a` |
| Utility types | PascalCase, descriptive | `WithId<T>`, `Nullable<T>` | `AddId`, `MaybeNull` |
| API response types | Suffix with `Response` | `TaskListResponse`, `CreateProjectResponse` | `TaskListResult`, `TaskListData` |
| Schema-inferred types | Derive from schema | `type Task = z.infer<typeof taskSchema>` | Manually duplicating the schema as a separate type |

---

### Database

<!-- WHY THIS MATTERS: Database naming directly affects ORM model names,
     migration files, and query code. Inconsistent casing between the
     database layer and the application layer forces constant mental
     translation. Anti-Gravity uses these to generate correct schema
     changes, migrations, and queries. -->

| Category | Convention | Good Examples | Bad Examples |
| :--- | :--- | :--- | :--- |
| Table names | `snake_case` plural | `tasks`, `sprint_items`, `user_roles` | `Task`, `SprintItem`, `UserRole` |
| Column names | `snake_case` | `created_at`, `is_active`, `project_id` | `createdAt`, `IsActive`, `ProjectID` |
| Foreign keys | `[entity]_id` | `project_id`, `assigned_to_id` | `projectId`, `project`, `fk_project` |
| Junction tables | Alphabetical order | `project_users`, `sprint_tasks` | `user_projects`, `task_sprints` |
| ORM models | PascalCase singular | `Task`, `SprintItem`, `UserRole` | `Tasks`, `sprint_item` |
| Index names | `idx_[table]_[columns]` | `idx_tasks_sprint_status` | `index1`, `task_index` |

---

### Guidance for Anti-Gravity — Naming

- Match local naming conventions in the surrounding code when visible
- Prefer domain language over generic technical wording
- Rename only when clarity meaningfully improves
- Never introduce `I`-prefixed interfaces
- Never use `handle` for prop names or `on` for implementation handlers —
  the distinction is enforced, not optional
- Never use bare `data`, `temp`, `result`, `obj`, `item` unless scope is
  tiny and meaning is obvious from immediate context

---

## CODE ORGANIZATION RULES

<!-- WHY THIS MATTERS: These rules prevent organizational drift. Without
     them, different engineers — and Anti-Gravity — make different
     decisions about where code goes, creating an inconsistent,
     hard-to-navigate codebase. Export rules affect refactoring safety.
     Import order affects cognitive load. Co-location rules affect
     discoverability. Barrel file rules affect bundle size and dependency
     clarity. Anti-Gravity follows these for every file it creates or
     modifies. -->

### Export Rules

- **Named exports only** — no default exports except where the framework
  requires them
- **Why:** Named exports are refactor-safe (renaming is tracked across
  the codebase), prevent naming inconsistencies across imports, and work
  better with tree-shaking
- **Exception:** Framework-mandated files only — `page.tsx`, `layout.tsx`,
  `route.ts`, `middleware.ts` in Next.js, or the equivalent in your
  framework

### Import Order

Every file follows this import order, separated by blank lines:

```typescript
// 1. Framework / runtime core imports
import { useState, useCallback } from 'react';
import { useRouter } from 'next/navigation';

// 2. Third-party library imports
import { useQuery } from '@tanstack/react-query';
import { z } from 'zod';

// 3. Internal shared imports
import { Button } from '@/shared/components/ui/Button';
import { formatDate } from '@/shared/lib/formatDate';

// 4. Internal feature imports (cross-feature)
import type { Project } from '@/features/projects/types';

// 5. Relative imports (same feature / module)
import { TaskCard } from './components/TaskCard';
import { useTaskList } from './hooks/useTaskList';

// 6. Type-only imports (if not already covered above)
import type { TaskCardProps } from './components/TaskCard';
```

### Co-location Rules

- Components, hooks, actions, queries, schemas, and tests for a feature live together in `features/[feature-name]/`
- Tests are co-located with source files — not in a separate `__tests__/` directory
- Shared code moves to `shared/` only when used by 3 or more features
- Do not create `utils.ts` or `helpers.ts` catch-all files — name files by what they do (`formatDate.ts`, `validateInput.ts`)

### Barrel Files

- **Policy:** Do NOT use barrel files.
- **A barrel file is any index.ts that re-exports from subdirectories**
- **Why:** Barrel files break tree-shaking, create circular dependency risk, and make it harder to find the actual source of an import
- **Import directly from the source file:**
  - ✅ `from './components/TaskCard'`
  - ❌ `from './components'`

### Guidance for Anti-Gravity — Organization

- Never create a barrel file — even for convenience
- Named exports in every new file unless the framework requires a default export
- Follow the import order exactly — do not collapse groups or skip blank line separators
- Place new code where ownership is clearest — feature-local by default, shared only when earned by repetition across 3+ features

---

## ERROR HANDLING CONVENTIONS

<!-- WHY THIS MATTERS: Inconsistent error handling is one of the most common sources of bugs and poor user experience. Generic try/catch patterns hide failure type from callers. Anti-Gravity uses these conventions to generate error handling that matches the project's established patterns — not generic catch-everything blocks that leave the caller blind. -->

### Result Type Pattern — Mutations

Return a typed Result — never throw from mutations the UI calls directly:

```typescript
// The Result type (defined in shared/types/api.ts or equivalent)
type ActionResult<T> =
  | { success: true; data: T }
  | { success: false; error: string; code?: string };

// Usage in a mutation / server action
export async function createTask(
  input: unknown
): Promise<ActionResult<Task>> {
  const parsed = taskSchema.safeParse(input);
  if (!parsed.success) {
    return {
      success: false,
      error: 'Invalid task data',
      code: 'VALIDATION_ERROR',
    };
  }

  const session = await auth();
  if (!session) {
    return {
      success: false,
      error: 'Not authenticated',
      code: 'AUTH_ERROR',
    };
  }

  try {
    const task = await insertTask(parsed.data);
    return { success: true, data: task };
  } catch (error) {
    logger.error('Failed to create task', { error, input: parsed.data });
    return {
      success: false,
      error: 'Failed to create task',
      code: 'INTERNAL_ERROR',
    };
  }
}
```

### API Routes — External Consumers

Return structured error responses with HTTP status codes:

```typescript
// Standard error response shape
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable description",
    "details": [/* optional field-level errors */]
  }
}
```

### Client-Side Error Handling

| Failure Type | Handling Pattern |
| :--- | :--- |
| Component tree failure | React Error Boundary |
| Mutation failure | Toast notification |
| Form validation error | Inline message below the field |
| Route-level failure | Full-page error state |

### Logging Rules

- Log at meaningful boundaries and failure points — not every step
- Log format: `logger.error('What failed', { error, relevantContext })`
- **Never log:** passwords, tokens, API keys, full request bodies with PII, session identifiers
- **Always log:** error message, stack trace, user ID (not email), request ID where available
- Avoid vague messages like "something went wrong" — include enough context to diagnose the failure without re-running the scenario

### Empty Catch Block Policy

**Never use empty catch blocks.**
If an error is intentionally ignored, document why:

```typescript
try {
  await analytics.track(event);
} catch {
  // Analytics failures are non-critical — do not block user flow
}
```

An undocumented empty catch is always a bug waiting to surface.

### Guidance for Anti-Gravity — Error Handling

- Default to the Result type pattern for any mutation the UI calls
- Never throw from a mutation and expect the UI to catch it cleanly
- Distinguish expected domain failures from unexpected system failures
- Make failure behavior understandable and diagnosable — not hidden
- If a catch block is empty, add a comment or it will be flagged in review

---

## TYPESCRIPT CONVENTIONS

<!-- WHY THIS MATTERS: TypeScript is the primary defense against an entire category of bugs. These conventions ensure Anti-Gravity generates code that leverages the type system fully — not loosely typed code that defeats the purpose of using TypeScript at all. The forbidden patterns table exists because each of these patterns silently weakens the type system at the exact point where it should be strongest. -->

### Strictness

- `"strict": true` in tsconfig — all strict checks enabled
- `"noUncheckedIndexedAccess": true` — array/object access returns `T | undefined`, not `T`
- These settings are **NON-NEGOTIABLE** — do not weaken them for convenience

### Forbidden Patterns

| Pattern | Why Forbidden | Do This Instead |
| :--- | :--- | :--- |
| `any` type | Defeats TypeScript's purpose entirely | Use `unknown` and narrow with type guards |
| Type assertions (`as`) | Bypasses type checking, hides real type bugs | Use type guards, generics, or refactor the type |
| `// @ts-ignore` | Silences errors without fixing them | Fix the underlying type issue |
| `// @ts-expect-error` | Only acceptable in test files | In production code, fix the type |
| Non-null assertion (`!`) | Asserts not-null without checking | Use explicit null checks or optional chaining |

### Preferred Patterns

| Pattern | When to Use | Example |
| :--- | :--- | :--- |
| `interface` | Object shapes, extendable contracts | `interface TaskCardProps { task: Task; onSelect: (id: string) => void; }` |
| `type` | Unions, intersections, mapped types, utilities | `type TaskStatus = 'todo' &#124; 'in_progress' &#124; 'done';` |
| Schema-inferred types | Any type with a corresponding validation schema | `type Task = z.infer<typeof taskSchema>;` |
| Discriminated unions | When object shape depends on a field value | `type Result<T> = { success: true; data: T } &#124; { success: false; error: string }` |
| `satisfies` operator | Validate a value matches a type without widening | `const config = { ... } satisfies AppConfig;` |
| Explicit return types | Public functions, exported functions, mutations | `function getTask(id: string): Promise<Task &#124; null>` |
| Inferred return types | Internal helpers, simple utility functions | Let TypeScript infer when the return is obvious |

### Generic Conventions

- Use generics when they reduce duplication or increase type safety
- Prefer descriptive names for complex generics: `TData`, `TError`, `TResponse`
- Single-letter generics (`T`, `K`, `V`) are acceptable for simple utility types
- Do not over-genericize — if a function only ever handles one type, do not make it generic

### Type / Contract Standards

- If the project is strongly typed: prefer explicit, meaningful types — avoid unbounded escape hatches unless clearly justified.
- If the project is dynamically typed: compensate with validation, explicit contracts, clearer naming, stronger tests, and defensive boundary checks.
- Follow the project's actual type-safety discipline — do not weaken contracts for convenience.

### Guidance for Anti-Gravity — TypeScript

- Never generate `any` — use `unknown` with type narrowing
- Never generate type assertions (`as`) as a shortcut
- Never weaken the tsconfig strictness settings
- Use the `satisfies` operator for config objects and static structured data
- Derive types from schemas — never maintain parallel type definitions manually
- Explicit return types on all public and exported functions — infer only for internal helpers

---

## COMPONENT CONVENTIONS

<!-- WHY THIS MATTERS: Component structure affects readability,
     consistency, and maintainability. When every component follows
     the same internal order, developers — and Anti-Gravity — can
     navigate any component instantly without re-learning its layout.
     The Server vs Client decision table prevents the most common
     architecture mistake in component-heavy frameworks: defaulting
     to client components when server components would work. -->

### Component Rules

- Functional components only — no class components
- Server Components by default — add client directive only when the component genuinely needs hooks, event handlers, or browser APIs
- Props destructured in function signature — not `props.x`
- No inline styles — use the project's styling system exclusively
- One component per file (exception: tightly coupled internal sub-components that are never used independently)
- Named exports only — no default exports except framework-required page files (`page.tsx`, `layout.tsx`)

### Component Internal Structure Order

Every component follows this internal structure order. Do not rearrange sections for personal preference.

```typescript
'use client'; // Only if needed — see decision table below

// Imports (following import order rules above)
import { useState, useCallback, useEffect } from 'react';
import { isPast } from 'date-fns';
import type { Task } from '@/features/tasks/types';

// Types (local to this component only — shared types live in types.ts)
interface TaskCardProps {
  task: Task;
  onSelect: (id: string) => void;
}

// Component
export function TaskCard({ task, onSelect }: TaskCardProps) {
  // 1. Hooks — state, queries, router, context
  const [isExpanded, setIsExpanded] = useState(false);

  // 2. Derived state / computed values
  const isOverdue = task.dueDate != null && isPast(task.dueDate);

  // 3. Event handlers
  const handleClick = useCallback(() => {
    onSelect(task.id);
  }, [task.id, onSelect]);

  // 4. Effects — minimize; prefer derived state over useEffect
  useEffect(() => {
    // Only when truly necessary — document the reason
  }, [dependency]);

  // 5. Early returns — loading, error, empty states
  if (!task) return null;

  // 6. Render
  return (
    <div>...</div>
  );
}
```

### Server Component vs Client Component Decision

| Use Server Component When | Use Client Component When |
| :--- | :--- |
| Displaying data without interactivity | Component uses `useState`, `useEffect`, or other hooks |
| Fetching data on the server | Component has event handlers (`onClick`, `onChange`, etc.) |
| Accessing backend resources directly | Component uses browser APIs (`localStorage`, `window`, etc.) |
| Rendering static or semi-static content | Component needs client-side data management |
| No dependency on browser APIs or React state | Component uses context requiring client-side providers |

### Guidance for Anti-Gravity — Components

- Default to the least interactive component type that satisfies the requirement — escalate to client only when needed
- Never add hooks to a server component to avoid restructuring — extract a client child component instead
- Follow component internal structure order for every component generated without exception
- Do not add 'use client' speculatively — it widens the client bundle and defeats the purpose of server-first rendering
- Never use default exports in component files except framework-mandated files

---

## COMMENT CONVENTIONS

<!-- WHY THIS MATTERS: Comments should add value, not noise. Over-commented code usually signals that the code itself is unclear — the fix is better naming or structure, not more words explaining bad code. Anti-Gravity uses these rules to generate comments that explain WHY, not WHAT. The code explains WHAT. -->

| Rule | Good | Bad |
| :--- | :--- | :--- |
| Comment WHY, not WHAT | `// Retry 3× — provider occasionally delivers before our DB transaction commits` | `// Retry the operation 3 times` |
| No commented-out code | Delete it — version control has history | `// const oldImplementation = ...` |
| TODO format | `// TODO(name): Description — target date` | `// TODO: fix this` |
| JSDoc for public APIs | JSDoc on exported utilities and shared hooks | JSDoc on every function including internal helpers |
| Self-explanatory code needs no comment | `const isOverdue = task.dueDate != null && isPast(task.dueDate);` | `// Check if the task is overdue` followed by the same line |
| Complex business logic gets explanation | `// Velocity excludes current sprint — rolling 6-sprint average per product spec` | (no comment on a non-obvious business calculation) |

### Guidance for Anti-Gravity — Comments

- If generated code requires heavy commenting to be understandable, treat that as a signal to rename or restructure first
- Never generate commented-out code in new files under any circumstance
- Write TODO comments in the standard format — include owner and target date where known
- JSDoc only on exported, public-facing functions and hooks — not on every internal helper

---

## GIT CONVENTIONS

<!-- WHY THIS MATTERS: Anti-Gravity uses these conventions to suggest correct branch names, format commit messages, and understand change scope when recommending how to split work into PRs. Consistent git history is the project's long-term audit trail — a well-structured git history is a first-class project artifact. -->

### Branch Naming

Format: `[type]/[short-description]`

| Type | Usage | Example |
| :--- | :--- | :--- |
| feature/ | New feature work | `feature/sprint-velocity-chart` |
| fix/ | Bug fixes | `fix/task-status-transition-error` |
| chore/ | Maintenance, dependency updates | `chore/upgrade-prisma-5.10` |
| refactor/ | Code restructuring without behavior change | `refactor/extract-task-queries` |
| docs/ | Documentation changes | `docs/update-api-conventions` |
| test/ | Adding or improving tests | `test/task-status-integration` |

### Commit Messages

Conventional Commits format:

```text
feat: add sprint velocity chart to project dashboard
fix: prevent duplicate task creation on double-click
chore: upgrade Prisma from 5.8 to 5.10
refactor: extract task query functions from sprint module
docs: update API error response conventions
test: add integration tests for task status transitions
```

**Rules:**

- Lowercase, no period at end
- Imperative mood — "add" not "added" or "adds"
- Subject line: 72 characters maximum
- Body optional — use for non-obvious changes only, separated from subject by a blank line
- Breaking changes: `feat!: ...` or `BREAKING CHANGE:` in commit body

### Pull Request Standards

- **Target size:** < 400 lines of diff (excluding generated files and lock files)
- **If larger:** split into stacked PRs with a clear dependency chain and a shared tracking issue
- PR title follows commit message format exactly
- **PR description includes:**
  - What changed and why it changed
  - How to test locally
  - Screenshots for any UI changes
  - Migration steps if the change requires them
- Requires at least 1 approval before merge
- All CI checks must pass before merge (lint, type-check, tests, build)
- Squash merge to main — clean linear history
- Delete branch after merge

### Guidance for Anti-Gravity — Git

- Suggest branch names that follow the `type/short-description` pattern
- Format every commit suggestion in Conventional Commits format
- If a proposed change exceeds 400 lines, recommend how to split it into smaller PRs before generating the code
- Treat git history as a first-class artifact — commit messages should explain the why of a change, not just restate the diff

---

## IMPLEMENTATION DEFAULTS

<!-- WHY THIS MATTERS: These five defaults govern how Anti-Gravity approaches any implementation task where the standards do not give a specific answer. They are the operating posture — the default gear the engine runs in. Each one prevents a specific category of over-engineering or structural debt that accumulates quietly over time. -->

1. **Thin Outer Layers**
   Keep transport, framework glue, and infrastructure layers as thin as possible. Route handlers, server actions, and controllers should orchestrate — not compute. Push logic inward toward domain functions where it can be tested without framework setup.

2. **Domain Terms First**
   Use the language of the business domain before using technical implementation terms. A function that creates a sprint backlog item is `createBacklogItem` — not `insertRecord`, `persistItem`, or `handleCreate`. Domain naming is the first and clearest form of documentation.

3. **Small Safe Steps**
   Prefer a series of small, verifiable changes over a single large refactor. Each step should leave the system in a working state. This is especially important during refactoring — behavior changes and structural changes should be separate commits where possible.

4. **Explicit Assumptions**
   When code depends on an assumption that is not enforced by types — a precondition, a business rule, a data invariant — make it visible. A comment, an assertion, or an explicit guard is better than a silent assumption that becomes a mystery bug.

5. **Review-Friendly Structure**
   Structure code so it is easy to review: small units, clear boundaries, no side effects buried in the middle of unrelated logic. Code that is easy to review is code that is easy to verify, easy to maintain, and easy to trust.

---

## PATTERNS TO FOLLOW

<!-- WHY THIS MATTERS: These are the default approaches for common tasks. Anti-Gravity follows what the team has already established instead of inventing a new pattern on each task. This is the positive list — what to reach for first. When a new task maps to a pattern here, use it. Do not invent an alternative. -->

| Pattern | When to Use | Location | Key Rule |
| :--- | :--- | :--- | :--- |
| Server Actions | All data mutations from UI | `features/[feature]/actions/` | Always validate with Zod, always check auth, always return `ActionResult<T>` |
| Query hooks | All client-side data fetching | `features/[feature]/hooks/` | Cache keys: `[feature, action, ...params]`. Never fetch in `useEffect`. |
| Zod schemas | All user input + API input validation | `features/[feature]/schemas/` | Single source of truth — derive TS types from schemas, not alongside them |
| Feature directories | All new feature work | `features/[feature-name]/` | Standard subdirs: `components`, `hooks`, `actions`, `queries`, `schemas`, `types` |
| Shared components | Reusable UI used by 3+ features | `shared/components/ui/` | Must be generic — no feature-specific logic, no feature imports |

---

## PATTERNS TO AVOID

<!-- WHY THIS MATTERS: These patterns have been explicitly rejected. Anti-Gravity must never suggest or generate code using them. This is the negative list — what to refuse first before looking for an alternative. Each entry includes why it was rejected and exactly what to do instead. -->

| Anti-Pattern | Why Rejected | Do This Instead |
| :--- | :--- | :--- |
| Default exports (where avoidable) | Harder to refactor, inconsistent naming across imports | Named exports everywhere (except framework-required page files) |
| Barrel files (`index.ts` re-exports) | Breaks tree-shaking, creates circular dependency risk | Import directly from the source file |
| `any` type | Defeats TypeScript entirely | `unknown` + type narrowing |
| Type assertions (`as`) as a shortcut | Bypasses type checking, hides real type bugs | Fix the underlying type or use a type guard |
| Catch-all `utils.ts` / `helpers.ts` | Becomes a junk drawer of unrelated functions | Name files by what they do (`formatDate.ts`) |
| `useEffect` for data fetching | Race conditions, no caching, no loading states | Use dedicated data-fetching hooks |
| Global CSS classes | Naming conflicts, hard to maintain at scale | Project's utility styling system |
| Shared mutable state via module scope | Race conditions, order-dependent tests | Scoped stores for client state, query layer for server state |
| Throwing from mutations | Client cannot distinguish error types or recover | Return `ActionResult<T>` type |
| Empty catch blocks | Silently hides failures with no diagnostic trail | Document intent with a comment or propagate the error |
| Direct database calls in UI layers | Bypasses data access layer, scatters query logic | Use feature query functions |
| Inline SQL strings | SQL injection risk, no type safety | ORM queries or parameterized raw SQL |
| Speculative generalization | Adds complexity for requirements that do not exist | Write the concrete case first; generalize from proven repetition |
| `I`-prefixed interfaces | Violates project naming rules, adds noise | `UserProfile`, `ProjectSettings` — no prefix |

---

## WHEN TO DEVIATE FROM STANDARDS

<!-- WHY THIS MATTERS: Standards exist to serve the team, not create rigidity. Anti-Gravity should know when deviation is acceptable so it does not blindly enforce conventions in situations where they do not apply — and does not silently deviate in situations where they do. -->

### Acceptable Deviations

| Situation | Deviation Allowed | Condition |
| :--- | :--- | :--- |
| Third-party library requires specific patterns | Follow the library's conventions | Document why the deviation exists with a comment |
| Legacy code does not follow current standards | Match the surrounding legacy style | Only for small fixes — do not mix conventions within a file |
| Performance-critical hot path | Less readable but measurably faster code | Profile proves the bottleneck; comment explains the optimization |
| Framework requires default exports | Use default export for required files | Only for framework-mandated files (`page.tsx`, `layout.tsx`, etc.) |
| Prototype / spike work | Relaxed naming, temporary shortcuts | Must be cleaned up before merging to main — no tolerance survives a merge |

### How to Handle Legacy Code That Violates Standards

- **Small fix in legacy file?** Match the file's existing style. Do not mix conventions within a file.
- **Significant change in legacy file?** Refactor the touched section to current standards. Do not refactor untouched sections — that is scope creep.
- **New file in a legacy module?** Follow current standards. It is acceptable for the new file to be cleaner than its neighbors.
- **Full module rewrite?** Apply current standards throughout. This is the correct time to modernize.

### How to Propose New Conventions

1. Discuss with the team — conventions are team decisions, not individual preferences
2. Get consensus
3. Update this file
4. Apply to new code going forward — do not mass-refactor existing code unless explicitly planned
5. Log the change in Version History at the bottom of this file

### Guidance for Anti-Gravity — Deviations

- When a deviation is acceptable, apply it — but always add a comment
  at the deviation site explaining which standard is being set aside
  and why
- Never deviate silently — a quiet override is harder to find than a
  documented exception
- If legacy code violates a standard, match the local style for small
  fixes — do not mix two conventions in one file
- If a third-party library forces a pattern this file discourages,
  follow the library — document the reason inline
- If a proposed change exceeds the PR size limit, recommend splitting
  before generating the code — do not silently produce an oversized diff
- Prototype tolerances do not survive a merge to main — flag cleanup
  debt before suggesting a merge
- If unsure whether a deviation is acceptable, surface the question
  rather than choosing silently

---

## CODING ANTI-PATTERNS — WHAT, WHY, INSTEAD

<!-- WHY THIS MATTERS: Tables list the rules. Narratives explain the failure modes. These five anti-patterns are responsible for the majority of structural debt and bug-prone code. Anti-Gravity uses these narratives to recognize anti-pattern signals in context — not just match keywords. -->

1. **The God Function**
   - **What:** A single function or handler that validates input, executes business logic, manages persistence, shapes side effects, and handles error output all in one place.
   - **Why it fails:** Every new requirement touches the same function. Testing requires the entire context. A bug in any one layer is physically adjacent to correct code in every other layer. Reading it requires holding the entire problem in your head at once.
   - **Instead:** Decompose by responsibility. Validate at the boundary. Execute logic in a separate unit. Persist through dedicated data access. Surface errors at the appropriate layer.

2. **The Misleading Name**
   - **What:** A function or variable named for what it used to do, not what it does now. Or named for its implementation mechanism instead of its purpose.
   - **Why it fails:** Readers trust names. When a name no longer matches behavior, every reader must audit the implementation to verify what it actually does — defeating the purpose of naming.
   - **Instead:** Rename when behavior changes. Prefer purpose names over mechanism names. A function named `processItem` is harder to trust than one named `validateAndEnqueueTask`.

3. **The Speculative Abstraction**
   - **What:** Generalizing code prematurely — creating a "universal" manager, processor, or wrapper before the actual variation patterns are understood.
   - **Why it fails:** The abstraction almost never matches the real variation when it arrives. It adds complexity for cases that do not exist, and it locks in the wrong shape for cases that do.
   - **Instead:** Write the concrete case first. Let real repetition emerge. Generalize from stable, understood patterns — not from guesses about future requirements.

4. **The Hidden Side Effect**
   - **What:** A function that silently writes to a database, modifies shared state, sends a network request, or triggers an external process — with none of this visible from the call site.
   - **Why it fails:** Callers cannot reason about what will happen when they invoke a function. Testing becomes difficult because side effects must be controlled invisibly. Debugging requires tracing through layers of indirection.
   - **Instead:** Make effects visible from the call site. Name functions honestly. Separate pure logic from side-effect execution. If a function writes, say so in its name and its type.

5. **The Swallowed Failure**
   - **What:** An error is caught and discarded — with no log, no recovery, no propagation, no indication to the caller that something failed.
   - **Why it fails:** The system silently enters a bad state. There is no diagnostic trail. The user sees an incorrect outcome, not an error message. Debugging starts from nowhere.
   - **Instead:** Fail honestly. If an error is truly non-critical, say so in a comment. If recovery is impossible, propagate the error. If the caller needs to know, return a Result type. Log at meaningful failure points with enough context to diagnose.

---

## REVIEW EXPECTATIONS

<!-- WHY THIS MATTERS: Review standards set the bar for what "acceptable" means. Anti-Gravity uses this priority ordering to self-review generated code before producing it — checking correctness first, style last. -->

Code review checks in priority order:

| Priority | Check | What It Catches |
| :--- | :--- | :--- |
| 1 | Correctness | Does the code do what is intended? |
| 2 | Safety | Are errors handled? Are edge cases covered? |
| 3 | Responsibility clarity | Does each unit have a clear, bounded job? |
| 4 | Naming accuracy | Do names reflect intent and domain meaning? |
| 5 | Structural fit | Does the code fit the surrounding codebase structure? |
| 6 | Type integrity | Are types meaningful, strict, and well-used? No `any`, no unsafe assertions. |
| 7 | Test coverage | Are important behaviors verified? |
| 8 | Standards compliance | Does the code follow the conventions in this file? |
| 9 | Style | Is formatting consistent? |

### We Tolerate Temporarily

- Imperfect naming when domain understanding is still forming
- Missing tests on spike work before it is promoted to production code
- Convention gaps in legacy files during small fixes
- Exploratory patterns in prototype branches

No tolerance survives a merge to main. Spikes must be cleaned up, gaps addressed, and legacy style matched within touched sections before any branch merges.

---

## Open Questions / Evolving Standards

<!-- Track unresolved convention questions here. Format: [Question] — [Owner] — [Target resolution date] -->

- How do we handle optimistic UI updates? — Team — Q2 2026
- Preferred logging tool? — Lead — Q2 2026
- Monorepo vs single-package decision? — Lead — Q3 2026

---

## CROSS-REFERENCES

| Related Context File | Relationship |
| :--- | :--- |
| `stack-context.md` | The technology stack these conventions apply to |
| `architecture-context.md` | The structural organization these conventions operate within |
| `testing-standards.md` | Testing conventions that complement coding conventions |
| `design-system.md` | UI component conventions reference the design system |
| `api-conventions.md` | API route code follows both coding standards and API conventions |
| `security-baselines.md` | Security requirements that override coding conventions when they conflict |
| `performance-baselines.md` | Performance requirements referenced by the Performance Floor section |

---
