<#
.SYNOPSIS
    Scripted_AI Universal Project Integrator
    Installs and synchronizes the Scripted_AI framework into any Web, App, Game, or Mobile project.

.PARAMETER TargetDir
    Target project root directory path.

.PARAMETER Domain
    Target domain expertise: 'game', 'web', 'app', 'mobile', or 'all' (default is 'all').

.EXAMPLE
    .\setup_project_rules.ps1 -TargetDir "D:\Projects\MyNextApp" -Domain "web"
    .\setup_project_rules.ps1 -TargetDir "D:\Projects\UnityRPG" -Domain "game"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $false, Position = 0)]
    [string]$TargetDir,

    [Parameter(Mandatory = $false, Position = 1)]
    [ValidateSet("game", "web", "app", "mobile", "all")]
    [string]$Domain = "all"
)

$SourceRoot = $PSScriptRoot

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "[SCRIPTED_AI] UNIVERSAL FRAMEWORK INTEGRATOR" -ForegroundColor Magenta
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Prompt for directory if not provided
if (-not $TargetDir) {
    $TargetDir = Read-Host "Enter target project root directory (e.g. D:\MyProject)"
}

if (-not (Test-Path $TargetDir)) {
    Write-Host "[ERROR] Target directory not found: '$TargetDir'" -ForegroundColor Red
    exit 1
}

$TargetResolved = (Resolve-Path $TargetDir).Path
Write-Host "-> Target Project: $TargetResolved" -ForegroundColor Green
Write-Host "-> Selected Domain: $Domain" -ForegroundColor Green

# 2. Create target directory structure
$TargetScripted = Join-Path $TargetResolved "scripted_AI"
New-Item -ItemType Directory -Force -Path $TargetScripted | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $TargetResolved ".agents") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $TargetScripted "core_protocols") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $TargetScripted "project_context") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $TargetScripted "templates") | Out-Null

# 3. Copy Core Protocols
Write-Host "-> Copying Core Protocols (5 Mandatory Pillars)..." -ForegroundColor Yellow
Copy-Item -Path (Join-Path $SourceRoot "core_protocols\*") -Destination (Join-Path $TargetScripted "core_protocols") -Recurse -Force

# 4. Copy Project Context & Living Memory
Write-Host "-> Copying Project Context & Living Memory templates..." -ForegroundColor Yellow
Copy-Item -Path (Join-Path $SourceRoot "project_context\*") -Destination (Join-Path $TargetScripted "project_context") -Recurse -Force

# 5. Copy Domain Standards
$TargetDomainStandards = Join-Path $TargetScripted "domain_standards"
New-Item -ItemType Directory -Force -Path $TargetDomainStandards | Out-Null

if ($Domain -eq "all") {
    Write-Host "-> Copying all Domain Standards (Game, Web, App, Mobile)..." -ForegroundColor Yellow
    Copy-Item -Path (Join-Path $SourceRoot "domain_standards\*") -Destination $TargetDomainStandards -Recurse -Force
} else {
    Write-Host "-> Copying specialized Domain Standard: '$Domain'..." -ForegroundColor Yellow
    $SpecificDomainPath = Join-Path $SourceRoot "domain_standards\$Domain"
    if (Test-Path $SpecificDomainPath) {
        $DestSpecific = Join-Path $TargetDomainStandards $Domain
        New-Item -ItemType Directory -Force -Path $DestSpecific | Out-Null
        Copy-Item -Path "$SpecificDomainPath\*" -Destination $DestSpecific -Recurse -Force
    }
}

# 6. Copy Templates
Write-Host "-> Copying project templates..." -ForegroundColor Yellow
Copy-Item -Path (Join-Path $SourceRoot "templates\*") -Destination (Join-Path $TargetScripted "templates") -Recurse -Force

# 7. Copy root agent bridges (.agents/AGENTS.md, CLAUDE.md, .cursorrules)
Write-Host "-> Configuring Agent Bridges (Antigravity, Claude Code, Cursor)..." -ForegroundColor Yellow
Copy-Item -Path (Join-Path $SourceRoot ".agents\AGENTS.md") -Destination (Join-Path $TargetResolved ".agents\AGENTS.md") -Force
Copy-Item -Path (Join-Path $SourceRoot "CLAUDE.md") -Destination (Join-Path $TargetResolved "CLAUDE.md") -Force
Copy-Item -Path (Join-Path $SourceRoot ".cursorrules") -Destination (Join-Path $TargetResolved ".cursorrules") -Force

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "[SUCCESS] Integration completed successfully!" -ForegroundColor Green
Write-Host "Target: $TargetResolved is now governed by Scripted_AI." -ForegroundColor White
Write-Host "Open this project with Antigravity, Cursor, or Claude Code." -ForegroundColor Gray
Write-Host "Every AI Agent will automatically adopt these rules, domain expertise, and project context." -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan
