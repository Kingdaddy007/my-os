# Anti-Gravity OS

> A structured AI engineering system — skills, workflows, contexts, and memory files that transform any AI coding assistant into a disciplined, high-performance engineering partner.

---

## What is Anti-Gravity OS?

Anti-Gravity OS is NOT a chatbot prompt. It is a **complete operating system for AI-assisted engineering** — a collection of structured markdown files that give any AI coding tool:

- **A persistent identity** — who it is, how it thinks, what it refuses
- **Domain expertise** — 15 skill files covering coding, debugging, architecture, security, and more
- **Execution workflows** — 13 step-by-step guides triggered by slash commands
- **Project context** — files you fill with your stack, standards, and architecture
- **Institutional memory** — a living record of decisions, patterns, and mistakes

---

## Architecture

```
antigravity-os/
├── SETUP.md                    ← AI reads this. Complete setup guide.
├── install.ps1                 ← Windows/PowerShell installer
├── install.sh                  ← Mac/Linux installer
├── README.md                   ← This file
│
├── workspace/                  ← Files that go inside your project
│   ├── .agents/
│   │   ├── rules.md            ← AI project rules (auto-loaded)
│   │   └── workflows/          ← Slash-command workflow triggers
│   ├── core/                   ← Core identity files (9 files)
│   ├── skills/                 ← Flat skill files (workspace copy)
│   ├── contexts/               ← Project context templates
│   ├── workflows/              ← Full workflow source files
│   ├── templates/              ← Output scaffolds (ADR, PRD, etc.)
│   ├── memory/                 ← Living memory (decisions, patterns)
│   ├── rubric/                 ← Quality self-assessment scorecards
│   ├── benchmark/              ← Performance trackers
│   └── scripts/                ← Utility scripts
│
└── global/                     ← Files that go in your IDE's global config
    ├── GEMINI.md               ← Master system prompt
    ├── GLOBAL_MEMORY.md        ← System map
    ├── core/
    ├── skills/                 ← Folder-based skills with SKILL.md
    ├── contexts/
    ├── workflows/
    ├── global_workflows/       ← Global-only workflows
    ├── templates/
    ├── memory/
    ├── rubric/
    ├── benchmark/
    └── scripts/
```

---

## Quick Start

**1. Clone the repo**
```bash
git clone https://github.com/YOUR_USERNAME/antigravity-os.git
cd antigravity-os
```

**2. Read SETUP.md** (or tell your AI to read it)
```
"Read SETUP.md and help me install Anti-Gravity OS"
```

The AI will ask which IDE you use and guide you through the rest.

**3. Run the installer**
```powershell
# Windows
.\install.ps1

# Mac/Linux
chmod +x install.sh && ./install.sh
```

---

## Slash Command Workflows

After installation, type `/` in your IDE to access:

| Slash Command | Purpose |
| :--- | :--- |
| `/workflow-build-feature` | Build features end-to-end with rigor |
| `/workflow-debug-issue` | Systematic root-cause debugging |
| `/workflow-design-ui` | UI design with full state coverage |
| `/workflow-design-api` | API design with contracts & error handling |
| `/workflow-review-code` | Code review against quality standards |
| `/workflow-plan-architecture` | Architecture decisions with tradeoffs |
| `/workflow-project-inception` | Turn an idea into an executable plan |
| `/workflow-refactor-module` | Safe refactoring with behavior preservation |
| `/workflow-security-audit` | STRIDE-based security analysis |
| `/workflow-optimize-performance` | Measure-first performance optimization |
| `/workflow-ship-to-production` | Pre-deploy checklist and staged rollout |

---

## Context Files — Fill These First

The `contexts/` folder contains templates. Fill these for your specific project:

| File | Fill with |
| :--- | :--- |
| `stack-context.md` | Your tech stack, languages, frameworks |
| `coding-standards.md` | Your code style, naming, patterns |
| `architecture-context.md` | How your system is structured |
| `project-context.md` | What the project is, current state |

The AI gives generic answers when these are empty. It gives precise, opinionated answers when they are populated.

---

## IDE Compatibility

| IDE | Supported | Config Location |
| :--- | :--- | :--- |
| Google AI Studio / Gemini | ✅ Full | `~/.gemini/` |
| Cursor | ✅ Full | `~/.cursor/rules/` or `.cursorrules` |
| Windsurf | ✅ Full | `~/.codeium/windsurf/memories/` |
| VS Code (Copilot) | ✅ Partial | `.github/copilot-instructions.md` |
| OpenCode | ✅ Full | `~/.config/opencode/` |
| Claude Dev / Cline | ✅ Partial | `.clinerules` or `.cursorrules` |

---

## Customizing

This is designed to be forked and modified. To extend:

- **New skill:** Add `skills/<name>/SKILL.md` + update skill table in `GEMINI.md`
- **New workflow:** Add source to `workflows/` + slim version to `.agents/workflows/`
- **New context:** Add file to `contexts/` + load rule in `GEMINI.md`

---

## License

MIT — use it, fork it, make it yours.

---

*Anti-Gravity OS — For builders who move fast and finish things.*
