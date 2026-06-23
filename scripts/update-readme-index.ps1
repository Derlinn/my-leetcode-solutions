param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$readmePath = Join-Path $RepoRoot "README.md"
$goRoot = Join-Path $RepoRoot "solutions/go"

if (-not (Test-Path $readmePath)) {
    Write-Error "README.md not found at $readmePath"
    exit 1
}

if (-not (Test-Path $goRoot)) {
    Write-Error "solutions/go directory not found at $goRoot"
    exit 1
}

$dirs = Get-ChildItem -Path $goRoot -Directory | Sort-Object Name
$rows = @()

foreach ($dir in $dirs) {
    if ($dir.Name -match '^(\d+)-(.+)$') {
        $id = $matches[1]
        $slug = $matches[2]
        $title = ($slug -split '-') | ForEach-Object {
            if ($_.Length -gt 1) {
                $_.Substring(0, 1).ToUpper() + $_.Substring(1)
            } else {
                $_.ToUpper()
            }
        }
        $titleText = ($title -join ' ')
        $solutionPath = "solutions/go/$($dir.Name)/solution.go"
        $rows += "| $id | $titleText | [solution.go]($solutionPath) |"
    }
}

if ($rows.Count -eq 0) {
    $rows += "| - | No solutions yet | - |"
}

$table = @(
    "Solved: $($rows.Count)",
    "",
    "| ID | Title | Link |",
    "| --- | --- | --- |"
) + $rows

$startMarker = "<!-- index:start -->"
$endMarker = "<!-- index:end -->"
$readme = Get-Content -Path $readmePath -Raw

$pattern = "(?s)$([regex]::Escape($startMarker)).*?$([regex]::Escape($endMarker))"
$replacement = "$startMarker`r`n" + ($table -join "`r`n") + "`r`n$endMarker"

if ($readme -notmatch [regex]::Escape($startMarker) -or $readme -notmatch [regex]::Escape($endMarker)) {
    Write-Error "README.md must contain $startMarker and $endMarker markers."
    exit 1
}

$updated = [regex]::Replace($readme, $pattern, $replacement)
Set-Content -Path $readmePath -Value $updated -NoNewline
Write-Host "README index updated."
