#!/usr/bin/env bash
# Anti-Gravity OS — Mac/Linux Installer
# Usage: chmod +x install.sh && ./install.sh
# Options: --workspace-only | --global-only | --project=/path | --config=/path | --ide=gemini

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_SRC="$SCRIPT_DIR/workspace"
GLOBAL_SRC="$SCRIPT_DIR/global"

# ─── Colors ──────────────────────────────────────────────────────────────────
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
RESET='\033[0m'

step()     { echo -e "\n${CYAN}▶ $1${RESET}"; }
success()  { echo -e "  ${GREEN}✓ $1${RESET}"; }
warn()     { echo -e "  ${YELLOW}⚠ $1${RESET}"; }
question() { echo -e "\n${WHITE}$1${RESET}"; }

WORKSPACE_ONLY=false
GLOBAL_ONLY=false
TARGET_PROJECT=""
GLOBAL_CONFIG=""
IDE=""

# Parse args
for arg in "$@"; do
    case $arg in
        --workspace-only) WORKSPACE_ONLY=true ;;
        --global-only)    GLOBAL_ONLY=true ;;
        --project=*)      TARGET_PROJECT="${arg#*=}" ;;
        --config=*)       GLOBAL_CONFIG="${arg#*=}" ;;
        --ide=*)          IDE="${arg#*=}" ;;
    esac
done

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${CYAN}   Anti-Gravity OS — Installer v1.1${RESET}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

# ─── Install Mode ─────────────────────────────────────────────────────────────
if [[ "$WORKSPACE_ONLY" == false && "$GLOBAL_ONLY" == false ]]; then
    question "What would you like to install?

  [1] Workspace layer only  (rules + slash-command workflows for this project)
  [2] Global layer only     (skills, contexts, rubrics — the full AI brain)
  [3] Both layers           (recommended — full setup)

Enter 1, 2, or 3:"
    read choice
    case $choice in
        1) WORKSPACE_ONLY=true ;;
        2) GLOBAL_ONLY=true ;;
        3) ;;
        *) warn "Invalid. Installing both layers." ;;
    esac
fi

INSTALL_WORKSPACE=true
INSTALL_GLOBAL=true
[[ "$GLOBAL_ONLY"    == true ]] && INSTALL_WORKSPACE=false
[[ "$WORKSPACE_ONLY" == true ]] && INSTALL_GLOBAL=false

# ─── Workspace Target ─────────────────────────────────────────────────────────
if [[ "$INSTALL_WORKSPACE" == true && -z "$TARGET_PROJECT" ]]; then
    question "Where is the project you want to add Anti-Gravity OS to?
(Press Enter to use current directory: $(pwd))"
    read input
    if [[ -z "$input" ]]; then
        TARGET_PROJECT="$(pwd)"
    else
        TARGET_PROJECT="$input"
    fi
fi

# ─── Global Config Target ─────────────────────────────────────────────────────
if [[ "$INSTALL_GLOBAL" == true && -z "$GLOBAL_CONFIG" ]]; then
    if [[ -z "$IDE" ]]; then
        question "Which IDE are you using?

  [1] Google AI Studio / Gemini   → ~/.gemini/antigravity/
  [2] Cursor                      → ~/.cursor/rules/
  [3] Windsurf                    → ~/.codeium/windsurf/memories/
  [4] VS Code (Copilot)           → .github/ in project root
  [5] OpenCode                    → ~/.config/opencode/
  [6] Custom path

Enter 1–6:"
        read IDE
    fi

    case "$IDE" in
        1|gemini)    GLOBAL_CONFIG="$HOME/.gemini/antigravity" ;;
        2|cursor)    GLOBAL_CONFIG="$HOME/.cursor/rules" ;;
        3|windsurf)  GLOBAL_CONFIG="$HOME/.codeium/windsurf/memories" ;;
        4|vscode)    GLOBAL_CONFIG="${TARGET_PROJECT:-$(pwd)}/.github" ;;
        5|opencode)  GLOBAL_CONFIG="$HOME/.config/opencode" ;;
        6|custom)
            question "Enter the full path to your global config folder:"
            read GLOBAL_CONFIG
            ;;
        *) warn "Unknown IDE. Defaulting to ~/.gemini/antigravity/"
           GLOBAL_CONFIG="$HOME/.gemini/antigravity" ;;
    esac
