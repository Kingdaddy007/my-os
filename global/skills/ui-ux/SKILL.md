---
name: UI/UX & DESIGN THINKING
description: >
  Use this skill when designing or evaluating user interfaces, user flows,
  or frontend experiences. Activated when designing a new screen, component,
  or user flow; writing frontend implementation code (React, Vue, HTML/CSS);
  defining how an application handles loading, error, or empty states;
  restructuring navigation or information architecture; evaluating
  accessibility; or deciding how a backend error should be communicated to
  the user. Also activated when writing or reviewing any CSS, choosing fonts,
  picking colors, defining motion, or building responsive layouts. Examples:
  "design this flow", "how should this form work?", "what should the empty
  state look like?", "the UI is confusing", "make this more user-friendly",
  "write the frontend for X", "build this page", "make this look better".
  Do NOT use for pure backend implementation (use coding skill) or
  architecture decisions (use architecture skill).
---

# UI/UX & DESIGN THINKING

Unified design intelligence for Anti-Gravity. This skill combines passive design knowledge (Layers 1-4 below) with the **Impeccable design OS** — the authoritative system for all visual design, UI craft, and motion work.

**Design Authority:** Impeccable owns all visual design execution. Every UI task — from landing pages to dashboards to forms — goes through Impeccable's workflows, not just "studio-grade" or "visually critical" features. Studio-grade quality is the default standard, not an upgrade.

**This Skill's Role:** Provides the passive intelligence layer that runs underneath every Impeccable workflow. The craft laws, register system, anti-patterns, and execution standards in this file inform every design decision whether or not a specific Impeccable workflow is explicitly invoked.

---

## THE IMPECCABLE DESIGN LIFECYCLE

All design work follows this lifecycle. Impeccable workflows are not optional add-ons — they are the execution system.

### TIER 1: CONTEXT CREATION — "Who are we designing for?"

Run once per project, during **Project Inception** (Phase 3A).

| Workflow | What It Creates | When |
| :--- | :--- | :--- |
| `/impeccable-teach` | **PRODUCT.md** — strategic design context (register, users, brand personality, anti-references, design principles) | Start of any new project with UI |
| `/impeccable-document` | **DESIGN.md** + **DESIGN.json** — visual system (tokens, typography, colors, components, do's/don'ts) | After PRODUCT.md exists, or when the design system needs capturing |

**Relationship to Anti-Gravity contexts:** PRODUCT.md and DESIGN.md are the design-specific truth files. They live alongside `contexts/project-context.md` and `contexts/stack-context.md`, not replacing them. Anti-Gravity contexts handle engineering and product truth; Impeccable contexts handle design truth.

### TIER 2: BUILD — "How do we make this feature look and work?"

Run during **Build Feature** (Step 7c — Client Layer) for every UI task.

| Workflow | What It Does | When |
| :--- | :--- | :--- |
| `/impeccable-shape` | Creates a **task-specific design brief** — discovery interview, visual direction probes, confirmed brief with scope, states, hierarchy, interaction model | Before coding any UI. Produces the blueprint. |
| `/impeccable-craft` | **Full build loop** — runs shape internally → generates visual mock → builds production code → browser verification → critique-and-fix loop | The "golden path" for building any UI feature end-to-end |
| `/impeccable-live` | **Real-time browser editing** — select elements, pick a design action, get AI-generated variants hot-swapped via HMR | When a dev server is running and you want interactive variant exploration |

**Craft is the default.** When building a new UI feature, run `/impeccable-craft`. It handles everything: shape (planning), mock (visual direction), build (implementation), and verify (browser inspection). You only run `/impeccable-shape` separately when you want the design brief without the build.

### TIER 3: REFINEMENT — "How do we make it better?"

Run **post-build**, any time an existing UI needs improvement. These are refinement passes — like studio filters applied to finished work.

#### Review & Scoring

