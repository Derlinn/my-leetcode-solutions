param(
    [Parameter(Mandatory = $true)]
    [string]$Id,

    [Parameter(Mandatory = $true)]
    [string]$Slug,

    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$cleanSlug = $Slug.Trim().ToLower() -replace '[^a-z0-9-]', '-' -replace '-{2,}', '-'
$folderName = "$Id-$cleanSlug"
$targetDir = Join-Path $RepoRoot "solutions/go/$folderName"
$templateDir = Join-Path $RepoRoot "templates/problem"

if (Test-Path $targetDir) {
    Write-Error "Problem folder already exists: $targetDir"
    exit 1
}

New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
Copy-Item -Path (Join-Path $templateDir "solution.go") -Destination (Join-Path $targetDir "solution.go")
Copy-Item -Path (Join-Path $templateDir "solution_test.go") -Destination (Join-Path $targetDir "solution_test.go")
Copy-Item -Path (Join-Path $templateDir "notes.md") -Destination (Join-Path $targetDir "notes.md")

& (Join-Path $PSScriptRoot "update-readme-index.ps1") -RepoRoot $RepoRoot

Write-Host "Created $folderName"
