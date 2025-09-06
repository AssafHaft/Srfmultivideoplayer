$ErrorActionPreference = 'Stop'

# Resolve the Videos folder relative to this script
$videosFolder = Join-Path $PSScriptRoot 'Videos'
if (-not (Test-Path -Path $videosFolder -PathType Container)) {
  Write-Error "Videos folder not found at: $videosFolder"
}

# File types to include
$extensions = @('.mp4', '.m4v', '.mov', '.webm')

# Collect files and sort by Name (alphabetical). To control order, prefix names with 01-, 02-, etc.
$files = Get-ChildItem -Path $videosFolder -File |
  Where-Object { $extensions -contains $_.Extension.ToLowerInvariant() } |
  Sort-Object Name

$names = $files | ForEach-Object { $_.Name }
$dest  = Join-Path $videosFolder 'videos.json'

# Convert to formatted JSON (UTF-8 without BOM)
$json = $names | ConvertTo-Json -Depth 3
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($dest, $json + [Environment]::NewLine, $utf8NoBom)

Write-Host "Found $($names.Count) video file(s)." -ForegroundColor Cyan
Write-Host "Wrote playlist to: $dest" -ForegroundColor Green
if ($names.Count -gt 0) {
  Write-Host "Order is alphabetical by filename. To control order, prefix filenames like '01 - Welcome.mp4', '02 - News.mp4'." -ForegroundColor DarkGray
}
