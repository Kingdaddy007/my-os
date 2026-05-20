---
name: storytelling
description: >
  Use this skill when crafting the narrative for a website, landing page,
  portfolio, or any brand surface. Synthesizes research into a story that
  drives copy, visuals, layout, animation, and typography. Activated when
  the user asks to "tell a story," "position a brand," "create a narrative,"
  "figure out what to say," "determine the message," "craft the copy direction,"
  "design the emotional journey," or any task where the words, visuals, and
  motion need to work together as a cohesive experience. Also activated during
  project inception (after PRODUCT.md and research exist, before DESIGN.md) to create the story
  that drives all subsequent design and animation decisions.
  Do NOT use for writing actual copy (use copywriting), editing copy (use
  copy-editing), or technical research (use research-analysis).
---

# Storytelling

Craft narratives that make brands unforgettable. Every website tells a story —
the question is whether it tells the RIGHT story, in the RIGHT way, at the
RIGHT moment.

**Design Authority:** This skill creates `contexts/story.md` — the document
that drives copy direction, visual direction, motion direction, and layout
strategy. Every other skill and workflow reads it.

---

## SECTION 1: RESEARCH

Before crafting a story, gather information. The story is only as good as
the research behind it.

### Research Sources

| Source | What It Tells You | How to Get It |
|--------|------------------|---------------|
| Existing website | What they're saying now, what works, what doesn't | Scrape the URL |
| Competitors | What others are doing, what's different | Use `skills/competitor-profiling/SKILL.md` for structured profiling. Output feeds directly into `research-brief.md` Competition Summary. |
| Client interview | What they want, how they see themselves, what success looks like | Ask directly |
| Brand materials | Existing messaging, tone, visual identity | Request from client |
| Audience | Who visits, what they care about, what persuades them | Client knowledge + research |
| Market/Industry | Trends, expectations, opportunities | Web search + industry knowledge |

### Research Questions

**About the Brand:**
- What do they do? (product/service)
- How do they want to be perceived? (aspiration)
- How are they actually perceived now? (reality)
- What makes them different? (unique value)
- What's their personality? (voice, tone, energy)
- What are their anti-references? (who they DON'T want to be like)

**About the Audience:**
- Who are they? (demographics, psychographics)
- What do they need? (functional needs)
- What do they want? (emotional needs)
- What are their objections? (why might they NOT choose this brand)
- What language do they use? (words, phrases, tone)
- What persuaded them in the past? (proof points, social proof)

**About the Competition:**
- Who are the main competitors?
- What story are they telling?
- What visual language are they using?
- What's the gap? (what's NOT being said/shown)
- What's the opportunity? (how to be different)

**About the Context:**
- Where is traffic coming from? (ads, organic, social, referral)
- What do visitors already know? (awareness level)
- What's the first impression they need? (pre-suasion)
- What action should they take? (conversion goal)

### Research Output

