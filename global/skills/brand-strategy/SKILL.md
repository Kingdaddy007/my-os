---
name: brand-strategy
description: >
  Use this skill when analyzing a brand's positioning, auditing an existing website's brand communication, identifying mismatches between brand intent and visual/copy execution, or defining the brand strategy for a new business from scratch. Activated when the user asks to "audit the brand", "diagnose the brand's positioning", "align copy and visuals to the brand", "define the brand perception", "what phase is this brand in", or "how does the brand extend to visuals and animations".
  Do NOT use for writing actual copy (use copywriting), editing copy (use copy-editing), or configuring animations without brand direction (use cinematic-motion).
---

# Brand Strategy & Diagnostics

Assess the alignment, positioning, and perception of a brand, translating strategic positioning directly into art direction, copywriting guidelines, and motion design constraints.

---

## WHEN TO USE THIS

*   **Auditing an existing website's brand identity, positioning, or communication quality.**
*   **Designing a brand strategy from scratch for a new business, service, or product.**
*   **Resolving misalignment between a brand's stated core values and its visual (images, styling) or motion (animations, quality) execution.**
*   **Determining a brand's strategic phase (Launch, Shift, Scale, Defense) and matching positioning archetype.**

## NEVER DO

*   **Confuse brand strategy with writing copy** — keep strategic direction separate from copywriting execution.
*   **Define visual styles or fonts arbitrarily** without anchor reasoning from the brand identity.
*   **Recommend generic positioning (e.g., "high quality, affordable")** — brand positioning must be highly differentiated.
*   **Ignore the brand's lifecycle stage** — do not apply enterprise Defense phase strategy to a startup in the Launch phase.
*   **Treat brand as static** — always diagnose the target audience tension and brand perception shifts.

---

## SECTION 1: THE BRAND DIAGNOSTIC AUDIT

Use this phase to diagnose what is wrong with the brand's current communication, layout, and visual execution.

### The Alignment Audit
Run a diagnostic check on three vectors:
1.  **Intent vs. Perception:** What the brand thinks it is saying vs. what a first-time user actually understands.
2.  **Copy vs. Visuals:** Whether the visual style (contrast, color, photography) supports or contradicts the copy tone (e.g., a warm, human-centric tone paired with cold, generic stock graphics is an alignment failure).
3.  **Core vs. Motion/Quality:** Whether page transitions, animations, and micro-interactions reflect the brand register (e.g., playful spring eases on a serious, authoritative medical landing page).

### The Brand Lifecycle Phase
Identify the client's current phase and adjust the strategic priorities:

| Lifecycle Phase | Focus | Copy Strategy | Visual Strategy |
| :--- | :--- | :--- | :--- |
| **Launch** | Category validation & education | Simple problem-solution, high curiosity hooks | Simple, high-impact hero image, clear diagrams |
| **Shift / Pivot** | Overcoming legacy bias | Addressing objections directly, clarifying new value | Modern refresh, structural contrast |
| **Scale** | Trust & authority consolidation | Heavy data proof, social proof, case studies | Bento grids, structured sections, team profiles |
| **Defense** | Status, prestige & ecosystem | Heritage, philosophy, unhurried narratives | High whitespace, editorial layouts, custom assets |

---

## SECTION 2: POSITIONING & PERCEPTION STRATEGY

### Positioning Archetypes
Diagnose and select the dominant positioning strategy:

1.  **Category Creator:** Defining a new way of working or living. Focus on name-creation, paradigm shift, and workflow education.
2.  **Status Premium:** High-end, prestige, craftsmanship. Focus on restraint, scarcity, high whitespace, and heritage.
3.  **Utility Leader:** Frictionless execution, speed, scale. Focus on efficiency metrics, ease of setup, and visual transparency.
4.  **Rebel / Disruptor:** Challenging the established player. Focus on high energy, bold claims, high-contrast layouts, and community-centric proof.

### The Perceptual Shift
Map the brand's target shift using this structure:
*   **Current State / Friction:** What is the user's primary objection or current negative state? (e.g., "Medical centers feel cold and rushed.")
*   **Target Perception:** What is the desired feeling after visiting the site? (e.g., "I feel heard, safe, and personally known.")
*   **Strategic Vector:** How do copy, visuals, and motion work together to drive this shift?

---

## SECTION 3: TRANSLATING STRATEGY TO EXECUTION

### Visual & Imagery Art Direction
Define the guidelines for physical and graphic assets:
*   **Zero Images is a Bug:** If the brand depends on physical sensations (food, wellness, luxury, lifestyle), images must be present.
*   **Image Style Guidelines:** Specify colors, lighting (e.g., warm natural light vs. high-contrast studio), composition (e.g., zoomed close-ups of ingredients vs. abstract vector illustrations), and what to reject.
*   **Typography Voice:** Map the brand register to specific typeface styles (e.g., Display Serif for legacy and prestige, Humanist Sans for accessibility, Geometric Sans for technical authority).

### Motion & Quality constraints
Define the motion constraints that keep animations aligned with the brand:
*   **Calm/Premium Brands:** Smooth exponential curves (`expo.out`), slow pacing (600-1000ms), high whitespace, subtle reveals. No bounce or snappy spring easing.
*   **Tech/Disruptive Brands:** Snappy curves (`power2.out`), fast pacing (200-400ms), high grid structure (bento grid reveals), dynamic triggers.
*   **Restraint Guide:** Identify elements that must remain static (e.g., primary navigation, forms, data tables) to maintain interaction quality.

---

## OUTPUT SHAPE

When this skill is active, generate `contexts/brand-strategy.md` in the following format:

```markdown
# Brand Strategy: [Brand Name]

## 1. Brand Diagnosis
*   **Lifecycle Phase:** [Launch, Shift, Scale, Defense]
*   **Core Friction:** [What is currently wrong with the brand's perception or communication?]
*   **The Paradigm Tension:** [Rushed vs. Unhurried, Complicated vs. Simple, Corporate vs. Personal]

## 2. Positioning & Perception
*   **Dominant Archetype:** [Category Creator, Status Premium, Utility Leader, Rebel]
*   **Perceptual Shift:**
    *   *From:* [Current user objection / state]
    *   *To:* [Target user feeling / belief]
*   **Value Proposition Reframed:** [How the brand operates as a guide/mentor, not just a hero]

## 3. Execution Blueprint
### Visual Art Direction
*   **Tonal Palettes & Color Mood:** [Semantic color description]
*   **Photography/Illustration Style:** [Concrete directions on composition, lighting, and subjects]
*   **Typography Voice:** [Specific font styles and layout pacing]

### Motion & Quality Constraints
*   **Motion Vocabulary:** [Pacing, Easing selection, Density level]
*   **Cinematic Opportunities:** [Act 1-4 scroll-storytelling ideas]
*   **Restraint Rules:** [What NOT to animate]
```

---

## NON-NEGOTIABLE CHECKLIST

1.  **Audit the gaps first** — identify what is currently broken or inconsistent on the existing page before writing recommendations.
2.  **Define a hybrid archetype if necessary** — specify primary and secondary brand archetypes and resolve conflicts in favor of the primary.
3.  **Avoid generic positioning suggestions** — ensure the proposed strategy makes the brand unique and defensible.
4.  **Connect strategy directly to styling/motion** — ensure every art direction rule is paired with concrete guidelines for typography, imagery, and animation properties.
5.  **Reframe the brand as guide/mentor** — ensure the copy direction places the customer as the protagonist.
