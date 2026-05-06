# DESIGN SYSTEM

**Version:** Gold v2.0
**Layer:** 6 — Context (Ground Truth)
**Tier:** 2 — Loaded by task
**File:** contexts/design-system.md
**Purpose:** Defines the design-system posture, visual language, component patterns, and interaction conventions. Anti-Gravity uses this to generate UI that feels like THIS product — not generic UI.
**Loaded When:** Frontend implementation, UI component creation, UX design work, accessibility work, or any task that produces user-facing output.
**Maintenance:** Update when design tokens change, new components or patterns are adopted, or accessibility requirements evolve. Review at least quarterly with whoever owns product design.

---

## HOW ANTI-GRAVITY USES THIS FILE

This file ensures that every UI element Anti-Gravity generates looks and behaves like it belongs to this product.

**When loaded**, Anti-Gravity will:

- Use your design tokens (colors, spacing, typography, radius, elevation) instead of generic values
- Build with your component library and patterns (your Button, your Modal, your form patterns) instead of raw HTML
- Follow your interaction patterns for loading, empty, error, and destructive states
- Apply your responsive breakpoints and layout behaviors
- Enforce your accessibility requirements (keyboard, focus, contrast, semantics)
- Keep new UI consistent with existing hierarchy and tone

**When missing or incomplete**, Anti-Gravity will:

- Produce UI with arbitrary colors, spacing, and typography that look foreign in your product
- Use generic HTML instead of your components
- Mix interaction patterns (e.g., spinner vs skeleton) inconsistently
- Miss accessibility or UX expectations specific to this project

**When stale**, Anti-Gravity will:

- Use deprecated tokens or components the team no longer wants
- Miss newer patterns (e.g., updated form layouts, state treatments)
- Reinforce layout or interaction patterns you are trying to phase out

**Conflict rule:** If this file conflicts with a more specific stack-level or design-token file (`stack-context.md`, design tokens spec), the more specific file wins for that area. Flag the conflict rather than silently choosing.

**Authoritativeness rule:** When Anti-Gravity’s general UI training disagrees with a convention in this file, this file wins. Do not override these design-system rules for personal taste unless the file is explicitly updated.

---

## CURRENT PROJECT POSITION

Anti-Gravity Gold is still primarily a **structured intelligence architecture**, not yet a fully branded shipped product UI.

That means the project has **not yet** fully locked down:

- Final visual brand language
- Full component inventory
- Token values (color, typography, spacing, radius, elevation) for a stable brand
- Framework-specific component implementation conventions
- Platform-specific responsive breakpoints and behavior
- Exact iconography set and rules

### Meaning

Future UI work should not pretend a final, polished brand system already exists. It should instead:

- Preserve interaction and consistency rules
- Avoid introducing one-off patterns that will be hard to reconcile later
- Keep the future design system easier to formalize when the UI stack becomes concrete

This file therefore has two layers:

| Layer | Name | Contents | When Active |
| --- | --- | --- | --- |
| **Layer 1** | Philosophy | Design-system assumptions, principles, state + accessibility expectations, reuse discipline | Active now — independent of stack |
| **Layer 2** | Conventions | Concrete tokens, component inventory, interaction patterns, responsive rules, accessibility details | Filled in and updated as the UI stack evolves |

> **Maintenance rule:** Stack or brand changes update **Layer 2** (conventions).
> Changing **Layer 1** (philosophy) requires an explicit decision
> that the project’s design posture has changed.

---

## CURRENT SAFE DESIGN-SYSTEM ASSUMPTIONS

These assumptions are safe to apply now, even before a finalized visual system exists:

### Assumption 1 — Consistency matters before full visual identity

Even without final brand tokens, repeated interaction patterns and layout logic should remain consistent.

### Assumption 2 — State design is part of system quality

A UI element or screen is incomplete if it only covers the happy path and ignores loading, empty, success, error, disabled, or permission-constrained states where relevant.

### Assumption 3 — Accessibility is baseline, not add-on

Keyboard access, focus visibility, labels, semantics, readable contrast, and reasonable target sizing are design responsibilities, not optional polish.

### Assumption 4 — Reuse should be earned, not forced