| Workflow | What It Does | Use When |
| :--- | :--- | :--- |
| `/impeccable-audit` | Technical quality scorecard (a11y, perf, responsive, theming, anti-patterns). Scores 0-20. Documents issues, does not fix them. | Post-build technical review |
| `/impeccable-critique` | Design director review — Nielsen heuristics, AI slop detection, cognitive load assessment, persona red flags. Scores 0-40. | Post-build design review |

#### Targeted Refinement

| Workflow | What It Adjusts | Use When |
| :--- | :--- | :--- |
| `/impeccable-polish` | Final detail pass — spacing, states, transitions, alignment, design system drift, code quality | "Make it production-ready" |
| `/impeccable-bolder` | Amplifies contrast, hierarchy, atmospheric treatment, visual confidence | "It feels weak / generic / timid" |
| `/impeccable-quieter` | Reduces visual noise, softens palette, calms motion, increases whitespace | "It feels noisy / aggressive / overwhelming" |
| `/impeccable-distill` | Simplifies the interface — removes excess, sharpens hierarchy, reduces cognitive load | "It's cluttered / confusing / too much" |
| `/impeccable-clarify` | Fixes confusing wording, labels, error messages, state communication | "Users don't understand what's happening" |

#### Specific Dimension Rework

| Workflow | Dimension | Use When |
| :--- | :--- | :--- |
| `/impeccable-colorize` | Color strategy — reworks palette, contrast, tonal relationships | "The colors aren't working" |
| `/impeccable-typeset` | Typography — reworks type pairing, scale, hierarchy, weight strategy | "The typography feels off / flat / generic" |
| `/impeccable-layout` | Spatial structure — reworks grid, composition, information density | "The layout doesn't feel right" |
| `/impeccable-adapt` | Responsiveness — reworks behavior across viewports and contexts | "It breaks on mobile / tablet" |
| `/impeccable-animate` | Motion choreography — adds Motion (Framer Motion) transitions, scroll-driven effects, entrance sequences | "It feels static / dead / lifeless" |
| `/impeccable-delight` | Personality — adds micro-interactions, easter eggs, celebration moments, loading personality | "It works but it has no soul" |
| `/impeccable-overdrive` | Convention breaking — pushes past safe design into unexpected territory | "It's correct but boring — take risks" |

#### Special Purpose

| Workflow | Purpose | Use When |
| :--- | :--- | :--- |
| `/impeccable-onboard` | Onboarding experience design — empty states, tours, progressive disclosure, first-time flows | Building onboarding or first-run experiences |
| `/impeccable-extract` | Extracts design tokens from existing code into structured format | Capturing an existing design system |
| `/impeccable-optimize` | Performance optimization of UI assets and rendering | UI is slow, images too large, animations janky |

---

## MOTION STANDARD

**`motion` (Modern Framer Motion) is the mandatory animation library.** Install it in every project workspace before writing motion code: `npm install motion`.

Motion is not decoration. Premium motion is the difference between "functional" and "feels alive." Every project ships with motion by default.

**Motion hierarchy for any page:**
- **Type A (Static):** Standard layout, no major animation. Text, forms, data tables.
- **Type B (Code Animation):** Scroll reveals, parallax, hover effects, transition choreography. Built with `motion` library.
- **Type C (Cinematic Video):** Full cinematic AI-generated video backgrounds or hero sections. Route to `seedance-20` skill for asset generation.

Every major page section should be mapped to a motion type during design. Map this during `/impeccable-shape` or during Project Inception Phase 3A.

**Motion principles (from reference/motion-design.md):**
- Default easing: `cubic-bezier(0.16, 1, 0.3, 1)` (expo out)
- No bounce. No elastic. They feel amateurish.
- Don't animate layout properties (width, height, top, left, margins)
- Exit animations ~75% of enter duration
- `prefers-reduced-motion` is mandatory — provide crossfade alternatives, not `animation: none`

---

## HOW IMPECCABLE CONNECTS TO ANTI-GRAVITY WORKFLOWS

### During Project Inception

