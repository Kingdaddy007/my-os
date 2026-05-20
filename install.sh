#!/usr/bin/env bash
# Anti-Gravity OS — Mac/Linux Installer (Safe / Surgical)
# Run: ./install.sh
#
# This installer ONLY copies OS-specific folders and files.
# It NEVER wipes the target directory. Existing non-OS files (plugins, MCP configs,
# conversations, extensions) are left completely untouched.

# ─── Colors ──────────────────────────────────────────────────────────────────
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
DARKCYAN='\033[0;36m'
NC='\033[0m' # No Color

function step()    { echo -e "\n${CYAN}▶ $1${NC}"; }
function success() { echo -e "  ${GREEN}✓ $1${NC}"; }
function warn()    { echo -e "  ${YELLOW}⚠ $1${NC}"; }
function ask()     { echo -e "\n${WHITE}$1${NC}"; }
function header()  {
    echo -e "\n${DARKCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "   ${CYAN}Anti-Gravity OS — Installer v2.0 (Safe)${NC}"
    echo -e "${DARKCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

header

SCRIPT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GLOBAL_SOURCE="$SCRIPT_ROOT/global"

# ─── OS-managed items (ONLY these get touched) ────────────────────────────────
OS_FOLDERS=("skills" "workflows" "core" "contexts" "memory" "scripts" "global_templates")
OS_FILES=("GEMINI.md" "GLOBAL_MEMORY.md")

GLOBAL_CONFIG=""
IDE=""

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --global-config) GLOBAL_CONFIG="$2"; shift ;;
        --ide) IDE="$2"; shift ;;
        *) warn "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# ─── Step 1: Global config target ─────────────────────────────────────────────
if [ -z "$GLOBAL_CONFIG" ]; then
    if [ -z "$IDE" ]; then
        ask "Which IDE are you using?"
        echo ""
        echo "  [1] Google AI Studio / Gemini   → ~/.gemini/config/"
        echo "  [2] Cursor                      → ~/.cursor/rules/"
        echo "  [3] Windsurf                    → ~/.codeium/windsurf/memories/"
        echo "  [4] VS Code (Copilot)           → .github/ in project root"
        echo "  [5] OpenCode                    → ~/.config/opencode/"
        echo "  [6] Custom path"
        echo ""
        read -p "Enter 1–6: " IDE_CHOICE
        IDE="$IDE_CHOICE"
    fi

    case "$IDE" in
        1) GLOBAL_CONFIG="$HOME/.gemini/config" ;;
        2) GLOBAL_CONFIG="$HOME/.cursor/rules" ;;
        3) GLOBAL_CONFIG="$HOME/.codeium/windsurf/memories" ;;
        4) GLOBAL_CONFIG="$(pwd)/.github/antigravity" ;;
        5) GLOBAL_CONFIG="$HOME/.config/opencode" ;;
        6)
            ask "Enter the full path to your global config folder:"
            read -p "> " GLOBAL_CONFIG
            # Expand tilde if present
            GLOBAL_CONFIG="${GLOBAL_CONFIG/#\~/$HOME}"
            ;;
        *)
            warn "Unrecognised choice. Defaulting to ~/.gemini/config/"
            GLOBAL_CONFIG="$HOME/.gemini/config"
            ;;
    esac
fi

# ─── Step 2: Create target if needed ─────────────────────────────────────────
step "Installing OS → $GLOBAL_CONFIG"

if [ ! -d "$GLOBAL_CONFIG" ]; then
    mkdir -p "$GLOBAL_CONFIG"
    success "Created configuration directory: $GLOBAL_CONFIG"
fi

# ─── Step 3: Backup existing OS files before overwriting ──────────────────────
BACKUP_DIR="$GLOBAL_CONFIG/.antigravity-backup-$(date +%Y%m%d-%H%M%S)"
BACKED_UP=false

for folder in "${OS_FOLDERS[@]}"; do
    if [ -d "$GLOBAL_CONFIG/$folder" ]; then
        if [ "$BACKED_UP" = false ]; then
            step "Backing up existing OS files → $BACKUP_DIR"
            mkdir -p "$BACKUP_DIR"
            BACKED_UP=true
        fi
        cp -R "$GLOBAL_CONFIG/$folder" "$BACKUP_DIR/$folder"
    fi
