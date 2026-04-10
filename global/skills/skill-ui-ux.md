# SKILL: UI/UX & DESIGN THINKING

**Version:** Gold v1.1 (Upgraded — UI/UX Lenses, Authority Statement, Behavioral Sections A–D, Before-Finalizing Re-check, Final Rule, UI/UX Heuristics, Component-Centric anti-pattern added)

**Type:** Specialized Skill Domain

**Tier:** 2 — Loaded by task (when Designer Mode is active, or building frontend in Builder Mode)

**File:** skills/skill-ui-ux.md

**Inherits From:** anti-gravity-core.md, system-thinking.md, expert-cognitive-patterns.md

**Primary Mode:** Designer

**Secondary Modes:** Builder (frontend implementation), Reviewer (frontend PRs)

**Purpose:** Governs how Anti-Gravity designs and evaluates user interfaces, prioritizing cognitive ease, system visibility, and error prevention over mere aesthetics

***

## MINDSET

The engineering UX mental model is not about making things "look pretty" — it revolves around the systematic reduction of cognitive load. The expert views the interface not as a visual canvas, but as a deterministic state machine that must guide the user safely and predictably from point A to point B.

They rely heavily on established usability heuristics (particularly Jakob Nielsen's 10 Heuristics). They know that users do not read; they scan. They know that users will make mistakes, and therefore the system must prevent them when possible and forgive them when they happen.

Every user interaction is evaluated against how closely it matches the user's real-world mental model, ensuring the system speaks the user's language rather than exposing database terminology or internal architectural constraints. The expert believes that if a user needs a manual to use the feature, the interface is broken.

The interface is not just a visual surface. It is:

- a decision environment
- a workflow guide
- a trust signal
- a failure-recovery surface
- a translation layer between system complexity and human intention

Anti-Gravity should always think in:

- flows, not isolated screens
- states, not just the default state
- behavior, not just layout
- user goals, not only stakeholder requests
- clarity over cleverness

***

## ACTIVATION TRIGGERS

### When to Load This Skill

- Designing a new user flow, screen, or component
- Writing frontend implementation code (React, Vue, HTML/CSS)
- Defining how an application should handle loading, error, or empty states
- Restructuring navigation or information architecture
- Evaluating the accessibility of an interface
- Deciding how a backend error should be communicated to the user

### Red Flags That This Skill Is Being Neglected

- The UI exposes raw database errors or stack traces to the user
- Buttons or links do not provide visual feedback when clicked (loading states missing)
- The user is blamed for errors (e.g., "Invalid input provided") rather than guided
- Destructive actions (Delete) have no confirmation or undo functionality
- The interface relies on icons without text labels, forcing the user to memorize their meaning
- The layout breaks or becomes unusable on mobile devices
- The design only considers the "Happy Path" and ignores edge cases

### Usually Pairs With

- `skill-coding.md` — When transitioning from UI design to frontend implementation
- `skill-architecture.md` — To ensure the backend API can support the required UI states (e.g., returning proper error codes)
- `skill-product-thinking.md` — To align the interface with the actual Job-to-be-Done

***

## OBJECTIVES

When this skill is active, the goal is to produce an interface design that is:

1. **Clear** — Reduces cognitive load; users know exactly what to do next
2. **Visible** — Always displays the current system status (loading, processing, success, error)
3. **Forgiving** — Prevents errors before they happen and provides easy recovery paths
4. **Accessible** — Usable by everyone, including those relying on keyboards or screen readers
5. **Consistent** — Follows established patterns so users don't have to learn new mechanics
6. **State-Complete** — Accounts for all possible UI states, not just the ideal scenario

***

## DECISION FRAMEWORK

UI decisions continuously balance user freedom, efficiency, and error prevention.

| Design Choice | Tradeoff Evaluation | Resolution Strategy |
| --- | --- | --- |
| **Free-form Input vs. Dropdown/Radio** | Maximum user flexibility vs. strict data integrity and ease of use. | Favor constrained choices (dropdowns) for standard data to prevent errors. Use free-form for unique text. |
| **Pagination vs. Infinite Scroll** | Context preservation and footer access vs. continuous, frictionless engagement. | Use pagination for tasks requiring finding specific items (data tables). Use infinite scroll for discovery/feed consumption. |
| **Explicit Save vs. Auto-save** | Clear system feedback vs. interaction efficiency. | Auto-save for long-form content creation (with a "Saved" indicator). Explicit save for configuration/settings changes. |
| **Modals vs. New Pages** | Keeping context vs. focusing attention on a complex task. | Use modals for quick, supplementary actions. Use new pages for complex, multi-step tasks. |

***

## UI/UX LENSES

Before and during design or review, explicitly inspect these ten lenses:

### 1. User Goal Clarity

- What is the user trying to accomplish here?
- Is the primary task obvious?
- Is the screen built around the user's job or around internal system structure?

### 2. Information Hierarchy

- What should users notice first?
- What is primary, secondary, or optional?
- Are the most important actions and signals visually and structurally clear?

### 3. Flow Logic

- What are the steps the user must take?
- Is the path obvious?
- Are there unnecessary steps, branches, or dead ends?

### 4. Cognitive Load

- How much must the user remember, compare, interpret, or decide at once?
- Is the screen doing too much?
- Can choices be simplified, sequenced, or clarified?

### 5. State Visibility

- Does the user know what the system is doing?
- Are loading, saving, success, error, and empty states explicit?
- Is progress visible where it matters?

### 6. Interaction Safety and Recovery

- Can the user undo mistakes, recover from failure, and understand what went wrong?
- Are destructive actions protected appropriately?
- Are error messages actionable rather than blaming?

### 7. Consistency

- Does the screen follow the product's interaction patterns, naming, components, and visual language?
- Is a new pattern being introduced without strong reason?

### 8. Accessibility

- Can the interface be used with keyboard, assistive technology, varying vision, varying motor ability, and smaller screens?
- Are labels, focus behavior, contrast, targets, and semantics adequate?

### 9. Performance Perception

- Does the experience feel responsive?
- Are delays acknowledged with loading states or skeleton screens?
- Does the interface avoid jank, confusing reflows, or blocked interaction without explanation?

### 10. Implementation Realism

- Is the proposed experience achievable without excessive complexity?
- Are UX gains proportional to implementation cost?
- Can the core value be delivered with a smaller scope first?

***

## UI/UX HEURISTICS

Anti-Gravity should generally prefer:

- one clear primary action per screen or view
- progressive disclosure over crowded overload
- visible system status over hidden processing
- real-world wording over technical jargon
- consistent interaction patterns over novelty
- user-recognizable structure over clever layout tricks
- explicit feedback over silent state changes
- recoverability over harsh irreversible actions
- showing relevant information rather than forcing recall
- standard vetted patterns before inventing new interaction logic
- accessible defaults over opt-in accessibility

***

## BEHAVIORAL WORKFLOW

When designing a user flow or interface, follow this sequence:

### Step 1: Define the User and the Goal

- Who is using this? (Admin, first-time user, power user?)
- What is their specific Job-to-be-Done on this screen?

### Step 2: Map the Flow (Not the Screen)

- Map the step-by-step path the user must take to achieve the goal.
- Eliminate unnecessary steps. Ask: "Can the system figure this out automatically?"

### Step 3: Define the Content Hierarchy

- What is the single most important piece of information? Make it the most prominent.
- What is the primary action? Make it the most visually distinct (Primary Button).
- Hide secondary actions and advanced settings behind progressive disclosure.

### Step 4: Map the 6 UI States

Do not just design the "Happy Path." Define how the UI looks and behaves in:

1. **Ideal State:** Data is present and looks perfect.
2. **Empty State:** First-time use, no data exists yet (provide a Call to Action).
3. **Loading State:** Data is being fetched or an action is processing.
4. **Error State:** The action failed (network error, validation error).
5. **Partial State:** Only some data is available, or text is extremely long/short.
6. **Disabled State:** The user does not have permission, or prerequisites aren't met.

### Step 5: Apply Error Prevention & Forgiveness

- Add confirmation dialogs or "Undo" snackbars for destructive actions.
- Write empathetic, jargon-free error messages that provide a clear path to resolution.

### Step 6: Audit Accessibility (a11y)

- Ensure all interactive elements are reachable via keyboard (Tab/Enter).
- Ensure color contrast meets minimum WCAG standards.
- Ensure forms have explicit labels (not just placeholders).

### Step 7: Before Finalizing — Re-check

- Re-check the primary user goal.
- Re-check that the primary action is obvious.
- Re-check that all 6 UI states are covered.
- Re-check error prevention and recovery paths.
- Re-check accessibility basics.
- Re-check whether the design is simpler and clearer than before.
- Re-check whether the interface supports user success, not just stakeholder preference.

***

## BEHAVIORAL SECTIONS

### A. When designing a new screen or flow

1. Write the user goal in plain language.
2. Define the primary action the user should take.
3. Map the flow as a sequence of states, not just one static screen.
4. Decide what information is essential, secondary, and deferrable.
5. Design loading, empty, success, and error states explicitly.
6. Choose familiar patterns before inventing new interaction logic.
7. Check accessibility and mobile/narrow-screen behavior early.
8. Keep the first version focused on the core path.

### B. When improving an existing UI

1. Identify where users hesitate, misclick, abandon, or become confused.
2. Determine whether the issue is hierarchy, wording, state visibility, flow sequencing, or interaction safety.
3. Fix the most important source of friction first.
4. Remove or defer anything that distracts from the primary path.
5. Re-check state coverage and accessibility after the improvement.

### C. When designing forms

1. Group related fields logically.
2. Ask for only the information truly needed at that stage.
3. Use labels, help text, defaults, and validation feedback to reduce ambiguity.
4. Make the next step obvious.
5. Make errors specific and recoverable.
6. Preserve valid field state if one field fails validation — never wipe the whole form.

### D. When handling destructive or risky actions

1. Decide whether confirmation, undo, or staged commitment is best.
2. Use stronger friction only when the risk justifies it.
3. Make consequences clear before the action is taken.
4. Make recovery or reversal visible when possible.
5. Never execute a destructive action on a single click without safeguard.

***

## KEY DIAGNOSTIC QUESTIONS

Ask these when evaluating a UI/UX design:

- **The Visibility Check:** How will the user definitively know this background action (like a save or a delete) was successful?
- **The Memory Check:** Does this screen require the user to remember complex information from a previous step? (Design for recognition, not recall.)
- **The Recovery Check:** If the user accidentally clicks the wrong button or deletes a record here, how easily and quickly can they recover?
- **The Jargon Check:** Does the interface speak the user's language, or did database column names (like `user_guid`) leak into the UI?
- **The Edge Case Check:** What happens to this layout if a user inputs a name that is 50 characters long? What if it's translated into German (which takes 30% more space)?

***

## NON-NEGOTIABLE CHECKLIST

- [ ] The primary Call to Action (CTA) is obvious and singular per view
- [ ] All asynchronous actions have distinct loading indicators and definitive success/failure states
- [ ] Error messages are empathetic, jargon-free, and clearly state the next steps
- [ ] The 6 UI states (Ideal, Empty, Error, Loading, Partial, Disabled) are all accounted for
- [ ] Destructive actions are protected by a confirmation step or a reliable undo feature
- [ ] Technical jargon and internal system names have been eradicated from user-facing copy

***

## ANTI-PATTERNS

### Exposing the Machine

**What it looks like:** Displaying raw stack traces, generic "HTTP 500" errors, or database column names (`first_name_str`) in the UI.
**Why it is harmful:** It spikes cognitive load, frightens non-technical users, and provides zero actionable guidance on how to fix the problem.
**What to do instead:** Catch errors at the boundary and translate them into human-readable, actionable copy: "We couldn't save your profile right now. Please try again in a few minutes."

### The "Mystery Meat" Navigation

**What it looks like:** Using obscure icons without text labels, assuming the user will hover over them to figure out what they do.
**Why it is harmful:** Forces the user to rely on memory rather than recognition. Increases interaction time and friction.
**What to do instead:** Always pair icons with text labels, especially for primary navigation or complex actions.

### The Dead End (Orphaned Empty State)

**What it looks like:** A page that says "No documents found" with absolutely no buttons, links, or instructions on what to do next.
**Why it is harmful:** It abandons the user entirely.
**What to do instead:** Every empty state should include an explanation of what goes there and a primary button to create/add the first item.

### The Unforgiving Interface

**What it looks like:** A form that clears all 20 fields if the user gets one validation error, or a "Delete Account" button that executes instantly with one click.
**Why it is harmful:** Punishes users for inevitable human error, causing massive frustration and churn.
**What to do instead:** Preserve valid state. Warn before destruction, or provide a grace period to undo.

### Component-Centric Thinking

**What it looks like:** Starting from widgets, layout components, and visual elements rather than the actual journey the user is trying to complete.
**Why it is harmful:** Produces screens that look assembled but do not guide the user through a real task. The design works as a collection of parts, not as an experience.
**What to do instead:** Start from the user journey. Design components to serve the flow, not the other way around.

***

## OUTPUT CONTRACT

When designing UI/UX flows, structure your output as follows:

```
## User Goal & Context
What the user is trying to accomplish and their technical proficiency.

## Flow Structure
1. User does X
2. System does Y
3. User sees Z

## Layout & Hierarchy Logic
What goes where and why. Which element is primary, secondary, tertiary.

## State Coverage
- **Ideal:** [Description]
- **Empty:** [Description + Call to Action]
- **Loading:** [Skeleton loaders / Spinners / Disabled buttons]
- **Error:** [Specific error copy and recovery path]
- **Partial:** [Description]
- **Disabled:** [Description]

## Interaction & Feedback
Hover states, transitions, success toasts.

## Accessibility Requirements
ARIA labels, focus management, contrast notes.
```

***

## EXAMPLES OF GOOD BEHAVIOR

### Good: Handling Asynchronous State

**❌ Bad Approach:** User clicks "Submit". The button does nothing. Two seconds later, the page reloads.
**✅ Good Approach:** "When the user clicks 'Submit', the button should immediately enter a `disabled` state and display a loading spinner. The cursor should change to `wait`. Once the API returns a 200 OK, a green success toast should appear in the top right, and the form should reset."

### Good: Humanizing Error Messages

**❌ Bad Copy:** `Error: Invalid password format. Regex validation failed.`
**✅ Good Copy:** `Your password needs to be at least 8 characters long and include a number.`

### Good: Designing for Recognition (Not Recall)

"In the multi-step checkout flow, the user shouldn't have to remember what they ordered while entering their credit card. We need to persist an 'Order Summary' sidebar on the right side of the screen throughout Steps 2, 3, and 4 so the context remains visible at all times."

### Good: UX vs Implementation Tradeoff

"The multi-step wizard would be cleaner visually, but it introduces extra navigation cost for a task most users complete in under a minute. A well-grouped single-page form with clear sections and inline validation is the better tradeoff for now."

***

## FILE RELATIONSHIPS

| Related File | Relationship |
| --- | --- |
| `anti-gravity-core.md` | Core principles apply: "Communicate with precision" (translates to precise UI copy) and "Consider failure modes" (translates to UI error states). |
| `skill-coding.md` | Designer mode plans the interface; Builder mode writes the React/CSS to implement it. |
| `skill-product-thinking.md` | UI/UX is the physical manifestation of Product Thinking. You must know the Job-to-be-Done before drawing a single button. |
| `expert-cognitive-patterns.md` | Employs the "Anti-Comfort" pattern to challenge assumptions about how users actually behave vs how we want them to behave. |

***

## AUTHORITY

If any other file in this system appears to contradict this file on **how UI/UX should be reasoned through as a domain skill**, this file is authoritative unless a project-level override is explicitly documented.

***

## FINAL RULE

A good interface helps users succeed without making them think harder than necessary.

If the user still feels lost, the design is not good enough.

***

## VERSION HISTORY

| Version | Date | Changes |
| --- | --- | --- |
| Gold v1.0 | Initial | Complete UI/UX skill — mindset, triggers, tradeoff framework table, 6-step workflow, 6 UI States model, diagnostic questions, 4 anti-patterns, output contract |
| Gold v1.1 | Upgrade | Added UI/UX Lenses (10-lens framework) from C including Performance Perception and Implementation Realism; added Authority statement from C; added Behavioral Sections A–D (Forms, Destructive Actions) from C; added Before-Finalizing Re-check as Step 7 from B; added Final Rule from B; added UI/UX Heuristics list from A; added Component-Centric Thinking anti-pattern from B; added UX vs Implementation tradeoff example from C |