```
Phase 1-3: Problem, MVP, Stack (Anti-Gravity owns this)
    │
Phase 3A: Visual Identity (Impeccable takes over)
    ├── Step 1: /impeccable-teach → PRODUCT.md
    ├── Step 2: /impeccable-document → DESIGN.md + DESIGN.json
    ├── Step 3: Animation mapping (Type A/B/C per section)
    └── Step 4: External prototyping (Figma AI, Stitch, Lovable)
    │
Phase 4-7: Contexts, Memory, Build Sequence (Anti-Gravity owns this)
```

### During Build Feature

```
Steps 1-6: Define, Context, Scope, Risks, Shape, Verify (Anti-Gravity owns this)
    │
Step 7c — Client Layer (Impeccable takes over)
    ├── /impeccable-craft (full loop: shape → mock → build → verify)
    │   OR
    ├── /impeccable-shape → then manual build using craft laws below
    │
Steps 8-11: Review, Verify, Deliver, Memory (Anti-Gravity owns this)
    └── During Step 8 self-review: consider running /impeccable-audit or /impeccable-critique
```

### Post-Build (any time)

```
UI exists → identify the issue → pick the right refinement workflow:
    Weak?     → /impeccable-bolder
    Noisy?    → /impeccable-quieter or /impeccable-distill
    Static?   → /impeccable-animate
    Generic?  → /impeccable-delight
    Broken?   → /impeccable-audit → fix → /impeccable-polish
```

---

## LAYER 1: UX FOUNDATIONS

### Mindset

UX is the systematic reduction of cognitive load. The interface is a deterministic state machine that guides the user safely from point A to point B. Users scan, not read. Users make mistakes; the system prevents them when possible and forgives them when they happen.

Think in:
- **Flows**, not isolated screens
- **States**, not just the default state
- **Behavior**, not just layout
- **User goals**, not only stakeholder requests
- **Clarity** over cleverness

### The 10 UX Lenses

Apply all ten before and during design or review:

1. **User Goal Clarity** — What is the user trying to accomplish? Is the primary task obvious?
2. **Information Hierarchy** — What should users notice first? Are the most important actions visually clear?
3. **Flow Logic** — Is the path obvious? Are there unnecessary steps or dead ends?
4. **Cognitive Load** — How much must the user remember or decide at once? Can choices be simplified?
5. **State Visibility** — Does the user know what the system is doing? Are loading/error/empty states explicit?
6. **Interaction Safety** — Can the user undo mistakes? Are destructive actions protected?
7. **Consistency** — Does the screen follow established patterns? Is a new pattern introduced without reason?
8. **Accessibility** — Keyboard reachable? Contrast adequate? Labels present? Touch targets 44px+?
9. **Performance Perception** — Does it feel responsive? Are delays acknowledged?
10. **Implementation Realism** — Are UX gains proportional to implementation cost?

### The 6 UI States

Do not design only the Happy Path. Every screen must define:

1. **Ideal** — Data present, looks perfect
2. **Empty** — First-time use, no data (provide CTA)
3. **Loading** — Fetching or processing (skeleton screens > spinners)
4. **Error** — Action failed (empathetic message + recovery path)
5. **Partial** — Some data available, or extreme text lengths
6. **Disabled** — No permission, or prerequisites unmet

### Forms

- Group related fields logically
- Ask only for information needed at that stage
- Use labels, help text, defaults, and validation feedback
- Make errors specific and recoverable
- Never wipe the whole form on one field's validation failure

### Destructive Actions

- Prefer undo over confirmation dialogs (users click through confirmations mindlessly)
- Use confirmation only for truly irreversible or high-cost actions
- Make consequences clear before the action is taken

### Decision Framework

| Design Choice | Resolution |
|---|---|
| Free-form vs Dropdown | Constrained choices for standard data; free-form for unique text |
| Pagination vs Infinite Scroll | Pagination for finding specific items; infinite scroll for discovery |
| Explicit Save vs Auto-save | Auto-save for long-form content; explicit save for configuration |
| Modals vs New Pages | Modals for quick supplementary actions; new pages for complex tasks |

---

## LAYER 2: VISUAL CRAFT LAWS

These rules apply to every CSS file, every component, every design decision. They are not optional.

### Color

