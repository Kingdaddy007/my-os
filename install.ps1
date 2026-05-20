# Anti-Gravity OS — Windows Installer (Safe / Surgical)
# Run: .\install.ps1
#
# This installer ONLY copies OS-specific folders and files.
# It NEVER wipes the target directory. Existing non-OS files (plugins, MCP configs,
# conversations, extensions) are left completely untouched.

param(
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
    Write-Host "   Anti-Gravity OS — Installer v2.0 (Safe)"     -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkCyan
}

Write-Header

$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$GlobalSource = Join-Path $ScriptRoot "global"

# ─── OS-managed items (ONLY these get touched) ────────────────────────────────
$OsFolders = @("skills", "workflows", "core", "contexts", "memory", "scripts", "global_templates")
$OsFiles   = @("GEMINI.md", "GLOBAL_MEMORY.md")

# ─── Step 1: Global config target ─────────────────────────────────────────────
if (-not $GlobalConfig) {
    if (-not $IDE) {
        Write-Question @"
Which IDE are you using?

  [1] Google AI Studio / Gemini   → ~/.gemini/config/
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
        "1" { $GlobalConfig = Join-Path $env:USERPROFILE ".gemini\config" }
        "2" { $GlobalConfig = Join-Path $env:USERPROFILE ".cursor\rules" }
        "3" { $GlobalConfig = Join-Path $env:USERPROFILE ".codeium\windsurf\memories" }
        "4" { $GlobalConfig = Join-Path (Get-Location) ".github\antigravity" }
        "5" { $GlobalConfig = Join-Path $env:USERPROFILE ".config\opencode" }
        "6" {
            Write-Question "Enter the full path to your global config folder:"
            $GlobalConfig = (Read-Host).Trim('"')
        }
        default {
            Write-Warn "Unrecognised choice. Defaulting to ~/.gemini/config/"
            $GlobalConfig = Join-Path $env:USERPROFILE ".gemini\config"
        }
    }
}

# ─── Step 2: Create target if needed ─────────────────────────────────────────
Write-Step "Installing OS → $GlobalConfig"

if (-not (Test-Path $GlobalConfig)) {
    New-Item -ItemType Directory -Path $GlobalConfig -Force | Out-Null
    Write-Success "Created configuration directory: $GlobalConfig"
}

# ─── Step 3: Backup existing OS files before overwriting ──────────────────────
$BackupDir = Join-Path $GlobalConfig ".antigravity-backup-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
$backedUp = $false

foreach ($folder in $OsFolders) {
    $existingPath = Join-Path $GlobalConfig $folder
    if (Test-Path $existingPath) {
        if (-not $backedUp) {
            Write-Step "Backing up existing OS files → $BackupDir"
            New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
            $backedUp = $true
        }
        Copy-Item -Path $existingPath -Destination (Join-Path $BackupDir $folder) -Recurse -Force
    }
}

foreach ($file in $OsFiles) {
    $existingPath = Join-Path $GlobalConfig $file
    if (Test-Path $existingPath) {
        if (-not $backedUp) {
            Write-Step "Backing up existing OS files → $BackupDir"
            New-Item -ItemType Directory -Path $BackupDir -Force | Out-Null
            $backedUp = $true
        }
        Copy-Item -Path $existingPath -Destination (Join-Path $BackupDir $file) -Force
    }
}

if ($backedUp) {
    Write-Success "Backup saved to: $BackupDir"
} else {
    Write-Success "No existing OS files found — fresh install."
}

# ─── Step 4: Surgically copy ONLY OS folders and files ────────────────────────
Write-Step "Copying OS files (surgical — non-OS files untouched)..."

foreach ($folder in $OsFolders) {
    $sourcePath = Join-Path $GlobalSource $folder
    $destPath   = Join-Path $GlobalConfig $folder
    if (Test-Path $sourcePath) {
        # Remove old version of this specific OS folder, then copy fresh
        if (Test-Path $destPath) {
            Remove-Item -Path $destPath -Recurse -Force
        }
        Copy-Item -Path $sourcePath -Destination $destPath -Recurse -Force
        Write-Success "  $folder/"
    }
}

foreach ($file in $OsFiles) {
    $sourcePath = Join-Path $GlobalSource $file
    $destPath   = Join-Path $GlobalConfig $file
    if (Test-Path $sourcePath) {
        Copy-Item -Path $sourcePath -Destination $destPath -Force
        Write-Success "  $file"
    }
}

Write-Success "OS files installed. All other config files left untouched."

# ─── Step 5: Dynamic Path URI Configuration ──────────────────────────────────
Write-Step "Configuring Absolute System Paths..."
$TargetURI = "file:///" + $GlobalConfig.Replace("\", "/")
Write-Success "Target system URI resolved: $TargetURI"

# Find all markdown files in OS folders only and substitute {{GLOBAL_CONFIG_URI}}
$replaceCount = 0

# Process root OS markdown files
foreach ($file in $OsFiles) {
    $filePath = Join-Path $GlobalConfig $file
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        if ($content -match "\{\{GLOBAL_CONFIG_URI\}\}") {
            $content = $content -replace "\{\{GLOBAL_CONFIG_URI\}\}", $TargetURI
            Set-Content -Path $filePath -Value $content -NoNewline
            $replaceCount++
        }
    }
}

# Process markdown files inside OS folders
foreach ($folder in $OsFolders) {
    $folderPath = Join-Path $GlobalConfig $folder
    if (Test-Path $folderPath) {
        $mdFiles = Get-ChildItem -Path $folderPath -Filter "*.md" -Recurse
        foreach ($file in $mdFiles) {
            $content = Get-Content $file.FullName -Raw
            if ($content -match "\{\{GLOBAL_CONFIG_URI\}\}") {
                $content = $content -replace "\{\{GLOBAL_CONFIG_URI\}\}", $TargetURI
                Set-Content -Path $file.FullName -Value $content -NoNewline
                $replaceCount++
            }
        }
    }
}

Write-Success "Re-wrote system URIs in $replaceCount configuration files."

# ─── Step 6: Summary ─────────────────────────────────────────────────────────
Write-Host "`n"
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
Write-Host "   Anti-Gravity OS — Installation Complete" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen

Write-Host @"
  GLOBAL SYSTEM installed at:
    $GlobalConfig

  What was touched:
    ✓ OS folders: $($OsFolders -join ', ')
    ✓ OS files:   $($OsFiles -join ', ')
    ✗ Everything else in the directory was LEFT ALONE.

  Next steps:
    1. Fill in your context files (contexts/stack-context.md, etc.)
    2. Tell your AI: "Read GEMINI.md" or configure it as your master prompt.

"@ -ForegroundColor White

Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor DarkGreen
Write-Host ""
