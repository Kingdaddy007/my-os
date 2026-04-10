# Anti-Gravity OS — Windows Installer
# Run: .\install.ps1
# Or:  .\install.ps1 -GlobalOnly  (skip workspace layer)
# Or:  .\install.ps1 -WorkspaceOnly  (skip global layer)

param(
    [switch]$WorkspaceOnly,
    [switch]$GlobalOnly,
    [string]$TargetProject = $null,
    [string]$GlobalConfig = $null,
    [string]$IDE = $null
)

# ─── Colors ──────────────────────────────────────────────────────────────────
function Write-Step($msg)    { Write-Host "`n▶ $msg" -ForegroundColor Cyan }
function Write-Success($msg) { Write-Host "  ✓ $msg" -ForegroundColor Green }
function Write-Warn($msg)    { Write-Host "  ⚠ $msg" -ForegroundColor Yellow }
function Write-Question($msg){ Write-Host "`n$msg" -ForegroundColor White }
function Write-Header()      {
    Write-Host "`n" -NoNewline
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan
    Write-Host "   Anti-Gravity OS — Installer v1.1"          -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan
}

Write-Header

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$WorkspaceSource = Join-Path $ScriptRoot "workspace"
$GlobalSource    = Join-Path $ScriptRoot "global"

# ─── Step 1: Determine install mode ──────────────────────────────────────────
Write-Step "Checking install mode..."

if (-not $WorkspaceOnly -and -not $GlobalOnly) {
    Write-Question @"
What would you like to install?

  [1] Workspace layer only  (rules + slash-command workflows for this project)
  [2] Global layer only     (skills, contexts, rubrics — the full AI brain)
  [3] Both layers           (recommended — full setup)

Enter 1, 2, or 3:
"@
    $choice = Read-Host
    switch ($choice) {
        "1" { $WorkspaceOnly = $true }
        "2" { $GlobalOnly    = $true }
        "3" { }  # both, default
        default { Write-Warn "Invalid choice. Installing both layers."; }
    }
}

$installWorkspace = -not $GlobalOnly
$installGlobal    = -not $WorkspaceOnly

# ─── Step 2: Workspace target ─────────────────────────────────────────────────
if ($installWorkspace) {
    if (-not $TargetProject) {
        Write-Question @"
Where is the project you want to add Anti-Gravity OS to?
(Press Enter to use the CURRENT directory: $(Get-Location))
"@
        $input = Read-Host
        if ($input -eq "") {
            $TargetProject = (Get-Location).Path
        } else {
            $TargetProject = $input.Trim('"')
        }
    }

    if (-not (Test-Path $TargetProject)) {
        Write-Warn "Project path not found: $TargetProject"
        Write-Warn "Creating it..."
        New-Item -ItemType Directory -Path $TargetProject -Force | Out-Null
    }
}

# ─── Step 3: Global config target ─────────────────────────────────────────────
if ($installGlobal) {
    if (-not $GlobalConfig) {
        if (-not $IDE) {
            Write-Question @"
Which IDE are you using?

  [1] Google AI Studio / Gemini   → ~/.gemini/antigravity/
  [2] Cursor                      → ~/.cursor/rules/
  [3] Windsurf                    → ~/.codeium/windsurf/memories/
  [4] VS Code (Copilot)           → .github/ in project root
  [5] OpenCode                    → ~/.config/opencode/
  [6] Custom path

Enter 1–6:
"@
            $IDE = Read-Host
        }

        switch ($IDE.Trim()) {
            "1" { $GlobalConfig = Join-Path $env:USERPROFILE ".gemini\antigravity" }
            "2" { $GlobalConfig = Join-Path $env:USERPROFILE ".cursor\rules" }
            "3" { $GlobalConfig = Join-Path $env:USERPROFILE ".codeium\windsurf\memories" }
            "4" {
                if ($TargetProject) {
                    $GlobalConfig = Join-Path $TargetProject ".github"
                } else {
                    $GlobalConfig = Join-Path (Get-Location) ".github"
                }
            }
            "5" { $GlobalConfig = Join-Path $env:USERPROFILE ".config\opencode" }
            "6" {
                Write-Question "Enter the full path to your global config folder:"
                $GlobalConfig = (Read-Host).Trim('"')
            }
            default {
                Write-Warn "Unrecognised choice. Defaulting to ~/.gemini/antigravity/"
                $GlobalConfig = Join-Path $env:USERPROFILE ".gemini\antigravity"
            }
        }
    }
}