- **Use OKLCH.** Not HSL, not hex for design decisions. OKLCH is perceptually uniform.
- **Never use `#000` or `#fff`.** Tint every neutral toward the brand hue (chroma 0.005-0.01).
- **Pick a color strategy before picking colors:**
  - **Restrained** — tinted neutrals + one accent ≤10%. Product default; brand minimalism.
  - **Committed** — one saturated color carries 30-60% of the surface. Brand default.
  - **Full palette** — 3-4 named roles, each used deliberately. Brand campaigns; data viz.
  - **Drenched** — the surface IS the color. Brand heroes, campaign pages.
- **60-30-10 is about visual weight**, not pixel count. Accent works because it's rare.
- **Alpha is a design smell.** Heavy `rgba()`/`hsla()` use means an incomplete palette. Define explicit overlay colors.
- **Gray text on colored backgrounds is always wrong.** Use a darker shade of the background color, or transparency.
- See [reference/color-and-contrast.md](reference/color-and-contrast.md) for full guidance.

### Typography

- **Body text minimum 16px (1rem).** Below this fails WCAG on mobile.
- **Cap body line length at 65-75ch** using `max-width: 65ch`.
- **Hierarchy through scale + weight contrast.** Minimum 1.25 ratio between type steps. Flat scales (1.1x) read as uncommitted.
- **Fluid `clamp()` for headings only.** Body text stays at fixed rem. Keep `max ≤ 2.5x min`.
- **Light text on dark: compensate on three axes.** Bump line-height +0.05-0.1, add letter-spacing 0.01-0.02em, optionally step weight up one notch.
- **ALL-CAPS needs tracking.** Add 0.05em-0.12em letter-spacing to all-caps labels and headings.
- **`text-wrap: balance` on headings, `text-wrap: pretty` on prose.**
- **Web font loading:** Use `font-display: swap`. Preload the critical weight only. Match fallback metrics to minimize CLS.
- See [reference/typography.md](reference/typography.md) for full guidance.

### Layout & Spacing

- **4pt base grid** (4, 8, 12, 16, 24, 32, 48, 64, 96px). Name tokens semantically (`--space-sm`), not by value.
- **Vary spacing for rhythm.** Same padding everywhere is monotony.
- **Cards are the lazy answer.** Use them only when truly the best affordance. **Never nest cards inside cards.**
- **Don't wrap everything in a container.** Most things don't need one.
- **Use `gap` instead of margins** for sibling spacing.
- **Touch targets minimum 44x44px.** Use padding or pseudo-elements to expand without changing visual size.
- See [reference/spatial-design.md](reference/spatial-design.md) for full guidance.

### Motion

- **Ease out with exponential curves:** `cubic-bezier(0.16, 1, 0.3, 1)` (expo out) is the recommended default.
- **No bounce. No elastic.** They feel tacky and amateurish.
- **Don't animate CSS layout properties** (`width`, `height`, `top`, `left`, margins).
- **Exit animations are faster than entrances** (~75% of enter duration).
- **Duration guide:** 100-150ms (instant feedback), 200-300ms (state changes), 300-500ms (layout), 500-800ms (entrances).
- **`prefers-reduced-motion` is mandatory.** Provide crossfade alternatives, not just `animation: none`.
- See [reference/motion-design.md](reference/motion-design.md) for full guidance.

### Interaction Design

- **Every interactive element needs 8 states:** default, hover, focus, active, disabled, loading, error, success.
- **Never `outline: none` without replacement.** Use `:focus-visible` for keyboard-only focus rings.
- **Placeholders aren't labels.** They disappear on input. Always use visible `<label>` elements.
- See [reference/interaction-design.md](reference/interaction-design.md) for full guidance.

### Responsive Design

- **Mobile-first.** Base styles for mobile, `min-width` queries to layer complexity.
- **Content-driven breakpoints.** Let content tell you where to break, not device sizes.
- **Detect input method, not just screen size.** Use `@media (pointer: coarse)` and `@media (hover: none)`.
- **Handle the notch.** Use `env(safe-area-inset-*)` and `viewport-fit=cover`.
- See [reference/responsive-design.md](reference/responsive-design.md) for full guidance.