done

for file in "${OS_FILES[@]}"; do
    if [ -f "$GLOBAL_CONFIG/$file" ]; then
        if [ "$BACKED_UP" = false ]; then
            step "Backing up existing OS files → $BACKUP_DIR"
            mkdir -p "$BACKUP_DIR"
            BACKED_UP=true
        fi
        cp "$GLOBAL_CONFIG/$file" "$BACKUP_DIR/$file"
    fi
done

if [ "$BACKED_UP" = true ]; then
    success "Backup saved to: $BACKUP_DIR"
else
    success "No existing OS files found — fresh install."
fi

# ─── Step 4: Surgically copy ONLY OS folders and files ────────────────────────
step "Copying OS files (surgical — non-OS files untouched)..."

for folder in "${OS_FOLDERS[@]}"; do
    if [ -d "$GLOBAL_SOURCE/$folder" ]; then
        # Remove old version of this specific OS folder, then copy fresh
        if [ -d "$GLOBAL_CONFIG/$folder" ]; then
            rm -rf "$GLOBAL_CONFIG/$folder"
        fi
        cp -R "$GLOBAL_SOURCE/$folder" "$GLOBAL_CONFIG/$folder"
        success "  $folder/"
    fi
done

for file in "${OS_FILES[@]}"; do
    if [ -f "$GLOBAL_SOURCE/$file" ]; then
        cp "$GLOBAL_SOURCE/$file" "$GLOBAL_CONFIG/$file"
        success "  $file"
    fi
done

success "OS files installed. All other config files left untouched."

# ─── Step 5: Dynamic Path URI Configuration ──────────────────────────────────
step "Configuring Absolute System Paths..."
TARGET_URI="file://$GLOBAL_CONFIG"
success "Target system URI resolved: $TARGET_URI"

# sed -i differs between macOS and Linux
sedi() {
    case $(uname) in
        Darwin*) sed -i '' "$@" ;;
        *) sed -i "$@" ;;
    esac
}

replace_count=0

# Process root OS markdown files
for file in "${OS_FILES[@]}"; do
    filepath="$GLOBAL_CONFIG/$file"
    if [ -f "$filepath" ] && grep -q "{{GLOBAL_CONFIG_URI}}" "$filepath"; then
        sedi "s|{{GLOBAL_CONFIG_URI}}|$TARGET_URI|g" "$filepath"
        replace_count=$((replace_count + 1))
    fi
done

# Process markdown files inside OS folders only
for folder in "${OS_FOLDERS[@]}"; do
    folder_path="$GLOBAL_CONFIG/$folder"
    if [ -d "$folder_path" ]; then
        while IFS= read -r -d '' file; do
            if grep -q "{{GLOBAL_CONFIG_URI}}" "$file"; then
                sedi "s|{{GLOBAL_CONFIG_URI}}|$TARGET_URI|g" "$file"
                replace_count=$((replace_count + 1))
            fi
        done < <(find "$folder_path" -type f -name "*.md" -print0)
    fi
done

success "Re-wrote system URIs in $replace_count configuration files."

# ─── Step 6: Summary ─────────────────────────────────────────────────────────
echo -e "\n${DARKCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "   ${GREEN}Anti-Gravity OS — Installation Complete${NC}"
echo -e "${DARKCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

echo -e "${WHITE}  GLOBAL SYSTEM installed at:"
echo -e "    $GLOBAL_CONFIG\n"
echo -e "  What was touched:"
echo -e "    ✓ OS folders: ${OS_FOLDERS[*]}"
echo -e "    ✓ OS files:   ${OS_FILES[*]}"
echo -e "    ✗ Everything else in the directory was LEFT ALONE.\n"
echo -e "  Next steps:"
echo -e "    1. Fill in your context files (contexts/stack-context.md, etc.)"
echo -e "    2. Tell your AI: \"Read GEMINI.md\" or configure it as your master prompt.\n${NC}"

echo -e "${DARKCYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