Shared components or patterns should exist because they improve coherence and reduce cognitive load — not just to claim “we have a design system.”

### Assumption 5 — User task clarity beats decorative polish

Primary action visibility, hierarchy, and state explanation matter more than visual novelty or ornamental detail.

---

## DESIGN-SYSTEM PRINCIPLES

These principles guide all UI/UX work until a fully detailed design system exists.

### Principle 1 — Prefer familiar patterns over new interaction inventions

**Rule:** Use standard, well-understood interaction patterns when they solve the problem well; only invent new ones when they add real value.

**Meaning:** Novel interaction patterns have a learning cost. This project values disciplined clarity over clever novelty.

---

### Principle 2 — Primary user intent must be visually obvious

**Rule:** Every screen or surface must make its primary task more visually and structurally obvious than any secondary action.

### Expected implications

- Clear primary button or action
- Secondary actions visually subordinate
- Information hierarchy that supports the main task
- Visible state changes when the main task’s status changes

---

### Principle 3 — State completeness is part of “done”

**Rule:** A designed surface is not complete unless its meaningful states are considered.

### Common states to account for

- Loading
- Empty
- Success / confirmation
- Error
- Disabled
- Partial / degraded state
- Access-restricted state where relevant

**Meaning:** A static happy-path mock is not a complete design.

---

### Principle 4 — Components should have clear behavioral roles

**Rule:** A component should not silently shift between unrelated interaction jobs.

### Prefer

- Focused responsibilities
- Predictable behavior
- Consistent naming and placement
- Composability that improves clarity

### Avoid

- Giant “smart” components hiding mixed behaviors
- Components whose meaning changes drastically per usage without strong cues

---

### Principle 5 — Reuse should reduce variation, not hide understanding

**Rule:** Reusable components and patterns should make the product easier to reason about.

### Good reuse

- Repeated button behavior across flows
- Standard form field patterns
- Consistent status messaging
- Stable empty/loading/error treatments

### Bad reuse

- Over-generic wrappers that obscure purpose
- “Shared” components that need many exceptions to work
- Reusability that forces awkward behavior in specific screens

---

### Principle 6 — Text is part of the design system

**Rule:** Labels, CTA text, helper text, empty states, validation copy, and status messages are part of the design system, not an afterthought.

### Meaning

- Wording consistency is part of interaction consistency
- Avoid unclear CTAs, inconsistent naming for similar actions, and error messages that explain nothing
- Copy should make the action and state clearer, not more decorative

---

## DESIGN GOALS

The UI should optimize for:

- Clarity over visual cleverness
- Low cognitive load and fast task completion
- Consistency across similar flows and surfaces
- Accessibility as baseline quality
- A calm, trustworthy, operational feel
- Responsive usability on target device classes
- Data legibility where information density is needed

### Current Design Priorities

- Goal 1: Make primary tasks and actions obvious at a glance
- Goal 2: Reduce user effort by keeping patterns and states consistent
- Goal 3: Preserve accessibility and responsiveness as non-negotiable

### Guidance for Anti-Gravity (Design Goals)

- When tradeoffs appear, favor the option that best supports these goals rather than pure visual preference.

---

## BRAND / EXPERIENCE TONE

The interface should feel:

- Professional and trustworthy
- Calm and controlled (not noisy or flashy)
- Direct and clear, with minimal ornament
- Operational rather than decorative
- Friendly enough, but never childish

### Guidance for Anti-Gravity (Brand Tone)

- Match interaction tone and visual recommendations to this feel
- Avoid trendy or flashy patterns that undermine a calm, operational product (excessive gradients, aggressive animations, etc.)

---

## VISUAL HIERARCHY RULES

Screens should communicate:

- What the screen is for (primary purpose)
- What the main action is
- What state the system is currently in

### Principles (VISUAL HIERARCHY)

- Every screen should have one obvious primary action
- Headings should make the screen’s purpose clear immediately
- Supporting information must not visually compete with the main task
- Destructive actions should be visually distinct but not the most visually prominent element

### Guidance for Anti-Gravity (Visual Hierarchy)

- Use type scale, weight, spacing, and color to make hierarchy obvious
- If a screen has no clear primary action or focal point, treat that as a design issue to call out