### UX Writing

- **Button labels: verb + object.** "Save changes" not "OK". "Delete project" not "Yes".
- **Error messages: What happened + Why + How to fix.** Never blame the user.
- **Empty states are onboarding moments.** Acknowledge, explain value, provide CTA.
- **Consistency: pick one term and enforce it.** Delete/Remove/Trash → pick one.
- See [reference/ux-writing.md](reference/ux-writing.md) for full guidance.

### Absolute Bans

Match-and-refuse. If you're about to write any of these, rewrite the element with different structure:

- **Side-stripe borders.** `border-left` or `border-right` > 1px as colored accent. Rewrite with full borders, background tints, icons, or nothing.
- **Gradient text.** `background-clip: text` with gradient. Use a single solid color. Emphasis via weight or size.
- **Glassmorphism as default.** Blurs and glass cards used decoratively. Rare and purposeful, or nothing.
- **The hero-metric template.** Big number, small label, supporting stats, gradient accent. SaaS cliche.
- **Identical card grids.** Same-sized cards with icon + heading + text, repeated endlessly.
- **Modal as first thought.** Exhaust inline and progressive alternatives first.
- **Em dashes in copy.** Use commas, colons, semicolons, periods, or parentheses.

### The AI Slop Test

If someone could look at this interface and say "AI made that" without doubt, it has failed. Check:
- Are you using Inter, DM Sans, or Outfit by reflex?
- Is the palette purple-to-blue or teal-to-green?
- Are there rounded-square icon tiles above every heading?
- Is every section a centered stack with identical card grids?
- Could someone guess the palette from the category name alone? ("fintech = navy + gold", "healthcare = white + teal")

If yes to any: rework until the answer is no.

---

## LAYER 3: REGISTER SYSTEM

Every design task is either **brand** or **product**. Identify before designing.

### Brand Register

When design IS the product: brand sites, landing pages, marketing surfaces, portfolios, editorial.

- **Typography:** Distinctive + refined. Display serif + sans body, or rule-breaking mono-only. Two families minimum only when voice needs it. Modular scale, fluid `clamp()`, ≥1.25 ratio.
- **Color:** Committed, Full Palette, and Drenched strategies are encouraged. Palette IS voice. Don't hedge with neutrals.
- **Layout:** Asymmetric compositions or rigorously-gridded. The failure is splitting the difference into a generic centered stack. Don't default to centering everything.
- **Motion:** Ambitious first-load motion permitted. Scroll-triggered transitions, typographic choreography. Use `motion` library for all Type B animations.
- **Imagery:** Brand surfaces that imply imagery (fashion, food, travel, hotels) MUST ship imagery. Zero images is a bug.
- **Permissions:** Single-purpose viewports, typographic risk, unexpected color strategies, art direction per section.
- **Font selection:** Follow the 4-step procedure in [reference/brand.md](reference/brand.md). Check against the reflex-reject list.
- **Reflex-reject font list:** Fraunces, Newsreader, Lora, Crimson (all variants), Playfair Display, Cormorant, Cormorant Garamond, Syne, IBM Plex families, Space Mono, Space Grotesk, Inter, DM Sans, DM Serif families, Outfit, Plus Jakarta Sans, Instrument Sans, Instrument Serif. When the existing brand has already committed to a font, identity-preservation wins; the reject list applies to new greenfield choices only.
- See [reference/brand.md](reference/brand.md) for full guidance.

### Product Register

When design SERVES the product: app UIs, dashboards, settings, data tables, tools.

- **Typography:** System fonts are legitimate. One family is often right. Fixed rem scale, not fluid. Tighter scale ratio (1.125-1.2).
- **Color:** Restrained by default. Accent for primary actions only, not decoration.
- **Layout:** Predictable grids. Familiar patterns are features. Standard navigation.
- **Components:** Every interactive component has all 8 states. Skeleton states for loading.
- **Motion:** 150-250ms. Motion conveys state, not decoration. No orchestrated page-load sequences.
- See [reference/product.md](reference/product.md) for full guidance.

