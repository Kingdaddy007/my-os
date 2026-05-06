# VISUAL IDENTITY

**Version:** Gold v1.0
**Layer:** Context — Ground Truth
**Tier:** 2 — Loaded by task
**File:** contexts/visual-identity.md
**Purpose:** The visual design source of truth for this project. Defines aesthetic direction, color tokens, typography, spacing, component patterns, and motion rules. Every UI implementation references THIS file for HOW things look. Works alongside `design-system.md` which defines HOW things behave.
**Loaded When:** Any frontend/UI work. Required companion to `design-system.md`. Created at project inception Phase 3A for any product with a user interface.
**Maintenance:** Update when visual direction changes. Never invent values outside this file mid-project — add them here first.

---

## HOW ANTI-GRAVITY USES THIS FILE

**When loaded**, Anti-Gravity will:

- Use ONLY the color tokens, fonts, spacing, and radii defined here — never generic or arbitrary values
- Apply the visual direction's emotional intent (the "vibe") to every UI decision
- Use the component CSS patterns as the baseline implementation — not reinvent them
- Apply the motion scale to all animations — no arbitrary durations
- Enforce accessibility rules as non-negotiable constraints

**When missing or incomplete**, Anti-Gravity will:

- Fall back to generic neutral design that has no visual personality
- Produce inconsistent UI that doesn't feel like a coherent product
- Miss the emotional intent — technically correct but visually wrong

**Companion file:** `design-system.md` covers principles, interaction rules, and state design. This file covers the visual tokens and aesthetic direction. Load both together for complete design context.

---

## PART 1: VISUAL DIRECTION

### The Product Vibe (One Sentence)

<!-- Write one sentence that captures the overall visual feeling of this product.
     Be specific — not "modern" or "clean". Say what it actually FEELS like.
     Examples:
     "This app looks like a premium fintech dashboard — dark, data-forward, and institutional."
     "This tool feels like a luxury editorial magazine — cinematic, dark, and unmistakably high-end."
     "This product feels like a calm productivity tool — light, spacious, and quietly confident." -->

