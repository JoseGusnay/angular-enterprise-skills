<#
.SYNOPSIS
    Skill Installer for Antigravity (skills.sh style)
.DESCRIPTION
    Creates a folder structure for a new skill and sets up the SKILL.md file.
.PARAMETER Name
    The name of the skill to create.
.PARAMETER Path
    Optional path to an existing .md file to convert.
.EXAMPLE
    .\install_skill.ps1 -Name "my-new-skill" -Path "C:\temp\existing.md"
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$Name,

    [Parameter(Mandatory=$false)]
    [string]$Path
)

$SkillsDir = Join-Path $PSScriptRoot "skills"
$TargetDir = Join-Path $SkillsDir $Name

# Create directory
if (!(Test-Path $TargetDir)) {
    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
}

$TargetFile = Join-Path $TargetDir "SKILL.md"

if ($Path -and (Test-Path $Path)) {
    $Content = Get-Content $Path -Raw
    
    if ($Content -notmatch "---") {
        $Frontmatter = @"
---
name: $Name
description: Auto-generated skill from $Path
license: MIT
metadata:
  version: "1.0.0"
  triggers: $Name
---

"@
        $Content = $Frontmatter + $Content
    }
    
    $Content | Set-Content -Path $TargetFile
} else {
    $Template = @"
---
name: $Name
description: Enter a short description here
license: MIT
metadata:
  version: "1.0.0"
  triggers: trigger1, trigger2
---

# $Name

## Role Definition
Define the role of the agent when this skill is active.

## When to Use This Skill
Describe scenarios where this skill applies.

## Reference Guide
List of references or sub-tasks.
"@
    $Template | Set-Content -Path $TargetFile
}

Write-Host "✅ Skill '$Name' created successfully in $TargetDir" -ForegroundColor Green
