# Anti-Gravity OS — Setup Guide

**Version:** Gold v1.1
**Status:** AI-READABLE SETUP DOCUMENT — Read this first before doing anything else
**Purpose:** Complete installation and configuration instructions for Anti-Gravity OS

---

## WHAT IS THIS?

Anti-Gravity OS is a structured AI engineering system — a set of skills, workflows, contexts,
templates, rubrics, and memory files that transform any AI coding assistant into a disciplined,
high-performance engineering partner.

It has two layers:

| Layer | What it is | Where it goes |
| :--- | :--- | :--- |
| **Workspace Layer** | Project-specific config, rules, and shortcuts | Inside your project repo |
| **Global Layer** | Shared brain: skills, workflows, contexts, rubrics | `~/.gemini/antigravity/` (or IDE-equivalent) |

---

## QUICK START (AI Instructions)

> If you are an AI assistant reading this file, follow these steps in order.

### Step 1 — Ask the user

Say exactly this to the user:

```
Welcome to Anti-Gravity OS! I can see the setup guide. I have two questions before I begin:

1. Do you want to install the WORKSPACE layer only (project config, rules, slash-command workflows)?
   Or do you ALSO want the GLOBAL layer (skills, contexts, rubrics — the full AI brain)?

2. What is the path to your IDE's global config folder?
   Common defaults:
   - Gemini (Google Antigravity): C:\Users\<YourName>\.gemini\
   - Cursor:                      C:\Users\<YourName>\.cursor\rules\
   - Windsurf:                    C:\Users\<YourName>\.codeium\windsurf\memories\
   - VS Code (Copilot):           Workspace .github/copilot-instructions.md
   - Cline / Roo / Claude Code:   Workspace .clinerules or .cursorrules
   - Codex:                       C:\Users\<YourName>\.codex\
   - OpenCode:                    C:\Users\<YourName>\.config\opencode\

   If unsure, just tell me your IDE name and I'll figure it out.
```

### Step 2 — Run the installer

Once the user answers, run the setup script:

**On Windows (PowerShell):**
```powershell
.\install.ps1
```

**On Mac/Linux (Bash):**
```bash
chmod +x install.sh && ./install.sh
```

The script will:
- Copy workspace files to the correct locations in this project
- Optionally copy global files to the user's IDE global config folder
- Print a summary of everything it installed

### Step 3 — Verify

After installation, confirm:
- [ ] `.agents/rules.md` exists in the workspace root
- [ ] `.agents/workflows/` contains all `.md` workflow files
- [ ] `GEMINI.md` or equivalent master prompt is in place
- [ ] Skills are accessible to the AI (global config folder)

---

## DETAILED FOLDER MAP

### Workspace Layer (goes inside this project)

```
your-project/
├── .agents/
│   ├── rules.md                  ← AI reads this for project-specific rules
│   └── workflows/                ← Slash-command workflows (/ menu in IDE)
│       ├── workflow-build-feature.md
│       ├── workflow-debug-issue.md
│       ├── workflow-design-api.md
│       ├── workflow-design-ui.md
│       ├── workflow-optimize-performance.md
│       ├── workflow-plan-architecture.md
│       ├── workflow-project-inception.md
│       ├── workflow-refactor-module.md
│       ├── workflow-review-code.md
│       ├── workflow-security-audit.md
│       └── workflow-ship-to-production.md
```

> **Why `.agents/`?** Most IDE AI tools (Gemini, Cursor, Windsurf, Copilot) auto-scan for
> agent config in `.agents/`, `.github/`, or the workspace root. Placing workflows here
> makes them available via the `/` slash command picker in supported IDEs.

### Global Layer (goes in your IDE's global config folder)

