# update_arvizyos_plus_status.ps1
# Purpose:
# Update Arvizy repository documentation after ArvizyOS+ promotion.
#
# Updates:
# - current_status.md / CURRENT_STATUS.md
# - progress_log.md / PROGRESS_LOG.md
#
# Safe behavior:
# - Finds common repo paths automatically.
# - Creates timestamped backups.
# - Uses BEGIN/END markers to avoid duplicate blocks.
# - Does not commit automatically.
# - Shows git status and diff after update.

$ErrorActionPreference = "Stop"

Write-Host "=== ArvizyOS+ Status Documentation Update ===" -ForegroundColor Cyan

# -----------------------------
# Helper functions
# -----------------------------

function Resolve-FirstExistingPath {
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$Candidates,

        [Parameter(Mandatory=$true)]
        [string]$Label
    )

    foreach ($candidate in $Candidates) {
        if (Test-Path $candidate) {
            $resolved = (Resolve-Path $candidate).Path
            Write-Host "Found ${Label}: $resolved" -ForegroundColor Green
            return $resolved
        }
    }

    Write-Host "Could not find ${Label} from candidates:" -ForegroundColor Red
    foreach ($candidate in $Candidates) {
        Write-Host "  - $candidate" -ForegroundColor Yellow
    }

    throw "Missing required file: $Label"
}

function Backup-File {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path
    )

    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    $backupPath = "$Path.bak_$timestamp"
    Copy-Item -Path $Path -Destination $backupPath -Force
    Write-Host "Backup created: $backupPath" -ForegroundColor DarkGray
}

function Replace-MarkedBlock {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,

        [Parameter(Mandatory=$true)]
        [string]$BeginMarker,

        [Parameter(Mandatory=$true)]
        [string]$EndMarker,

        [Parameter(Mandatory=$true)]
        [string]$NewBlock
    )

    $content = Get-Content -Path $Path -Raw

    $escapedBegin = [regex]::Escape($BeginMarker)
    $escapedEnd = [regex]::Escape($EndMarker)
    $pattern = "(?s)\r?\n?$escapedBegin.*?$escapedEnd\r?\n?"

    if ($content -match $escapedBegin) {
        $updated = [regex]::Replace($content, $pattern, "`r`n$NewBlock`r`n")
        Write-Host "Existing marked block replaced in $Path" -ForegroundColor Green
    }
    else {
        $updated = $content.TrimEnd() + "`r`n`r`n" + $NewBlock + "`r`n"
        Write-Host "New marked block appended to $Path" -ForegroundColor Green
    }

    Set-Content -Path $Path -Value $updated -Encoding UTF8
}

# -----------------------------
# Repo sanity check
# -----------------------------

if (-not (Test-Path ".git")) {
    throw "This script must be run from the root of the arvizy Git repository."
}

Write-Host "`nCurrent Git status before update:" -ForegroundColor Cyan
git status --short

# -----------------------------
# Locate documentation files
# -----------------------------

$currentStatusCandidates = @(
    ".\CURRENT_STATUS.md",
    ".\current_status.md",
    ".\00_docs\status_and_project\CURRENT_STATUS.md",
    ".\00_docs\status_and_project\current_status.md",
    ".\00_docs\CURRENT_STATUS.md",
    ".\00_docs\current_status.md"
)

$progressLogCandidates = @(
    ".\PROGRESS_LOG.md",
    ".\progress_log.md",
    ".\00_docs\PROGRESS_LOG.md",
    ".\00_docs\progress_log.md",
    ".\00_docs\status_and_project\PROGRESS_LOG.md",
    ".\00_docs\status_and_project\progress_log.md"
)

$currentStatusPath = Resolve-FirstExistingPath -Candidates $currentStatusCandidates -Label "current status document"
$progressLogPath = Resolve-FirstExistingPath -Candidates $progressLogCandidates -Label "progress log document"

# -----------------------------
# Backup files
# -----------------------------

Write-Host "`nCreating backups..." -ForegroundColor Cyan
Backup-File -Path $currentStatusPath
Backup-File -Path $progressLogPath

# -----------------------------
# Content blocks
# -----------------------------

$currentStatusBegin = "<!-- BEGIN ARVIZYOS_PLUS_STATUS_UPDATE -->"
$currentStatusEnd = "<!-- END ARVIZYOS_PLUS_STATUS_UPDATE -->"

$currentStatusBlock = @"
$currentStatusBegin

## Latest Status Update — ArvizyOS+

Date: 2026-05-20

### Status

```text
ArvizyOS+ = DEFAULT FOR BI ARCHITECTURE WORKFLOW
ArvizyOS = STABLE GOVERNANCE BASELINE / FALLBACK
```

### Summary

ArvizyOS+ has been promoted from experimental candidate to the default agent for BI architecture-heavy workflows after controlled A/B testing against baseline ArvizyOS.

### Promotion Basis

ArvizyOS+ was tested against ArvizyOS across five BI workflow scenarios:

```text
1. Semantic Model Readiness
2. Open BC Count by PIC
3. General BI Dashboard Readiness
4. SQL vs DAX Responsibility
5. Power BI Relationship Risk
```

Final A/B test result:

```text
ArvizyOS  = 222 / 250
ArvizyOS+ = 247 / 250
```

### Accepted Scope

ArvizyOS+ is now the default agent for:

```text
BI solution architecture
SQL mart design review
Semantic model design review
Power BI relationship risk review
DAX evaluation-context review
Measure redundancy review
Visual behavior validation
Power BI implementation audit
BI performance review
Architecture final review
```