### Register Detection

Priority order: (1) PRODUCT.md register field if it exists, (2) Cue in the task ("landing page" = brand, "dashboard" = product), (3) the surface in focus. First match wins.

---

## LAYER 4: EXECUTION STANDARDS

### Framer Motion Performance

- **Never run infinite intervals off-screen.** Pause `setInterval` crossfaders when element is out of view using Intersection Observer or `useMotionValueEvent`.
- **Explicit variant typing.** Always type variants using `const variants: Variants = {...}` to catch invalid CSS at compile time.

### Layout & Clipping Integrity

- **Beware `overflow: hidden` on complex hero sections.** For portal/zoom effects, the section container can use `overflow: clip`, but the sticky wrapper inside MUST use `overflow: visible`.
- **SVG animations:** Don't mix absolute SVGs with CSS Grid children. Put SVGs in a wrapper absolutely positioned outside the grid container.

### 3D CSS Perspectives

- For premium horizontal galleries, use 3D Coverflow: parent `perspective: 1200px`, track `transform-style: preserve-3d`, cards calculate `rotateY` and `z` from center distance.

### Architectural Polish

- **Global reduced motion:** ALWAYS include `@media (prefers-reduced-motion: reduce)` that forces `animation-duration: 0.01ms !important` and `scroll-behavior: auto`.
- **Film grain overlays:** For premium dark aesthetics, implement as SVG `<feTurbulence>` filter via Base64 data URI in `::after`, `opacity: 0.03`, `pointer-events: none`.
- **Typographic contrast:** Never use display (serif) fonts for long-form paragraph text. Body (sans-serif) for paragraphs.

---

## BEHAVIORAL WORKFLOW

### For New Screens/Flows

1. Determine register (brand or product) — check PRODUCT.md first
2. Run `/impeccable-craft` (which includes shape → mock → build → verify)
3. During build, apply all visual craft laws from Layer 2
4. Run the AI slop test before presenting
5. Check accessibility and responsive behavior
6. Consider refinement passes (audit, critique, polish) before delivery

### For Improving Existing UI

1. Run `/impeccable-audit` or `/impeccable-critique` to identify issues
2. Pick the right refinement workflow based on the diagnosis
3. Apply the fix using the targeted Impeccable workflow
4. Re-run audit/critique to verify improvement

---

## ANTI-PATTERNS

| Anti-Pattern | What It Looks Like | Fix |
|---|---|---|
| Exposing the Machine | Raw stack traces, HTTP codes in UI | Catch at boundary, translate to human-readable copy |
| Mystery Meat Navigation | Icons without text labels | Pair icons with text labels for primary navigation |
| Dead End Empty State | "No documents found" with no actions | Explanation + primary CTA to create first item |
| Unforgiving Interface | Form clears all fields on one error | Preserve valid state, warn before destruction |
| Component-Centric Thinking | Starting from widgets, not user journey | Design components to serve the flow |

---

## NON-NEGOTIABLE CHECKLIST

Before delivering any frontend work:

- [ ] Primary CTA is obvious and singular per view
- [ ] All async actions have loading indicators and success/failure states
- [ ] Error messages are empathetic and state next steps
- [ ] All 6 UI states accounted for
- [ ] Destructive actions protected
- [ ] No technical jargon in user-facing copy
- [ ] Body text ≥ 16px
- [ ] No pure black or pure white — all neutrals tinted
- [ ] Motion uses exponential ease-out, no bounce
- [ ] `prefers-reduced-motion` respected with alternatives
- [ ] Touch targets ≥ 44px
- [ ] Focus rings visible for keyboard navigation
- [ ] Line length capped at 65-75ch
- [ ] No items from the absolute bans list
- [ ] Passes the AI slop test

---

**Final Rule:** A good interface helps users succeed without making them think harder than necessary. If the user still feels lost, the design is not good enough. If someone could say "AI made that" without hesitation, the craft is not good enough.