```
~/.gemini/antigravity/          ← (adjust path for your IDE)
├── GEMINI.md                   ← Master system prompt (AI identity & boot sequence)
├── GLOBAL_MEMORY.md            ← System map (tells AI where everything lives)
├── core/                       ← Permanent AI brain (9 principle files)
│   ├── activation-engine.md
│   ├── anti-gravity-core.md
│   ├── communication-standards.md
│   ├── conflict-resolution.md
│   ├── execution-workflow.md
│   ├── expert-cognitive-patterns.md
│   ├── operating-modes.md
│   ├── quality-bar.md
│   └── system-thinking.md
├── skills/                     ← Domain expertise (AI reads before each task)
│   ├── coding/SKILL.md
│   ├── architecture/SKILL.md
│   ├── debugging/SKILL.md
│   ├── ui-ux/SKILL.md
│   ├── testing/SKILL.md
│   ├── security/SKILL.md
│   ├── devops-infra/SKILL.md
│   ├── performance/SKILL.md
│   ├── database/SKILL.md
│   ├── api-design/SKILL.md
│   ├── refactoring/SKILL.md
│   ├── product-thinking/SKILL.md
│   ├── review-audit/SKILL.md
│   ├── research-analysis/SKILL.md
│   └── visual-brainstorming/SKILL.md
├── contexts/                   ← Project ground truth (fill these for your stack)
│   ├── stack-context.md
│   ├── coding-standards.md
│   ├── architecture-context.md
│   ├── database-context.md
│   ├── design-system.md
│   ├── api-conventions.md
│   ├── security-baselines.md
│   ├── testing-standards.md
│   ├── infra-context.md
│   ├── domain-rules.md
│   ├── business-priorities.md
│   └── project-context.md
├── workflows/                  ← Full workflow source files
├── global_workflows/           ← Extended global-only workflows
│   ├── workflow-verify-project.md
│   └── workflow-visual-brainstorm.md
├── templates/                  ← Output scaffolds (ADRs, PRDs, debug reports)
├── rubric/                     ← Self-assessment scorecards
├── benchmark/                  ← Performance trackers
└── memory/                     ← Living institutional knowledge
    ├── decisions-log.md
    ├── common-patterns.md
    ├── mistakes-to-avoid.md
    └── postmortems.md
```

---

## SLASH COMMAND WORKFLOWS

Once installed, you can trigger workflows via the `/` key in your IDE.

| Type `/` then... | What it does |
| :--- | :--- |
| `workflow-build-feature` | Feature build: plan → code → test → ship |
| `workflow-debug-issue` | Debug: symptoms → root cause → verified fix |
| `workflow-design-ui` | UI design: goals → components → states → accessibility |
| `workflow-design-api` | API design: consumer needs → contract → docs |
| `workflow-review-code` | Code review: correctness → security → quality |
| `workflow-plan-architecture` | Architecture: requirements → decision → ADR |
| `workflow-project-inception` | New project: idea → plan → execution sequence |
| `workflow-refactor-module` | Refactor: identify → transform → verify behavior |
| `workflow-security-audit` | Security: STRIDE → vulnerabilities → mitigations |
| `workflow-optimize-performance` | Performance: measure → bottleneck → fix |
| `workflow-ship-to-production` | Pre-deploy checklist → staged rollout → monitoring |

---

## SKILLS LOADING STRATEGY

The AI MUST follow this rule when loading skills:

> **1 primary + max 2 secondary skills per task. Never load all skills at once.**

| Task type | Load from `skills/` |
| :--- | :--- |
| Writing/modifying code | `coding/SKILL.md` |
| Designing system structure | `architecture/SKILL.md` |
| Fixing a bug | `debugging/SKILL.md` |
| Building UI | `ui-ux/SKILL.md` |
| Security work | `security/SKILL.md` |
| Writing tests | `testing/SKILL.md` |
| Optimizing performance | `performance/SKILL.md` |
| Database work | `database/SKILL.md` |
| API design | `api-design/SKILL.md` |
| CI/CD / infra | `devops-infra/SKILL.md` |
| Refactoring | `refactoring/SKILL.md` |
| Research/comparison | `research-analysis/SKILL.md` |
| Scoping/prioritizing | `product-thinking/SKILL.md` |
| Reviewing code | `review-audit/SKILL.md` |

---

## CONTEXT FILES — FILL THESE FIRST