[Fill in — the product's visual identity in one honest sentence]

---

### What It IS

<!-- List 4–6 specific descriptors of the design direction.
     Example: dark glassmorphic surfaces, editorial serif headlines, subtle motion, minimal icons, high contrast photography -->

- [Fill in]
- [Fill in]
- [Fill in]
- [Fill in]

### What It is NOT

<!-- This prevents aesthetic drift during development.
     Example: ❌ Bright pastel consumer app (too casual for this context)
               ❌ White minimalist SaaS (too cold, too generic)
               ❌ Cluttered with decorative elements (too noisy) -->

- ❌ [Fill in]
- ❌ [Fill in]
- ❌ [Fill in]

---

### Mood References

<!-- List 3–6 reference products, websites, or works that capture the look and feel.
     For each: name it AND say specifically what to study.

| Example | SSENSE.com | Dark editorial grid, generous whitespace, product as hero --> |

| Reference | What to Study |
| ----------- | -------------- |
| [Reference 1] | [Specifically: layout? color use? typography? motion?] |
| [Reference 2] | [What to look at] |
| [Reference 3] | [What to look at] |

---

### The Emotional Test

<!-- When a user first opens this product, what specific emotions should they feel?
     Define 3–4 concrete emotional reactions the design must produce. -->

When a user opens [Product Name], they should feel:

- "[Fill in — a specific emotional reaction, in quotes]"
- "[Fill in]"
- "[Fill in]"

---

### Why This Direction

<!-- Justify the aesthetic choice with real reasoning tied to user, business, or market context.
     This section protects the visual direction from being arbitrarily overridden. -->

1. [Reason 1 — connect to user psychology or market differentiation]
2. [Reason 2]
3. [Reason 3]

---

## PART 2: COLOR TOKENS

### Core Variables

#### Backgrounds

```css
--bg-primary:    [hex];     /* Page background — deepest/lightest canvas */
--bg-surface:    [hex];     /* Cards, panels — one level elevated */
--bg-elevated:   [hex];     /* Active cards, hover states — two levels elevated */
--bg-overlay:    [rgba];    /* Modal/drawer backdrop */
```

#### Text

```css
--text-primary:   [hex];    /* Headlines, primary content */
--text-secondary: [hex];    /* Body text, descriptions */
--text-muted:     [hex];    /* Captions, metadata, disabled labels */
--text-inverse:   [hex];    /* Text rendered on accent or light backgrounds */
```

#### Accent

```css
--accent-primary:   [hex];  /* Primary CTAs, active states, highlights */
--accent-hover:     [hex];  /* Hover state on primary accent elements */
--accent-secondary: [hex];  /* Secondary highlights, alternative accents */
```

#### Feedback States

```css
--success:  [hex];          /* Confirmations, completed states */
--warning:  [hex];          /* Warnings, pending states */
--error:    [hex];          /* Errors, destructive actions */
--info:     [hex];          /* Informational messages */
```

#### Special / Effects

```css
/* Glassmorphism — remove if not used in this project */
--glass-bg:      rgba(255,255,255,[opacity]);
--glass-border:  rgba(255,255,255,[opacity]);
--glass-blur:    [px];
```

#### Gradients

```css
--gradient-hero:   [definition];    /* Hero section background */
--gradient-card:   [definition];    /* Card image overlay (if applicable) */
--gradient-accent: [definition];    /* Accent gradient (if applicable) */
```

---

### Color Reference Table

| Role | Name | Value | Usage |
| ------ | ------ | ------- | ------- |
| Background (primary) | [Name] | `[hex]` | [where it's used] |
| Background (surface) | [Name] | `[hex]` | [where it's used] |
| Background (elevated) | [Name] | `[hex]` | [where it's used] |
| Text (primary) | [Name] | `[hex]` | [where it's used] |
| Text (secondary) | [Name] | `[hex]` | [where it's used] |
| Text (muted) | [Name] | `[hex]` | [where it's used] |
| Accent (primary) | [Name] | `[hex]` | [where it's used] |
| Accent (hover) | [Name] | `[hex]` | [where it's used] |
| Accent (secondary) | [Name] | `[hex]` | [where it's used] |
| Success | [Name] | `[hex]` | [where it's used] |
| Warning | [Name] | `[hex]` | [where it's used] |
| Error | [Name] | `[hex]` | [where it's used] |

---

## PART 3: TYPOGRAPHY

### Font Stack

```css
--font-display: '[Display Font]', [fallback], [generic family];
--font-body:    '[Body Font]', [fallback], [generic family];
```

**Display font:** [Font name] — [Why: what feeling it evokes, what role it plays]
**Body font:** [Font name] — [Why: readability, pairing rationale, platform availability]

---

### Type Scale

| Token | Size | Line Height | Weight | Font | Usage |
| ------- | ------ | ------------- | -------- | ------ | ------- |
| `display-xl` | [px/rem] | [ratio] | [weight] | Display | [usage — hero headline] |
| `display-lg` | [px/rem] | [ratio] | [weight] | Display | [usage — major sections] |
| `heading-1` | [px/rem] | [ratio] | [weight] | Display | [usage — page titles] |
| `heading-2` | [px/rem] | [ratio] | [weight] | Display | [usage — section headers] |
| `heading-3` | [px/rem] | [ratio] | [weight] | Display | [usage — card titles] |
| `body-lg` | [px/rem] | [ratio] | [weight] | Body | [usage — feature descriptions] |
| `body` | [px/rem] | [ratio] | [weight] | Body | [usage — standard body text] |
| `body-sm` | [px/rem] | [ratio] | [weight] | Body | [usage — secondary info] |
| `caption` | [px/rem] | [ratio] | [weight] | Body | [usage — labels, metadata] |
| `label` | [px/rem] | [ratio] | [weight] | Body | [usage — ALL-CAPS UI labels] |

### Mobile Adjustments

<!-- List only the tokens that scale down on mobile -->

- `display-xl` → [mobile size]
- `display-lg` → [mobile size]
- `heading-1` → [mobile size]

---

## PART 4: SPACING, RADIUS & SHADOWS

### Spacing Scale

Base unit: **[4px / 8px]**

| Token | Value | Usage |
| ------- | ------- | ------- |
| `space-1` | [px] | [tight gaps — icon + label] |
| `space-2` | [px] | [inline spacing] |
| `space-3` | [px] | [compact padding] |
| `space-4` | [px] | [standard padding] |
| `space-6` | [px] | [section gaps] |
| `space-8` | [px] | [between components] |
| `space-12` | [px] | [large section gaps] |
| `space-16` | [px] | [page section separation] |
| `space-20` | [px] | [hero vertical padding] |

### Border Radius

| Token | Value | Usage |
| ------- | ------- | ------- |
| `radius-sm` | [px] | [buttons, inputs, pills] |
| `radius-md` | [px] | [small cards, chips] |
| `radius-lg` | [px] | [standard cards] |
| `radius-xl` | [px] | [large cards, modals] |
| `radius-full` | 9999px | [avatars, circular elements] |

### Shadows

```css
--shadow-sm:   [definition];    /* Subtle lift — small elements */
--shadow-md:   [definition];    /* Standard card elevation */
--shadow-lg:   [definition];    /* Modal, dropdown, high emphasis */
--shadow-glow: [definition];    /* Accent color glow — use sparingly */
```

---

## PART 5: BREAKPOINTS

| Token | Value | Target |
| ------- | ------- | -------- |
| `sm` | [px] | [Large phones] |
| `md` | [px] | [Tablets] |
| `lg` | [px] | [Small laptops] |
| `xl` | [px] | [Desktops] |

**Approach:** [Mobile-first / Desktop-first] — [brief rationale based on primary user device from project-context.md]

---

## PART 6: COMPONENT CSS PATTERNS

<!-- Document the baseline CSS or framework class implementation for every recurring component.
     Anti-Gravity uses these as the default — do not invent inline styles when a pattern exists here. -->

### Primary Button

```css
.btn-primary {
  /* background: var(--accent-primary); */
  /* color: var(--text-inverse); */
  /* font-family, font-weight, font-size, padding, border-radius, transition */
}
.btn-primary:hover {
  /* background: var(--accent-hover); */
  /* box-shadow: var(--shadow-glow); */
}
```

### Secondary / Ghost Button

```css
.btn-secondary {
  /* transparent background, border using glass-border, transitions */
}
.btn-secondary:hover {
  /* subtle fill on hover */
}
```

### Card (Base)

```css
.card {
  /* background: var(--bg-surface); */
  /* border-radius, padding, border, shadow */
}
.card:hover {
  /* hover elevation or subtle scale */
}
```

### Glass Surface *(remove if not used)*

```css
.glass {
  background: var(--glass-bg);
  backdrop-filter: blur(var(--glass-blur));
  -webkit-backdrop-filter: blur(var(--glass-blur));
  border: 1px solid var(--glass-border);
  border-radius: var(--radius-lg);
}
```

### Input Field

```css
.input {
  /* background: var(--bg-surface); */
  /* border, border-radius, padding, color, font-size, transition */
}
.input:focus {
  /* border-color: var(--accent-primary); */
  /* focus ring: 0 0 0 2px rgba([accent-rgb], 0.2); */
}
```

### Modal / Overlay

```css
.modal-backdrop {
  /* background: var(--bg-overlay); */
  /* backdrop-filter: blur([px]); */
}
.modal-content {
  /* background: var(--bg-surface); */
  /* border, border-radius: var(--radius-xl), shadow */
}
```

### [Additional component — copy pattern as needed]

---

## PART 7: MOTION & ANIMATION

### Motion Scale

| Type | Duration | Easing | Usage |
| ------ | ---------- | -------- | ------- |
| **Micro** | [ms] | [easing] | [button hover, toggle, icon swap] |
| **Standard** | [ms] | [easing] | [card hover, input focus, state change] |
| **Entrance** | [ms] | [easing] | [scroll reveals, card entrance] |
| **Page** | [ms] | [easing] | [route transitions] |

### Key Presets

```js
// Fill in animation variants used in this project
const fadeInUp = {
  initial: { opacity: 0, y: 20 },
  animate: { opacity: 1, y: 0 },
  transition: { duration: [value], ease: [value] }
};

// Add additional presets as patterns are established
```

### Motion Rules

- [Rule 1 — e.g., "All element entrances use fadeInUp. Nothing snaps in instantly."]
- [Rule 2 — e.g., "Hover states use spring physics, not linear easing."]
- **Always:** respect `prefers-reduced-motion` — disable or reduce all animations when true

---

## PART 8: VISUAL TECHNIQUES (SIGNATURE DETAILS)

<!-- Document specific visual treatments that define this product's distinct look.
     These are the details that separate this product from generic UI kits. -->

1. **[Technique Name]** — [What it is and how to implement it. Example: "Film grain overlay — SVG noise texture at 3% opacity over hero sections. Adds editorial texture."]
2. **[Technique Name]** — [Description + implementation note]
3. **[Technique Name]** — [Description + implementation note]

*(Remove section if no special visual techniques apply)*

---

## PART 9: IMAGE STANDARDS

| Context | Aspect Ratio | Quality | Format | Placeholder Strategy |
| --------- | ------------- | --------- | -------- | --------------------- |
| [context — e.g., card image] | [e.g., 3:4] | [%] | [WebP/AVIF] | [blur/solid color/gradient] |
| [context — hero background] | [16:9] | [%] | [format] | [gradient fallback] |
| [context — avatar] | 1:1 | [%] | [format] | [solid bg-surface] |

*(Remove section if product has no fixed image types)*

---

## PART 10: ACCESSIBILITY MINIMUMS (NON-NEGOTIABLE)

These rules apply to every component, every screen, without exception:

- **Contrast:** Minimum 4.5:1 for body text, 3:1 for large text (WCAG AA)
- **Focus indicators:** [Define: color, width, offset — e.g., "2px solid var(--accent-primary), 2px offset"]
- **Keyboard navigation:** All interactive elements reachable and operable via keyboard
- **Images:** Meaningful `alt` text required. No filenames. No "image" as alt text.
- **Motion:** Respect `prefers-reduced-motion` — disable or reduce all animations when true
- **Touch targets:** Minimum 44×44px for all mobile tap targets
- **Color alone:** Never convey meaning through color alone — pair with text or icon

---

## CROSS-REFERENCES

| Related File | Relationship |
| --- | --- |
| `design-system.md` | Companion file — defines principles, interaction rules, state design, and behavioral standards |
| `project-context.md` | User environment (device types, network) shapes responsive and performance decisions |
| `stack-context.md` | Determines how tokens are implemented (CSS variables, Tailwind utilities, CSS-in-JS, etc.) |
| `workflow-design-ui.md` | Uses this file as the required visual input before implementing any UI component |

---

## FINAL RULE

Every color, font, spacing value, radius, shadow, and animation duration used in this product must be traceable to a token or pattern defined in this file.

If a value is not here, add it here first — then use it. Do not invent inline visual values.

When in doubt: reduce decoration, increase clarity, let content breathe.

---

## VERSION HISTORY

| Version | Date | Changes |
| --------- | ------ | --------- |
| Gold v1.0 | [Date] | Initial visual identity established at project inception |