fi

# ─── Install Workspace Layer ──────────────────────────────────────────────────
if [[ "$INSTALL_WORKSPACE" == true ]]; then
    step "Installing Workspace Layer → $TARGET_PROJECT"
    mkdir -p "$TARGET_PROJECT"

    copy_workspace_dir() {
        local subpath="$1"
        local src="$WORKSPACE_SRC/$subpath"
        local dst="$TARGET_PROJECT/$subpath"
        if [[ -d "$src" ]]; then
            mkdir -p "$dst"
            cp -r "$src/." "$dst/"
            success "Copied workspace/$subpath/ → $dst"
        else
            warn "Not found: workspace/$subpath/ (skipping)"
        fi
    }

    copy_workspace_dir ".agents"
    copy_workspace_dir "contexts"
    copy_workspace_dir "memory"
    copy_workspace_dir "templates"
    copy_workspace_dir "scripts"

    success "Workspace layer installed."
fi

# ─── Install Global Layer ─────────────────────────────────────────────────────
if [[ "$INSTALL_GLOBAL" == true ]]; then
    step "Installing Global Layer → $GLOBAL_CONFIG"
    mkdir -p "$GLOBAL_CONFIG"

    copy_global_dir() {
        local subpath="$1"
        local src="$GLOBAL_SRC/$subpath"
        local dst="$GLOBAL_CONFIG/$subpath"
        if [[ -d "$src" ]]; then
            mkdir -p "$dst"
            cp -r "$src/." "$dst/"
            success "Copied global/$subpath/ → $dst"
        else
            warn "Not found: global/$subpath/ (skipping)"
        fi
    }

    copy_global_file() {
        local filename="$1"
        local src="$GLOBAL_SRC/$filename"
        local dst="$GLOBAL_CONFIG/$filename"
        if [[ -f "$src" ]]; then
            cp "$src" "$dst"
            success "Copied global/$filename → $dst"
        else
            warn "Not found: global/$filename (skipping)"
        fi
    }

    copy_global_file "GEMINI.md"
    copy_global_file "GLOBAL_MEMORY.md"

    copy_global_dir "core"
    copy_global_dir "skills"
    copy_global_dir "contexts"
    copy_global_dir "workflows"
    copy_global_dir "global_workflows"
    copy_global_dir "templates"
    copy_global_dir "memory"
    copy_global_dir "rubric"
    copy_global_dir "benchmark"
    copy_global_dir "scripts"

    success "Global layer installed."
fi

# ─── Summary ─────────────────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo -e "${GREEN}   Anti-Gravity OS — Installation Complete${RESET}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"

if [[ "$INSTALL_WORKSPACE" == true ]]; then
    echo -e "\n${WHITE}  WORKSPACE installed at:${RESET}"
    echo -e "    $TARGET_PROJECT"
    echo -e "\n${WHITE}  Slash commands now available (type / in your IDE):${RESET}"
    echo -e "${GRAY}    /workflow-build-feature${RESET}"
    echo -e "${GRAY}    /workflow-debug-issue${RESET}"
    echo -e "${GRAY}    /workflow-design-ui ... and 8 more${RESET}"
fi

if [[ "$INSTALL_GLOBAL" == true ]]; then
    echo -e "\n${WHITE}  GLOBAL BRAIN installed at:${RESET}"
    echo -e "    $GLOBAL_CONFIG"
fi

echo -e "\n${YELLOW}  Fill these context files first:${RESET}"
echo -e "${GRAY}    → contexts/stack-context.md${RESET}"
echo -e "${GRAY}    → contexts/coding-standards.md${RESET}"
echo -e "${GRAY}    → contexts/project-context.md${RESET}"
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
echo ""
