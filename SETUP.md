# Anti-Gravity OS — Setup Guide

**Version:** Gold v1.2 (Global OS Pattern)
**Status:** AI-READABLE SETUP DOCUMENT — Read this first before doing anything else
**Purpose:** Complete installation and configuration instructions for Anti-Gravity OS

---

## WHAT IS THIS?

Anti-Gravity OS is a structured AI engineering system — a set of skills, workflows, contexts, templates, rubrics, and memory files that transform any AI coding assistant into a disciplined, high-performance engineering partner.

Unlike project-level rules, Anti-Gravity is a **Global Operating System**. It gets installed once on your machine and serves as the master "brain" executing behind every project you touch.

---

## QUICK START (AI Instructions)

> **[AI CORE INITIALIZATION INSTRUCTION]**
> If you are an AI assistant reading this file because a user asked you to setup or clone the repository, follow these precise instructions:
>
> 1. Run the `install.ps1` (Windows) or `install.sh` (Mac/Linux) script located in this directory.
> 2. The script will ask for the target Global Configuration directory (e.g. `~/.gemini/antigravity`). You may provide it as an argument or let the user answer the prompt.
> 3. **CRITICAL:** The script will automatically copy these files AND execute a dynamic URI search-and-replace so that all absolute `file:///...` links perfectly map to the user's local operating system name. **DO NOT TRY TO MANUALLY EDIT PATHS.** The script handles it.
> 4. Verify installation by loading the newly mapped `GEMINI.md` file from the user's global config directory.

---

## DETAILED MAP

Anti-Gravity completely replaces the generic system prompt mapping in your IDE. Once the installer finishes, your IDE config folder will look like this:

```text
~/.gemini/antigravity/          ← (or your respective IDE path)
├── GEMINI.md                   ← Master system prompt (AI identity & boot sequence)
├── GLOBAL_MEMORY.md            ← System map (tells AI where everything lives)
├── core/                       ← Permanent AI brain (9 principle files)
├── skills/                     ← Domain expertise (AI reads before each task)
├── contexts/                   ← Project ground truth (fill these for your stack)
├── workflows/                  ← Full workflow source files
├── global_workflows/           ← Global Slash-command workflows (/ menu)
├── templates/                  ← Output scaffolds (ADRs, PRDs, debug reports)
├── rubric/                     ← Self-assessment scorecards
├── benchmark/                  ← Performance trackers
├── scripts/                    ← Utility executable tooling
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

## CONTEXT FILES — FILL THESE FIRST

Context files are the most important files to populate **for your specific project**. They tell the AI about YOUR stack, YOUR patterns, YOUR rules — not generic ones.

**Priority order:**

1. `contexts/stack-context.md` — What tech you use (language, framework, libraries)
2. `contexts/coding-standards.md` — Your code style, naming, patterns
3. `contexts/architecture-context.md` — How your system is structured
4. `contexts/project-context.md` — What the project is, who it's for, current state

Fill these first. The AI will produce far better output once they are populated.

---

## IDE-SPECIFIC DEFAULTS


### Google Antigravity / Gemini

- Global config: `C:\Users\<Name>\.gemini\`
- The `GEMINI.md` file at the root is automatically read as the system prompt
- Workflows are dynamically loaded from `~/.gemini/antigravity/global_workflows/`


### Cursor

- Global rules: `C:\Users\<Name>\.cursor\rules\`
- Point Cursor's system rules to the `GEMINI.md` file.


### Windsurf

- Global memories: `C:\Users\<Name>\.codeium\windsurf\memories\`


### OpenCode

- Global config: `C:\Users\<Name>\.config\opencode\`
- Skills go in `~/.config/opencode/skills/<name>/SKILL.md`

---

*Anti-Gravity OS — Built for builders who move fast and finish things.*