### Governance Boundary

This promotion does not approve any project phase or BI implementation by itself.

The following still require direct evidence:

```text
Power BI semantic model readiness
Relationship readiness
DAX readiness
KPI reconciliation
Phase 12 completion
Commit readiness
Production/reporting readiness
```

### Evidence Rule Remains Active

```text
No evidence, no approval.
No validation, no status upgrade.
No grain, no architecture approval.
No relationship validation, no DAX approval.
No KPI reconciliation, no reporting readiness.
No git evidence, no commit approval.
```

### Current Repo State

```text
ArvizyOS+ experimental structure is merged into main.
A/B test log is documented.
Acceptance result is documented.
Promotion decision record is documented.
Main branch is clean and up to date at the time of this update.
```

$currentStatusEnd
"@

$progressLogBegin = "<!-- BEGIN ARVIZYOS_PLUS_PROGRESS_ENTRY -->"
$progressLogEnd = "<!-- END ARVIZYOS_PLUS_PROGRESS_ENTRY -->"

$progressLogBlock = @"
$progressLogBegin

## 2026-05-20 — ArvizyOS+ Promotion to Default BI Architecture Workflow

### Progress Type

```text
Agent architecture enhancement
```

### Summary

ArvizyOS+ has been promoted from experimental candidate to the default agent for BI architecture-heavy workflows after five controlled A/B tests against baseline ArvizyOS.

### What Changed

```text
ArvizyOS+ experimental structure was created.
BI Architecture Extension was added.
A/B comparison test suite was executed.
Acceptance result was documented.
Promotion decision record was documented.
ArvizyOS+ status was upgraded to DEFAULT FOR BI ARCHITECTURE WORKFLOW.
```

### A/B Test Result

| Test | Topic | ArvizyOS | ArvizyOS+ | Result |
|---|---|---:|---:|---|
| 1 | Semantic Model Readiness | 40 / 50 | 49 / 50 | ArvizyOS+ wins |
| 2 | Open BC Count by PIC | 43 / 50 | 50 / 50 | ArvizyOS+ wins |
| 3 | General BI Dashboard Readiness | 44 / 50 | 49 / 50 | ArvizyOS+ wins |
| 4 | SQL vs DAX Responsibility | 47 / 50 | 49 / 50 | ArvizyOS+ wins |
| 5 | Power BI Relationship Risk | 48 / 50 | 50 / 50 | ArvizyOS+ wins |

### Total Score

```text
ArvizyOS  = 222 / 250
ArvizyOS+ = 247 / 250
```

### Decision

```text
ArvizyOS+ = DEFAULT FOR BI ARCHITECTURE WORKFLOW
ArvizyOS = STABLE GOVERNANCE BASELINE / FALLBACK
```

### Accepted Use Case

ArvizyOS+ should be used as the default agent for:

```text
SQL mart design review
Semantic model design review
Power BI relationship risk review
DAX evaluation-context review
Measure redundancy review
Visual behavior validation
Power BI implementation audit
BI performance review
Architecture final review
```

### Important Boundary

This decision does not mean finance_ops_dev Phase 12 or any Power BI implementation is approved.

Project readiness still requires:

```text
.bim or semantic model export
relationship screenshot or metadata
loaded table list
grain definition
dimension key uniqueness validation
orphan row validation
final measure inventory
KPI SQL vs Power BI reconciliation
visual behavior validation
git evidence for commit/final review
```

### Related Files

```text
06_experimental/arvizyos_plus/06_acceptance_result.md
06_experimental/arvizyos_plus/08_ab_test_run_log.md
06_experimental/arvizyos_plus/10_promotion_decision_record.md
```

### Commit Reference

```text
30dfa8a Merge branch 'feature/arvizyos-plus-experimental'
```

### Current Risk Level

```text
LOW for ArvizyOS+ agent structure after A/B testing
MEDIUM for future BI implementation until semantic model, relationship, DAX, and reconciliation evidence are provided
```

### Next Recommended Work

```text
Use ArvizyOS+ for future BI architecture-heavy reviews.
Keep ArvizyOS baseline for governance fallback and regression comparison.
Do not approve finance_ops_dev Power BI readiness without actual model and validation evidence.
```

$progressLogEnd
"@

# -----------------------------
# Apply updates
# -----------------------------

Write-Host "`nUpdating documentation..." -ForegroundColor Cyan

Replace-MarkedBlock `
    -Path $currentStatusPath `
    -BeginMarker $currentStatusBegin `
    -EndMarker $currentStatusEnd `
    -NewBlock $currentStatusBlock

Replace-MarkedBlock `
    -Path $progressLogPath `
    -BeginMarker $progressLogBegin `
    -EndMarker $progressLogEnd `
    -NewBlock $progressLogBlock

# -----------------------------
# Review changes
# -----------------------------

Write-Host "`nUpdated files:" -ForegroundColor Cyan
Write-Host "  $currentStatusPath"
Write-Host "  $progressLogPath"

Write-Host "`nGit status after update:" -ForegroundColor Cyan
git status --short

Write-Host "`nDiff stat:" -ForegroundColor Cyan
git diff --stat -- "$currentStatusPath" "$progressLogPath"

Write-Host "`nNext commands if the diff is correct:" -ForegroundColor Yellow
Write-Host "git add `"$currentStatusPath`" `"$progressLogPath`""
Write-Host "git status"
Write-Host "git diff --cached --stat"
Write-Host "git commit -m `"docs: update status for ArvizyOS+ promotion`""
Write-Host "git push origin main"
