# PROJECT RULES: ANTIGRAVITY GOLD

**Version:** Gold v1.0
**Context:** Workspace Configuration
**Inheritance:** Local First -> Global Second

## 1. INTELLIGENCE CURATION PROTOCOL

Anytime content is added to `rubrics/`, `skills/`, `contexts/`, or `templates/`, the Agent MUST:

1. **Load Workflow:** Automatically load and execute `.agents/workflows/content-curator.md`.
2. **Apply Skill:** Automatically apply the `C:\Users\Oviks\.gemini\antigravity\skills\context-formatting\SKILL.md` (Universal Fixed Skill).
3. **Zero-Lint Guarantee:** Ensure all Markdown lint errors (MD022, MD025, MD026, MD032, MD060) are resolved before announcing completion.

## 2. AGENTIC PROACTIVITY

- **Question Before Building:** If a standard is ambiguous, ask. If a standard exists (Global or Local), follow it without being told.
- **Transparency:** Proactively state which workflows and skills are being used for each task.

## 3. SEARCH PRIORITY

1. Check `.agents/` for project-specific templates or rubrics.
2. Check `C:\Users\Oviks\.gemini\antigravity\` for global standards.
3. Combine both into a unified execution plan.