Create `contexts/research-brief.md` with:
- Brand summary (who, what, why, how)
- Audience summary (who, needs, wants, objections)
- Competition summary (who, what they're doing, gap)
- Key insights (what's surprising, what's the opportunity)
- Open questions (what's still unclear)

**Check the library:** During research, consult `library/matching-guide.md`
to find mechanics that fit the brand archetype. This informs which
storytelling approach and narrative structure to choose.

---

## SECTION 2: FIND THE STORY

There are multiple ways to find the right story for a brand. Don't default
to one approach — choose the one that fits the brand's nature.

### Approach 1: The Designing Principle (Truby)

Find the abstract metaphor that dictates the entire experience.

**Process:**
1. Write a one-line premise (what literally happens)
2. Extract the Designing Principle (the deeper internal logic)
3. The principle synthesizes the narrative into a single organic unit

**Example:**
- Premise: "A cybersecurity brand protects businesses from hackers"
- Designing Principle: "The fortress you build in your mind determines the security of your digital world"
- The layout must physically emulate a fortress

**Best for:** Brands with deep psychological positioning, luxury, premium services

### Approach 2: The Controlling Idea (McKee)

Define the ultimate meaning of the story as a value shift.

**Formula:**
"When [ideal customer] encounters [brand tension], pursuing [X] leads from [negative value] to [positive value]."

**Example:**
"When overwhelmed entrepreneurs encounter chaotic workflows, pursuing structured systems leads from anxiety to clarity."

**Best for:** Brands that enable transformation, SaaS, professional services

### Approach 3: The Hero's Journey (Campbell)

Map the brand story to the universal narrative pattern.

**The key reframe:** The USER is the hero, not the brand. The brand is the mentor/guide.

**Journey stages:**
1. Ordinary World — the user's current state (unmet need)
2. Call to Adventure — the brand's message
3. Refusal — user's hesitation (objections)
4. Meeting the Mentor — brand's expertise, testimonials
5. Crossing the Threshold — trying the product/service
6. Ordeal — the challenge (market confusion, doubt)
7. Reward — the brand's solution
8. Return — the user transformed

**Best for:** Brands empowering transformation, coaching, education, adventure

### Approach 4: The Vignette Structure (Calvino)

Structure the page as a gallery of metaphorical scenes.

**Process:**
1. Identify the brand's core metaphor or archetype
2. Treat each brand attribute as a "city" or scene
3. Structure as a sequence of symbolic scenes (like scrolling parallax sections)

**Example:**
- Heritage brand → "Memory City," "Desire City," "Transformation City"
- Each section is a self-contained vignette illustrating one facet of the brand

**Best for:** Heritage brands, multi-attribute brands, editorial, luxury

### Approach 5: The Visual-First Approach (Villeneuve)

Start with a striking visual concept, construct narrative to serve it.

**Process:**
1. Find the brand's most powerful visual element
2. Build the story around that image
3. Show rather than tell — let visuals carry emotion

**Example:**
- Luxury fashion → the texture of fabric, the geometry of a garment
- The narrative serves the visual, not the other way around

**Best for:** Luxury, fashion, architecture, visual-first brands

### Approach 6: The Momentum-First Approach (Miller)

Keep the story simple so action can carry it.

**Process:**
1. Strip the story to its core (one sentence)
2. Identify the single, simple pursuit
3. Design a series of obstacles the brand resolves
4. Maintain forward momentum throughout

**Example:**
- "Users are desperately driving toward [goal]. The brand clears the road."
- Each section is a new obstacle resolved by the brand's capabilities

**Best for:** High-energy, disruptive, liberation brands, product launches

### Approach 7: The Subconscious Approach (Lynch)

Don't begin with a clear outline. Record strong images and emotions.

**Process:**
1. Collect sensory details (color schemes, textures, sounds)
2. Build a sequence that starts innocently
3. Slowly reveal deeper layers
4. Trust the audience to feel rather than be told

**Best for:** Mystery, artistic, dream-like brands, experimental creative

### Choosing the Right Approach

| Brand Nature | Best Approach | Why |
|-------------|---------------|-----|
| Luxury / Premium | Designing Principle (Truby) | Deep psychological positioning |
| SaaS / Professional | Controlling Idea (McKee) | Value shift is clear |
| Coaching / Education | Hero's Journey (Campbell) | User transformation is central |
| Heritage / Editorial | Vignette Structure (Calvino) | Multiple facets to showcase |
| Fashion / Visual | Visual-First (Villeneuve) | Images carry the story |
| Disruptive / Tech | Momentum-First (Miller) | Simple story, intense action |
| Artistic / Experimental | Subconscious (Lynch) | Mood over logic |

**Check the library:** Reference `library/matching-guide.md` to see which
mechanics from the library fit this brand. The library contains 24 storytelling
mechanics extracted from literary masterworks — use them as inspiration for
the approach and narrative structure.

---

## SECTION 3: STRUCTURE THE STORY

Once you've found the story, structure it into a page.

### Narrative Arcs

Choose the arc that fits the page type:

**The Brand Story (Landing Page)**
```
Hook → Story → Proof → Action
```

**The Product Journey (Product Page)**
```
Problem → Solution → Features → Proof → Action
```

**The Portfolio Story (Portfolio/Case Study)**
```
Introduction → Work → Process → Contact
```

**The Consultant's Authority (Professional Services)**
```
Authority → Process → Results → Action
```

**The Restaurant Experience (Hospitality)**
```
Atmosphere → Menu → Experience → Reservation
```

**The Transformation Story (Coaching/Wellness)**
```
Current State → Transformation → Proof → Action
```

**The Hero's Journey (Any Brand)**
```
Ordinary World → Call to Adventure → Refusal → Mentor → Threshold → Ordeal → Reward → Return
```

### Form Selection

Choose the form that fits the brand's nature:

| Form | Description | Best For |
|------|-------------|----------|
| **Journey** | Linear scroll, each section is a step forward | Product launches, transformation stories, campaigns |
| **Room/World** | Explorable environment, spatial navigation | 3D showcases, immersive experiences, luxury |
| **Gallery** | Modular sections, each a self-contained story | Portfolios, case studies, user-generated content |
| **Universe** | Multiple visual styles within one brand | Multi-audience brands, diverse product lines |

### Section Breakdown

For each section on the page, define:
- **Purpose:** why this section exists in the story
- **Headline direction:** what to say
- **Body direction:** what to communicate
- **Visual direction:** what to show
- **Layout direction:** how it's structured
- **Animation direction:** how it moves
- **Emotion:** what to feel at this moment

**Check the library:** Reference `library/mechanics/` for specific storytelling
mechanics that fit each section. Each mechanic file contains web translation
specs (hero layout, 3D behavior, scroll pacing, micro-copy) that can inspire
the section design.

---

## SECTION 4: MAP THE EMOTIONS

The narrative arc determines WHAT happens. The emotional mechanics determine
HOW it feels.

### Emotional Modes (Maass)

Three modes for generating emotion:

**Inner Mode:** What the user thinks and feels internally.
- Use internal narration, reflective copy, contemplative pacing
- Example: "You've tried everything. Maybe it's time for something different."

**Outer Mode:** What the user sees and experiences.
- Use behavior, situations, visual storytelling
- Example: Show the transformation through before/after imagery

**Other Mode:** Direct conversation with the user's own experience.
- Use "you" language, acknowledge their reality, mirror their feelings
- Example: "You know that feeling when everything just clicks?"

### Emotional Arcs by Archetype

| Archetype | Hook Emotion | Build Emotion | Climax Emotion | Resolve Emotion |
|-----------|-------------|---------------|----------------|-----------------|
| Luxury | Desire, aspiration | Exclusivity, belonging | Satisfaction, pride | Confidence, trust |
| Tech | Curiosity, excitement | Innovation, possibility | Awe, empowerment | Confidence, action |
| Restaurant | Craving, warmth | Anticipation, sensory | Satisfaction, delight | Comfort, belonging |
| Consultant | Trust, authority | Competence, reliability | Confidence, relief | Action, partnership |
| Creative | Curiosity, intrigue | Surprise, delight | Awe, inspiration | Action, connection |
| Wellness | Empathy, understanding | Hope, possibility | Transformation, relief | Trust, action |

### Emotional Anchoring

Each section should target ONE core feeling:

| Section | Core Feeling | How to Achieve It |
|---------|-------------|-------------------|
| Hook | Curiosity or desire | Bold statement, provocative question, striking image |
| Build | Trust or understanding | Evidence, process, expertise |
| Climax | Awe or transformation | Strongest visual, most impactful animation |
| Resolve | Confidence or action | Social proof, clear CTA, gentle easing |

### Pacing

**Fast pacing** (tech, gaming, entertainment):
- Short sections, quick transitions
- High density, multiple triggers
- Snappy easing, elastic/bounce

**Slow pacing** (luxury, wellness, restaurant):
- Long sections, deliberate transitions
- Low density, breathing room
- Smooth easing, gentle reveals

**Variable pacing** (creative, agency, fashion):
- Alternating fast and slow sections
- Surprise transitions, unexpected moments
- Mix of easing curves

---

## SECTION 5: DESIGN THE EXPERIENCE

The story is told through three channels working together:
- **Copy** — what you say
- **Visuals** — what you show
- **Animation** — how it moves

### Integration Matrix

For each section, define:

| Section | Copy Says | Visual Shows | Animation Does |
|---------|----------|-------------|----------------|
| Hook | Bold headline, provocative question | Hero image, brand visual | SplitText reveal, slow parallax |
| Build | Supporting copy, benefits, features | Product images, lifestyle photos | Fade-in on scroll, gentle parallax |
| Climax | The payoff, the transformation | Product close-up, result image | Mask expansion, video scrub, 3D reveal |
| Resolve | Social proof, CTA | Testimonials, team photos | Bento grid stagger, infinite slider |

### Proof Mechanisms

Different audiences need different types of proof:

| Proof Type | What It Is | Best For |
|-----------|-----------|----------|
| Visual proof | User photos, case studies, before/after | Lifestyle, wellness, fashion |
| Data proof | Numbers, statistics, metrics | SaaS, professional services, fintech |
| Social proof | Testimonials, community, press logos | All brands — the fundamental trust builder |
| Experiential proof | Free trial, demo, interactive preview | SaaS, products, services |
| Authority proof | Awards, certifications, endorsements | Professional services, luxury |

### Trust Techniques

From the master storytellers:

| Source | Technique | How to Apply |
|--------|-----------|-------------|
| McKee | Internal coherence | The story must obey its own logic — events feel necessary, not contrived |
| Maass | Emotional honesty | Allow contradictory, unflattering feelings — signal that the brand understands real life |
| Wong Kar-wai | Rigorous restraint | Consistently refuse cheap payoffs — respect the audience's intelligence |
| Spider-Verse | Full commitment | Fully commit to the bold stylistic premise — no fallback to generic |
| Apple | User as protagonist | Hand the microphone to users — let real people tell the story |
| Miller | Assured direction | Throw the user into the experience immediately — trust they'll catch on |
| Calvino | Consistency of tone | Reliable structure, earned trust through pattern |

### Advanced Techniques

**Crosshair Framing (Miller):**
Primary content dead center in every frame. When the next element appears,
it's in the exact same spatial coordinates. Reduces cognitive load to zero.
In web terms: critical content always centered, transitions pull content
into the focal zone.

**Temporal Starvation (Villeneuve):**
Deliberately withhold information to induce "leaning in." Hold shots to
the point of discomfort. In web terms: don't show everything at once.
Force the user to scroll deeper, hover longer, explore more.

**Almost-Moments (Wong Kar-wai):**
Encounters that nearly cross a line — tension through restraint and what's
NOT said. In web terms: partial reveals, content that's almost visible but
not quite, hover states that tease but don't deliver.

**Stylistic Multiplicity (Spider-Verse):**
Different visual styles for different audience segments within one brand
universe. Each segment gets its own visual grammar but shares compositional
logic. In web terms: different sections can have different visual treatments
but maintain brand coherence.

**User-Generated Authenticity (Apple):**
Customers as protagonists, brand as enabler. The brand doesn't tell its
own story — it amplifies its customers' stories. In web terms: hero sections
featuring real customer outputs, minimal brand copy, gallery layouts.

**Negative Empathy (Capote):**
Simultaneously mourning the victim and analyzing the perpetrator. Forces
the audience into a distressing psychological state where they hold two
contradictory emotions. In web terms: juxtapose the problem (what the user
is losing) with the solution (what they could gain) in the same section.

**Progressive Complications (McKee):**
Each new event must increase risk, cost, or stakes — never retreat to a
lesser magnitude. In web terms: each section should escalate the emotional
stakes, not just repeat the same message.

**Three Levels of Conflict (McKee):**
Invest the audience from multiple angles:
- Inner: self-doubt, internal struggle
- Personal: relationships, social pressure
- Extra-personal: market forces, competition
In web terms: address all three levels in the story — the user's internal
doubts, their social context, and the external market challenges.

### Emotional Mode → Web Translation

| Emotional Mode | Web Translation |
|---------------|-----------------|
| Epic & Grand | WebGL environments, extreme Z-axis depth, massive typography |
| Intimate & Personal | High whitespace, slow scrolling, muted warm palettes |
| Atmospheric & Immersive | Scroll-triggered opacity, Web Audio API, heavy blur filters |
| Fast & Urgent | Crosshair framing (content centered), snap-scrolling, LCP < 1.0s |
| Deeply Mysterious | Non-linear navigation, hidden elements, fragmented DOM |
| Emotionally Transformative | Heavy parallax, split-screen layouts, scroll-tied audio |
| Structurally Bold | Horizontal rail-scrolling, cursor-tied DOM, brutalist grids |

### Four Translation Vectors

When translating story into interface, manage four vectors:

1. **Spatial layout** — safe (locked grids, predictable snapping) vs exposed (broken grid, overlapping elements)
2. **Temporal pacing** — inevitable (smooth, linear, unstoppable scroll) vs thoughtful (high friction, significant effort)
3. **Visual eye trace** — urgent (centered content) vs exploratory (content at edges, forcing wandering)
4. **Technical execution** — performance = trust. Latency shatters immersion instantly.

### Copy Direction

The storytelling skill doesn't write copy — that's the copywriting skill's job.
But it defines the DIRECTION:

- **Headline strategy:** What's the one thing the headline should say?
- **Section themes:** What's the theme of each section?
- **Tone:** How should the copy sound? (confident, warm, playful, authoritative)
- **Key messages:** What are the 3-5 messages that must come through?
- **CTA strategy:** What action, what urgency, what framing?

### Visual Direction

- **Hero visual:** What should the first image be? (product, lifestyle, abstract)
- **Image style:** What mood? (warm, cool, editorial, lifestyle, product-focused)
- **Color mood:** What feeling? (luxury = warm neutrals, tech = cool contrast)
- **Typography voice:** What personality? (serif = editorial, sans = modern, display = bold)
- **Layout rhythm:** What pacing? (sparse = luxury, dense = tech, alternating = creative)

### Motion Direction

- **Hero animation:** What pattern? (SplitText, video scrub, 3D reveal)
- **Scroll behavior:** What rhythm? (gentle parallax, fast scrubbing, pinned sections)
- **Climax pattern:** What's the peak moment? (mask expansion, interface scatter, 3D showcase)
- **Resolve pattern:** What eases the user down? (bento grid, infinite slider, fade-in)
- **Easing personality:** What feel? (expo.out = dramatic, power1.inOut = warm, power2.out = snappy)

**Note:** This section defines motion DIRECTION (the WHY — emotional intent, narrative rhythm, what each act should feel like).
For motion EXECUTION details (specific GSAP patterns, easing values, scroll timelines, asset requirements),
see `contexts/motion-direction.md` which is created by workflow-visual-brainstorm Phase 3C.

**Check the library:** Reference `library/motion-personalities.md` for the
7 motion personalities (brutal, glacial, mechanical, stuttered, liquid,
surgical, jittery) with GSAP/Framer Motion/CSS specs. Reference
`library/density-levels.md` for the 3 density levels (minimal, moderate,
maximalist) with grid/spacing/typography specs.

---

## SECTION 6: BRAND ARCHETYPE STORYTELLING

Different brands tell stories differently. The archetype determines the
storytelling style, not just the motion vocabulary.

### The "Who Is the Hero?" Reframe

The USER is the hero, not the brand. The brand is the mentor, the guide,
the tool that helps the hero succeed.

- The user has a quest (their goal)
- The user faces obstacles (their challenges)
- The brand is the mentor (provides tools, wisdom, support)
- The user succeeds (transformation)

### Luxury / Editorial

**Story style:** Aspirational, exclusive, editorial
**Narrative voice:** Confident, understated, authoritative
**What to emphasize:** Craftsmanship, heritage, exclusivity, quality
**What to avoid:** Aggressive CTAs, too much text, busy layouts

**Example story:**
> "Your skin deserves better than mass-produced formulas."
> "We spent 3 years sourcing the finest ingredients from 12 countries."
> "The result: skin that looks like it's been touched by light."

### Tech / Startup

**Story style:** Innovative, disruptive, forward-looking
**Narrative voice:** Confident, energetic, clear
**What to emphasize:** Innovation, speed, results, the future
**What to avoid:** Jargon, vague claims, slow pacing

**Example story:**
> "Analytics shouldn't take 3 hours."
> "Our AI processes 10M data points in 2 seconds."
> "See insights you've never seen before."

### Restaurant / Hospitality

**Story style:** Sensory, warm, inviting
**Narrative voice:** Warm, descriptive, personal
**What to emphasize:** Atmosphere, ingredients, experience, community
**What to avoid:** Corporate language, generic descriptions, cold visuals

**Example story:**
> "The kind of place where the pasta is made fresh and the wine flows freely."
> "Our grandmother's recipe, perfected over 40 years."
> "Come hungry, leave happy."

### Consultant / Professional Services

**Story style:** Trustworthy, authoritative, results-driven
**Narrative voice:** Professional, clear, confident
**What to emphasize:** Expertise, process, results, trust
**What to avoid:** Hype, vague promises, aggressive sales language

**Example story:**
> "We've helped 200+ companies scale from $1M to $10M."
> "Our 4-step process has a 94% success rate."
> "Book a 15-minute call. No pitch, just clarity."

### Creative / Agency

**Story style:** Bold, unexpected, memorable
**Narrative voice:** Confident, playful, provocative
**What to emphasize:** Creativity, results, personality, differentiation
**What to avoid:** Generic portfolio language, safe choices, boring layouts

**Example story:**
> "We don't make websites. We make statements."
> "Your competitors are boring. You don't have to be."
> "Let's make something people talk about."

### Wellness / Coaching

**Story style:** Empathetic, transformational, hopeful
**Narrative voice:** Warm, understanding, encouraging
**What to emphasize:** Transformation, journey, results, support
**What to avoid:** Pushy sales, unrealistic promises, clinical language

**Example story:**
> "You've tried everything. Maybe it's time for something different."
> "10,000 women have made the change. You're next."
> "Start where you are. We'll meet you there."

---

## SECTION 7: STORY DOCUMENT

The output of this skill is `contexts/story.md` — the document that drives
all subsequent design and animation decisions.

### Story Document Structure

```markdown
# STORY: [BRAND NAME]

## The One Thing
[One sentence: what's the ONE message that must come through?]

## The Controlling Idea
"When [ideal customer] encounters [brand tension], pursuing [X] leads from
[negative value] to [positive value]."

## The Designing Principle
[The abstract metaphor that dictates the entire experience]

## Who Is the Hero?
[The user — what's their quest? what obstacles do they face? how does the
brand serve as mentor/guide?]

## Storytelling Approach
[Which approach? Truby, McKee, Campbell, Calvino, Villeneuve, Miller, Lynch]

## Narrative Arc
[Which arc? Brand Story, Product Journey, Portfolio Story, Hero's Journey, etc.]

## Form
[Journey, Room/World, Gallery, or Universe]

## Page Type
[What kind of page? Landing page, portfolio, services, about, product, etc.]

## Section Breakdown

For each section on the page:

### [Section Name]
- **Purpose:** [why this section exists in the story]
- **Headline direction:** [what to say]
- **Body direction:** [what to communicate]
- **Visual direction:** [what to show]
- **Layout direction:** [how it's structured]
- **Animation direction:** [how it moves]
- **Emotion:** [what to feel — one core feeling per section]
- **Proof mechanism:** [what type of proof — visual, data, social, experiential, authority]

[... repeat for each section on the page ...]

### Footer
- **Purpose:** navigation, legal, contact
- **Content:** links, social, copyright
- **Animation:** usually none — static

## Copy Direction
- **Headline strategy:** [what the headline should say]
- **Tone:** [how the copy should sound]
- **Key messages:** [3-5 messages that must come through]
- **CTA strategy:** [what action, what urgency]

## Visual Direction
- **Hero visual:** [what should the first image be]
- **Image style:** [what mood]
- **Color mood:** [what feeling]
- **Typography voice:** [what personality]
- **Layout rhythm:** [what pacing]

## Motion Direction
- **Hero animation:** [what pattern]
- **Scroll behavior:** [what rhythm]
- **Climax pattern:** [the peak moment]
- **Resolve pattern:** [what eases down]
- **Easing personality:** [what feel]

## Brand Archetype
[Which archetype? What storytelling style?]

## Emotional Journey
[Section 1 emotion → Section 2 emotion → ... → Final emotion]

## Trust Strategy
[Which trust techniques? Internal coherence, emotional honesty, restraint,
full commitment, user as protagonist, assured direction, consistency of tone]
```

---

## SECTION 8: ITERATION PROCESS

Storytelling is not one-shot. It's iterative.

### Step 0: Create Research Brief (Entry Requirement)

Before presenting any story directions, create `contexts/research-brief.md`:
- Brand summary (who, what, why, how)
- Audience summary (who, needs, wants, objections)
- Competition summary (reference `competitor-profiles/_summary.md` if it exists)
- Key insights and open questions

**Gate:** Do NOT present story directions until `contexts/research-brief.md` exists and is approved.

### Step 1: Present Directions

Based on the research, present 2-3 story directions:

```
Direction A: [name]
- Approach: [Truby/McKee/Campbell/etc.]
- Controlling Idea: [value shift]
- Emotional mode: [inner/outer/other]
- Form: [journey/room/gallery/universe]
- Why this works: [reasoning]

Direction B: [name]
- Approach: [different approach]
- Controlling Idea: [different value shift]
- Emotional mode: [different mode]
- Form: [different form]
- Why this works: [reasoning]

Direction C: [name]
- Approach: [another approach]
- Controlling Idea: [another value shift]
- Emotional mode: [another mode]
- Form: [another form]
- Why this works: [reasoning]
```

### Step 2: Get Feedback

Ask:
- Which direction resonates most?
- What feels right about it?
- What feels wrong?
- Any elements from other directions to blend?

### Step 3: Refine

Based on feedback, refine the chosen direction.

### Step 4: Present Refined Story

Show the refined story with the full story document structure.

### Step 5: Get Approval

Ask: "Does this story feel right? Any adjustments before we move to design?"

### Step 6: Lock the Story

Write `contexts/story.md`. This is now the source of truth for all
subsequent design and animation decisions.

---

## REFERENCES

These files inform the storytelling decisions:

| Reference | What It Provides | When to Consult |
|-----------|-----------------|-----------------|
| `brand.md` | Brand voice, font selection, color strategies, imagery | When defining copy direction and visual direction |
| `product.md` | Product register, product bans, system fonts | When the project is a product surface |
| `skill-cinematic-motion` Section 1 | Brand-to-motion matrix, diagnostic walkthrough | When defining motion direction |
| `competitor-profiling` | Competitor analysis | When researching the competition |
| `copywriting` | Copy frameworks, writing principles | When the story needs to become actual copy |

### Storytelling Library

The library is a curated collection of 24 storytelling mechanics extracted
from literary masterworks and translated into web design specifications.

**Location:** `skills/storytelling/library/`

| File | What It Contains |
|------|-----------------|
| `index.md` | Overview, quick reference, 24-mechanic index |
| `matching-guide.md` | 10 brand archetypes → relevant mechanics |
| `motion-personalities.md` | 7 personalities (brutal, glacial, mechanical, stuttered, liquid, surgical, jittery) with GSAP/Framer/CSS specs |
| `density-levels.md` | 3 levels (minimal, moderate, maximalist) |
| `psychological-levers.md` | 8 levers with web translations |
| `mechanics/` | 24 individual mechanic files with full web translation specs |

**When to consult the library:**
- During Research — check matching guide for mechanics that fit the brand archetype
- During Story — reference mechanics for narrative structures and emotional journeys
- During Visual Brainstorm — reference motion personalities and build specs

---

## ANTI-PATTERNS

| Storytelling Anti-Pattern | What's Wrong | What to Do Instead |
|--------------------------|-------------|-------------------|
| Starting with design before the story | Design without direction is decoration | Define the story first, then design serves it |
| Generic headlines ("Welcome to our website") | Says nothing, wastes the most important real estate | Lead with the one thing — the bold claim, the question, the promise |
| Every section says the same thing | No narrative arc, no progression | Each section should advance the story |
| Proof without setup | Testimonials without context feel random | Build credibility before showing proof |
| CTA without emotional build | "Subscribe" after a boring page doesn't convert | Build desire before asking for action |
| Copy that sounds like every other brand | Generic, forgettable | Use the brand's unique voice, not templates |
| Visual direction that doesn't match the story | Disconnect between words and images | Visuals should reinforce, not contradict, the story |
| Animation that doesn't serve the narrative | Decorative, distracting | Every animation should heighten the emotional beat |
| One-shot storytelling | No iteration, no feedback | Present options, get feedback, refine, lock |
| Brand as hero | The brand is the protagonist, not the user | The USER is the hero, the brand is the mentor |
| One approach for all brands | Same narrative structure every time | Choose the approach that fits the brand's nature |

---

## NON-NEGOTIABLE CHECKLIST

- [ ] Research completed (brand, audience, competition, context)
- [ ] Storytelling approach chosen (Truby, McKee, Campbell, Calvino, Villeneuve, Miller, Lynch)
- [ ] Controlling idea defined (value shift formula)
- [ ] "Who is the hero?" answered (user is hero, brand is mentor)
- [ ] Narrative arc chosen (Brand Story, Product Journey, Hero's Journey, etc.)
- [ ] Form selected (Journey, Room/World, Gallery, Universe)
- [ ] Emotional mode chosen (inner, outer, other)
- [ ] Emotional anchoring applied (one core feeling per section)
- [ ] Proof mechanisms identified (visual, data, social, experiential, authority)
- [ ] Trust techniques selected (from master storytellers)
- [ ] Copy direction defined (headline strategy, tone, key messages, CTA)
- [ ] Visual direction defined (hero visual, image style, color mood, typography voice)
- [ ] Motion direction defined (hero animation, scroll behavior, climax pattern)
- [ ] Brand archetype identified (storytelling style determined)
- [ ] Story document created (contexts/story.md)
- [ ] 2-3 directions presented before choosing
- [ ] User approved the story before moving to design
- [ ] Story locked before visual brainstorm begins