---

## LAYOUT PATTERNS

Preferred layout structures include:

- Main app: persistent navigation (sidebar or header) + content region
- Forms: single-column or two-column forms with logical grouping
- Data: table-based views with a filter/search bar and optional summary
- Overview: card-based summaries or dashboards with clear grouping
- Modals: used for focused, shorter tasks or confirmation
- Drawers: used for contextual edit panels adjacent to main content

### Current Layout Conventions

- Layout pattern A — used for primary work surfaces (e.g., dashboards, list/detail views)
- Layout pattern B — used for single flow forms or wizards
- Layout pattern C — used for settings or configuration pages

### Guidance for Anti-Gravity (Layout Patterns)

- Reuse existing layout patterns whenever possible
- Avoid inventing brand-new screen structures when an existing pattern fits the task

---

## COMPONENT STANDARDS (BEHAVIORAL)

Key component types and expectations:

### Buttons

- Primary button: main CTA on a screen; use only one per main area
- Secondary button: supporting actions; visually subordinate
- Tertiary/ghost: low-emphasis or cancel actions
- Destructive: for dangerous or irreversible actions only

Rules (Buttons):

- Avoid multiple competing primary buttons in the same context
- Destructive buttons are visually distinct and never the default

### Modals

- Use for confirmation, short forms, or contained tasks
- Avoid for long, complex multi-step flows unless strongly justified
- Always include a clear primary action and a safe exit (cancel/close)

### Tables

- Used for data sets where seeing multiple items at once matters
- Include sorting, filtering, and pagination when needed
- Provide responsive behavior (horizontal scrolling on small screens)

### Cards

- Used for summaries, overviews, and grouped information
- Cards should not be overloaded with low-priority details

### Alerts/Toasts

- Use inline alerts for contextual errors or important messages
- Use toasts for transient feedback (e.g., “Saved”, “Task created”)
- Do not rely on toasts alone for critical information users must see

### Guidance for Anti-Gravity (Component Standards)

- Match component usage to these roles
- If a suggestion depends on a novel component pattern, explain why existing patterns are insufficient

---

## FORM DESIGN RULES

Forms should:

- Use clear, user-facing labels (no cryptic field names)
- Make required vs optional explicit (e.g., “(optional)”)
- Validate in a timely and actionable way
- Group related fields into logical sections
- Use default values to reduce friction when safe
- Make destructive or irreversible consequences obvious

Conventions (FORM DESIGN):

- Labels above fields, left-aligned
- Primary submit action aligned consistently (e.g., right-aligned at bottom)
- Cancel/secondary actions visually subordinate near the primary button
- Helpful inline messages where confusion is likely

### Guidance for Anti-Gravity (Form Design)

- Optimize forms for completion clarity, not just fewer fields
- Keep spacing, label style, validation style, and button placement consistent across forms

---

## STATE DESIGN RULES

Every meaningful surface should consider:

- Default state
- Loading state
- Empty state
- Error state
- Success / confirmation state
- Disabled state (when not available)
- Pending / in-progress
- Destructive confirmation (when applicable)
- Access-restricted state (no permission)

### Guidance for Anti-Gravity (State Design)

- Avoid “nothing happens” behavior — transitions between states should be clear
- Where state changes matter (saving, deleting, submitting), show that something is happening and whether it succeeded

---

## FEEDBACK AND MESSAGING RULES

Feedback basics:

- Loading should be visible when users might otherwise think nothing is happening
- Success should be confirmed when the user might be uncertain
- Errors should be specific and actionable
- Status should not rely on color alone

Patterns (FEEDBACK AND MESSAGING):

- Use inline messages for field-specific issues
- Use toasts or inline alerts for operation-level feedback
- Avoid using toasts for critical, persistent information that users might miss

### Guidance for Anti-Gravity (Feedback and Messaging)

- The system should never leave the user guessing “Did that work?”
- Feedback text should explain both what happened and what the user can do next

---

## NAVIGATION AND INFORMATION ARCHITECTURE

Navigation should:

- Map top-level sections to stable product areas
- Keep high-frequency actions easy to reach
- Use tabs only when sections are meaningfully parallel
- Use breadcrumbs where deep hierarchy is necessary

