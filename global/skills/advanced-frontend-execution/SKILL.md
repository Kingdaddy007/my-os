---
name: HIGH-FIDELITY FRONTEND EXECUTION
description: Advanced principles for Framer Motion, layout integrity, and "award-winning" UI Polish derived from Phase 4 Audits.
---

# HIGH-FIDELITY FRONTEND EXECUTION

This skill documents the advanced execution standards required to move from "working UI" to "award-level UI", specifically addressing the gaps identified during the GlamGo Phase 4 Audit.

When building high-fidelity web experiences involving scroll-linked animations, 3D CSS, and Framer Motion, **always apply the following principles:**

## 1. Framer Motion Performance & Memory Management

- **Never run infinite intervals off-screen:** If using `setInterval` for crossfading images or carousels, you MUST pause it when the element is out of view to prevent CPU/memory leaks.
  - *Implementation:* Use `useMotionValueEvent(scrollYProgress, 'change', ...)` to track visibility and clear the interval when outside the active `< 0.95` range.
- **Explicit Variant Typing:** Always type Framer Motion variants using `const variants: Variants = {...}`. This catches invalid CSS properties (like invalid `ease` strings) at compile time instead of failing silently or crashing at runtime.

## 2. Layout & Clipping Integrity (The "Portal" Effect)

- **Beware `overflow: hidden` on complex hero sections:** When attempting a "zoom mask" or portal effect where an image scales up to swallow the camera (`scale: 7` etc), the parent container must NOT clip the overflow.
- *Implementation:* The section container can have `overflow: clip`, but the `position: sticky` wrapper inside it MUST use `overflow: visible`. Otherwise, the scaling element will be clipped to the screen edges, breaking the illusion.

## 3. SVG Animation & Grid Isolation

- **Do not mix absolute SVGs with CSS Grid children:** If implementing an animated SVG path that connects grid items (like a timeline or booking flow), put the `<svg>` in a wrapper that is absolutely positioned *outside* the `display: grid` container.
- *Why:* Mixing absolute elements inside a grid container counts them as DOM children, which breaks structural selectors like `:nth-child(odd)` or `:nth-child(even)` for the actual cards.
- **Dramatic Paths:** A straight SVG line is boring. Use cubic beziers (`C`) stretching from `x=10` to `x=90` to create dramatic, organic "snaking" paths that feel bespoke.

## 4. 3D CSS Perspectives (Coverflow)

- For horizontal scrolling galleries, standard translation is insufficient for premium tier. Use 3D Coverflow.
- *Implementation:*
  1. Parent wrapper: `perspective: 1200px`
  2. Scrolling track: `transform-style: preserve-3d`
  3. Cards: Calculate distance from center based on index. Multiply offset by degrees (e.g., `offset * 8deg`) to set `rotateY`, and push back on the Z-axis (`z: -Math.abs(offset) * 20`).
  4. Ensure cards reset to `rotateY: 0` and `z: 50` on hover.

## 5. Architectural Polish & Accessibility

- **Global Reduced Motion:** ALWAYS include a global media query for `@media (prefers-reduced-motion: reduce)` that forces `animation-duration: 0.01ms !important` and `scroll-behavior: auto`.
- **Film Grain Overlays:** For premium dark aesthetics, implement film grain as an SVG `<feTurbulence>` filter applied via a Base64 data URI in a `::after` pseudo-element on the body, with `opacity: 0.03` and `pointer-events: none`.
- **Typographic Contrast:** Avoid using Display (Serif) fonts for long-form paragraph text, even in "story" sections. Use Body (Sans-serif) fonts for paragraphs to maintain readability.
