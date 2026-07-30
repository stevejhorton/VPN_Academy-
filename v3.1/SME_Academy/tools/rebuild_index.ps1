# SME_Academy rebuild_index.ps1
# Scans modules/ and rebuilds generated/content_index.json (no browser launch)

param()

# Detect academy root from script location (tools/ is one level below root)
$academyRoot = Split-Path -Parent $PSScriptRoot

# ── OS banner ───────────────────────────────────────────────────────────────
if ($IsWindows) {
    $osLabel = "Windows"
} elseif ($IsMacOS) {
    $osLabel = "macOS"
} else {
    $osLabel = "Linux"
}
Write-Host "[SME_Academy] OS: $osLabel"

# ── Scan markdown items from modules/ ───────────────────────────────────────
$modulesDir = Join-Path $academyRoot "modules"
$mdFiles = Get-ChildItem -Path $modulesDir -Recurse -Filter "*.md" -File

$scanned = [System.Collections.Generic.List[object]]::new()

foreach ($file in $mdFiles) {
    $relPath = $file.FullName.Substring($academyRoot.Length).TrimStart([char]'\', [char]'/').Replace('\', '/')

    # Infer module (e.g. modules/empvpn/... -> empvpn)
    $pathParts = $relPath -split '/'
    $moduleId = if ($pathParts.Count -ge 2) { $pathParts[1] } else { "shared" }

    # Infer kind from path segments
    $kind = "document"
    if ($relPath -match '/runbooks/' -or $relPath -match '\\runbooks\\') {
        $kind = "runbook"
    } elseif ($relPath -match '/wiki/' -or $relPath -match '\\wiki\\') {
        $kind = "wiki"
    } elseif ($relPath -match '/training/') {
        $kind = "training"
    } elseif ($relPath -match '/simulations/') {
        $kind = "simulation"
    } elseif ($relPath -match '/splunk/') {
        $kind = "splunk"
    } elseif ($relPath -match '/changes/recipes/') {
        $kind = "recipe"
    } elseif ($relPath -match '/changes/') {
        $kind = "change"
    } elseif ($relPath -match '/library/') {
        $kind = "library"
    }

    # Parse YAML frontmatter (--- block)
    $content = Get-Content -Path $file.FullName -Raw -ErrorAction SilentlyContinue
    $id = $null
    $title = $null
    $tags = @()
    $levels = @()

    if ($content -match '(?s)^---\s*\r?\n(.*?)\r?\n---') {
        $frontmatter = $Matches[1]

        if ($frontmatter -match '(?m)^id:\s*(.+)$') {
            $id = $Matches[1].Trim()
        }
        if ($frontmatter -match '(?m)^title:\s*(.+)$') {
            $title = $Matches[1].Trim()
        }
        if ($frontmatter -match '(?m)^tags:\s*\[(.+)\]') {
            $tags = $Matches[1] -split ',' | ForEach-Object { $_.Trim().Trim('"').Trim("'") } | Where-Object { $_ -ne '' }
        }
        if ($frontmatter -match '(?m)^levels:\s*\[(.+)\]') {
            $levels = $Matches[1] -split ',' | ForEach-Object { $_.Trim().Trim('"').Trim("'") } | Where-Object { $_ -ne '' }
        }
    }

    # Fall back to filename stem if id/title not in frontmatter
    if (-not $id) {
        $id = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    }
    if (-not $title) {
        $title = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    }

    $item = [ordered]@{
        kind   = $kind
        module = $moduleId
        id     = $id
        title  = $title
        path   = $relPath
        tags   = @($tags)
        levels = @($levels)
    }
    $scanned.Add($item)
}

$scannedCount = $scanned.Count
Write-Host "[SME_Academy] Scanned $scannedCount markdown items from modules/"

# ── Preserve external/binary entries from existing index ────────────────────
$indexPath = Join-Path $academyRoot "generated/content_index.json"
$preserved = [System.Collections.Generic.List[object]]::new()

if (Test-Path $indexPath) {
    $existing = Get-Content -Path $indexPath -Raw | ConvertFrom-Json
    foreach ($entry in $existing) {
        if ($entry.source -eq "external" -or $entry.type -eq "pdf" -or $entry.type -eq "config" -or $entry.type -eq "external") {
            $preserved.Add($entry)
        }
    }
}

$preservedCount = $preserved.Count
Write-Host "[SME_Academy] Preserved $preservedCount external/binary items from existing index"

# ── Merge: scanned wins on id conflict ──────────────────────────────────────
$scannedIds = $scanned | ForEach-Object { $_.id }
$merged = [System.Collections.Generic.List[object]]::new()

foreach ($item in $scanned) {
    $merged.Add($item)
}
foreach ($item in $preserved) {
    if ($item.id -notin $scannedIds) {
        $merged.Add($item)
    }
}

$totalCount = $merged.Count

# ── Write generated/content_index.json ──────────────────────────────────────
$merged | ConvertTo-Json -Depth 10 | Set-Content -Path $indexPath -Encoding UTF8
Write-Host "[SME_Academy] Index rebuilt: $totalCount total items -> generated/content_index.json"