### Guidance for Anti-Gravity (Navigation)

- Reflect user task logic, not internal implementation structure
- If an action is used frequently, it should not be buried deep in navigation
- Avoid forcing users through unnecessary intermediate screens

---

## INTERACTION PATTERNS TO PRESERVE

Patterns that should feel the same across the product:

- Placement and style of primary actions
- Error messaging style and positioning
- Confirmation and destructive action flows
- Save/cancel patterns in forms
- Filtering and search interactions for lists and tables
- Table behaviors (sorting, paging, row selection)
- Status badge semantics (colors, labels)
- Modal open/close behavior and focus handling

### Guidance for Anti-Gravity (Interaction Patterns)

- Reuse these patterns instead of inventing new ones
- New interactions should feel like they “belong” to the same product

---

## PATTERNS TO AVOID

Patterns this product deliberately avoids:

- Hiding critical actions behind unlabeled icon-only controls
- Long wizard flows for simple tasks
- Screens with multiple primary CTAs competing for attention
- Ambiguous “success” states where it’s unclear if anything happened
- Skeletons where a simple loading message is clearer
- Hover-only discoverability for important actions
- Overly decorative card overload without hierarchy
- Silent auto-saving in risky workflows without clear state messaging

### Guidance for Anti-Gravity (Patterns to Avoid)

- Avoid these patterns even if they are popular elsewhere
- If a requested design pushes in this direction, call out the tradeoff explicitly

---

## RESPONSIVE DESIGN (SUMMARY)

High-level responsive expectations:

- The UI should remain usable and understandable on target device sizes
- Key actions must remain accessible on smaller screens
- Dense tables and complex layouts may require alternate mobile treatment
- Navigation may collapse responsively (e.g., sidebar -> drawer)

### Guidance for Anti-Gravity (Responsive Design)

- Do not assume desktop-only use unless explicitly stated
- Responsive behavior should preserve task completion, not just shrink the layout

---

## ACCESSIBILITY (SUMMARY)

Baseline accessibility expectations:

- Keyboard navigability for all interactive elements
- Visible focus states
- Adequate contrast for text and key UI elements
- Correct labels for controls and forms
- Appropriate semantics for headings and regions
- No critical meaning conveyed by color alone
- Touch targets large enough on mobile
- Proper focus management for modals/dialogs

### Guidance for Anti-Gravity (Accessibility)

- Treat accessibility as part of “done”, not as a later pass
- If a design recommendation would weaken accessibility, call it out and suggest alternatives

---

## CONTENT / MICROCOPY STYLE

UI text should:

- Be short, clear, and direct
- Use everyday language over technical jargon where possible
- Focus on helping the user complete tasks confidently
- Match the calm, professional tone of the product

### Preferred Wording Qualities

- Concrete and specific (e.g., “Save changes” instead of “Submit”)
- Action-oriented button labels that describe the outcome
- Friendly but not overly casual; neutral when in doubt
- Empathetic in error messages (“We couldn’t…” vs “You did…”)

### Wording To Avoid

- Overly technical or cryptic language
- Robotic or blame-heavy error messages
- Vague button text like “OK” or “Submit” when a clearer label exists
- Inconsistent terminology for the same concept across screens

### Guidance for Anti-Gravity (Content/Microcopy)

- Treat wording as part of the interaction design, not filler
- Reuse established terms for concepts and actions instead of inventing new phrases
- Ensure messages say what happened and what the user can do next

---

## DESIGN-SYSTEM RISKS TO WATCH

- **Local convenience over global consistency** — designing each surface in isolation
- **Premature componentization** — abstracting components before patterns are stable
- **Happy-path-only design** — ignoring states and errors
- **Accessibility drift** — treating accessibility as “later” work
- **Copy inconsistency** — different names for the same thing in different places

---

## DESIGN-SYSTEM ANTI-PATTERNS (NARRATIVES)

### Visual Inconsistency by Local Convenience

### What it looks like

Similar actions, states, or layouts are implemented differently in different areas without a strong reason.

### Why it is harmful

Increases cognitive load and makes the product feel unreliable or patched together.

### What to do instead

Reuse stable patterns and adjust them carefully as needed, instead of reinventing each time.

