#!/usr/bin/env pwsh

$ErrorActionPreference = 'Stop'

$Source = $PSScriptRoot
$Dest   = Join-Path $HOME '.config/kilo'

Write-Host 'Installing Kilo config...'

New-Item -ItemType Directory -Force -Path $Dest | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Dest 'instructions') | Out-Null

Copy-Item -Path (Join-Path $Source 'kilo.jsonc') -Destination $Dest -Force
Copy-Item -Path (Join-Path $Source 'instructions/*') -Destination (Join-Path $Dest 'instructions') -Recurse -Force

Write-Host 'All done !'