Context files are the most important files to populate **for your specific project**.
They tell the AI about YOUR stack, YOUR patterns, YOUR rules — not generic ones.

**Priority order:**

1. `stack-context.md` — What tech you use (language, framework, libraries)
2. `coding-standards.md` — Your code style, naming, patterns
3. `architecture-context.md` — How your system is structured
4. `project-context.md` — What the project is, who it's for, current state

Fill these first. The AI will produce far better output once they are populated.

---

## IDE-SPECIFIC NOTES

### Google Antigravity / Gemini
- Global config: `C:\Users\<Name>\.gemini\`
- The `GEMINI.md` file at the root is automatically read as the system prompt
- Skills in `~/.gemini/antigravity/skills/<name>/SKILL.md` are auto-discovered

### Cursor
- Global rules: `C:\Users\<Name>\.cursor\rules\` or `.cursorrules` in project root
- Paste the content of `GEMINI.md` into your Cursor rules
- Workflows available via `@` mention or slash commands with Cursor Composer

### Windsurf
- Global memories: `C:\Users\<Name>\.codeium\windsurf\memories\`
- Drop `GEMINI.md` content into your global memory or workspace `.windsurfrules`

### VS Code (GitHub Copilot)
- Place `GEMINI.md` content in `.github/copilot-instructions.md`
- Workflows go in `.github/` or use Copilot Chat slash commands

### Cline / Roo Code / Claude Code
- Config: usually workspace-level `.clinerules` or global MCP settings
- Drop `GEMINI.md` content into your workspace `.clinerules` or `.roomodes`
- Workflows available via MCP or direct CLI execution

### Codex
- Global config: `C:\Users\<Name>\.codex\`
- Drop `GEMINI.md` content into your global rules

### OpenCode
- Global config: `C:\Users\<Name>\.config\opencode\`
- Skills go in `~/.config/opencode/skills/<name>/SKILL.md`
- Core identity goes in `~/.config/opencode/AGENTS.md`

---

## MEMORY FILES

The memory folder is a living record of what you've learned. The AI writes to these
during and after sessions:

| File | What gets written here |
| :--- | :--- |
| `decisions-log.md` | Architectural & strategy decisions made mid-session |
| `common-patterns.md` | Patterns that worked well and should be reused |
| `mistakes-to-avoid.md` | Bugs, missteps, and anti-patterns to never repeat |
| `postmortems.md` | Post-ship analysis of what went wrong and why |

**The AI writes to memory:**
- After every significant build or debug session
- After any architectural decision
- When an error occurs a second time (recurring pattern)

---

## TROUBLESHOOTING

**Slash commands not showing up?**
→ Make sure workflow files are in `.agents/workflows/` relative to the workspace root
→ Restart your IDE after installation

**AI not following the system prompt?**
→ Make sure `GEMINI.md` (or equivalent) is in the correct global config folder for your IDE
→ For Gemini: it must be at `C:\Users\<Name>\.gemini\GEMINI.md` exactly

**Skills not being loaded?**
→ Each skill must be a folder with a `SKILL.md` inside it
→ Path: `~/.gemini/antigravity/skills/<skill-name>/SKILL.md`

**Context files are empty — AI gives generic answers?**
→ This is expected — the AI has no project-specific knowledge yet
→ Open each file in `contexts/` and fill in the details for your stack

---

## CONTRIBUTE / CUSTOMIZE

This is YOUR system. Fork it. Edit the skills. Add new workflows.
The only rule: keep the folder structure intact so the AI can find its files.

To add a new skill:
1. Create `skills/<skill-name>/SKILL.md`
2. Add YAML frontmatter: `name:` and `description:`
3. Add it to the loading table in `GEMINI.md`

To add a new workflow:
1. Create `workflows/workflow-<name>.md` (source)
2. Create `.agents/workflows/workflow-<name>.md` (slim slash-command version)
3. Add it to the workflow table in `GEMINI.md`

---

*Anti-Gravity OS — Built for builders who move fast and finish things.*