---

### Component Over-Abstraction

### What it looks like

A “shared” component that tries to cover many unrelated use cases and needs numerous flags and exceptions.

### Why it is harmful

Makes code and UX harder to understand; the abstraction becomes more complex than specific solutions.

### What to do instead

Standardize only when reuse clearly reduces variation and cognitive cost; keep components focused.

---

### State Blindness

### What it looks like

Designs only for the ideal, loaded, success state; loading, empty, and error states are left to be guessed by implementers.

### Why it is harmful

Leads to inconsistent UX and poor user guidance exactly when things go wrong.

### What to do instead

Treat state coverage as part of design completion for any meaningful screen or component.

---

### Accessibility as Afterthought

### What it looks like

Declaring a screen “done” because it looks good visually, despite weak keyboard support, semantics, or contrast.

### Why it is harmful

Builds exclusion into the product and is expensive to fix later.

### What to do instead

Consider accessibility requirements during design; ensure patterns and components support them by default.

---

### Copy Treated as Decoration

### What it looks like

Labels, CTAs, and error messages added last-minute without following any consistent style or terminology.

### Why it is harmful

Creates confusion, breaks trust, and makes interactions harder to understand.

### What to do instead

Design words and interactions together, keeping tone and terminology consistent.

---

## KNOWN UX WEAK SPOTS / CONSISTENCY PROBLEMS

Document concrete issues here so Anti-Gravity can be more conservative:

- [Fill in] Inconsistent empty-state styles across older screens
- [Fill in] Legacy admin pages with weak hierarchy and dense layouts
- [Fill in] Forms with unclear validation or mismatched button placement
- [Fill in] Mobile responsiveness gaps in certain views
- [Fill in] Dashboards overloaded with low-priority metrics

### Guidance for Anti-Gravity (User Experience)

- Do not treat existing weak patterns as ideal; treat them as debt
- Prefer suggestions that move the design closer to the stated goals and patterns, not further away

---

## EXCEPTIONS / PRACTICAL RULES

Some contexts may legitimately diverge from the main patterns:

- Internal admin tools may prioritize information density over visual polish, while still preserving clarity and accessibility
- Legacy screens may not yet match newer standards; updates should be incremental and scoped
- Highly complex, data-heavy views may require tighter layout and specialized interactions

### Guidance for Anti-Gravity (Pragmatism)

- Apply design standards intelligently; explain when and why an exception is appropriate
- Do not silently elevate exceptions into new defaults
- When touching legacy areas, avoid mixing entirely new patterns into small fixes; keep changes coherent and scoped

---

## INSTRUCTIONS FOR ANTI-GRAVITY

When using this file:

1. Prefer existing patterns before inventing new ones
2. Align UI and copy with the stated product tone
3. Make primary tasks and states clear on every surface
4. Preserve consistency across similar flows and components
5. Design meaningful states (loading, empty, error, success) as part of “done”
6. Keep accessibility and responsiveness inside the baseline, not as extras
7. Treat wording as part of the design system, not an afterthought
8. Avoid copying known weak legacy patterns unless explicitly asked to match them
9. If suggesting a new pattern, explain why existing ones are not sufficient
10. Use this file as the minimum standard for design coherence in this project

---

## WHAT FUTURE FILES SHOULD ASSUME

Future stack/visual files should assume:

- This project has a design-system baseline even before a full branded UI exists
- UI work should respect hierarchy, interaction consistency, state completeness, and accessibility
- Stack-specific files (e.g., token definitions, component libraries) will refine these conventions without weakening them
- As the product UI hardens, this file may link to more detailed token and component specs

---

## CROSS-REFERENCES

| Related Context File | Relationship |
| --- | --- |
| `stack-context.md` | Defines concrete UI stack (e.g., React, Next.js, Tailwind, component libraries) |
| `coding-standards.md` | Component file structure, naming conventions, and error-handling patterns |
| `architecture-context.md` | How UI modules map into features and modules |
| `project-context.md` | Target user environment (devices, browsers) shaping responsive and interaction needs |
| `security-baselines.md` | Input handling and error messaging must align with security rules |
| `testing-standards.md` | How UI behavior and interactions are tested and mocked |

---