# ─── Step 4: Install Workspace Layer ─────────────────────────────────────────
if ($installWorkspace) {
    Write-Step "Installing Workspace Layer → $TargetProject"

    function Copy-WorkspaceDir($subPath) {
        $src = Join-Path $WorkspaceSource $subPath
        $dst = Join-Path $TargetProject   $subPath
        if (Test-Path $src) {
            if (-not (Test-Path $dst)) {
                New-Item -ItemType Directory -Path $dst -Force | Out-Null
            }
            Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
            Write-Success "Copied workspace/$subPath/ → $dst"
        } else {
            Write-Warn "Source not found: workspace/$subPath/ (skipping)"
        }
    }

    # Core workspace folders
    Copy-WorkspaceDir ".agents"
    Copy-WorkspaceDir "contexts"
    Copy-WorkspaceDir "memory"
    Copy-WorkspaceDir "templates"
    Copy-WorkspaceDir "scripts"

    Write-Success "Workspace layer installed."
}

# ─── Step 5: Install Global Layer ────────────────────────────────────────────
if ($installGlobal) {
    Write-Step "Installing Global Layer → $GlobalConfig"

    if (-not (Test-Path $GlobalConfig)) {
        New-Item -ItemType Directory -Path $GlobalConfig -Force | Out-Null
        Write-Success "Created global config directory: $GlobalConfig"
    }

    function Copy-GlobalDir($subPath) {
        $src = Join-Path $GlobalSource $subPath
        $dst = Join-Path $GlobalConfig $subPath
        if (Test-Path $src) {
            if (-not (Test-Path $dst)) {
                New-Item -ItemType Directory -Path $dst -Force | Out-Null
            }
            Copy-Item -Path "$src\*" -Destination $dst -Recurse -Force
            Write-Success "Copied global/$subPath/ → $dst"
        } else {
            Write-Warn "Source not found: global/$subPath/ (skipping)"
        }
    }

    function Copy-GlobalFile($fileName) {
        $src = Join-Path $GlobalSource $fileName
        $dst = Join-Path $GlobalConfig $fileName
        if (Test-Path $src) {
            Copy-Item -Path $src -Destination $dst -Force
            Write-Success "Copied global/$fileName → $dst"
        } else {
            Write-Warn "Source not found: global/$fileName (skipping)"
        }
    }

    # Root global files
    Copy-GlobalFile "GEMINI.md"
    Copy-GlobalFile "GLOBAL_MEMORY.md"

    # Global folders
    Copy-GlobalDir "core"
    Copy-GlobalDir "skills"
    Copy-GlobalDir "contexts"
    Copy-GlobalDir "workflows"
    Copy-GlobalDir "global_workflows"
    Copy-GlobalDir "templates"
    Copy-GlobalDir "memory"
    Copy-GlobalDir "rubric"
    Copy-GlobalDir "benchmark"
    Copy-GlobalDir "scripts"

    Write-Success "Global layer installed."
}

# ─── Step 6: Summary ─────────────────────────────────────────────────────────
Write-Host "`n"
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
Write-Host "   Anti-Gravity OS — Installation Complete" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen

if ($installWorkspace) {
    Write-Host @"

  WORKSPACE installed at:
    $TargetProject

  Your IDE can now use slash commands. Type / to see:
    /workflow-build-feature
    /workflow-debug-issue
    /workflow-design-ui
    ... and 8 more workflows

"@ -ForegroundColor White
}

if ($installGlobal) {
    Write-Host @"
  GLOBAL BRAIN installed at:
    $GlobalConfig

  Next steps:
    1. Fill in your context files (stack, architecture, coding standards)
    2. Restart your IDE
    3. Tell your AI: "Read SETUP.md — I want to verify the installation"

"@ -ForegroundColor White
}

Write-Host "  Context files to fill first:" -ForegroundColor Yellow
Write-Host "    → contexts/stack-context.md" -ForegroundColor Gray
Write-Host "    → contexts/coding-standards.md" -ForegroundColor Gray
Write-Host "    → contexts/project-context.md" -ForegroundColor Gray
Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
Write-Host ""
