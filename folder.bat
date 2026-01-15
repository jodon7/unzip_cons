:: Contact John O'Donovan with any questions regarding this script
@echo off
set destDir=.\all

REM Create the destination directory if it doesn't exist
if not exist "%destDir%" (
    mkdir "%destDir%"
)

REM Use PowerShell to perform the file search and copy operation
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$sourceDir = './';" ^
    "Get-ChildItem -Path $sourceDir -Recurse -Depth 8 -Filter '*.csv' | ForEach-Object { Copy-Item -Path $_.FullName -Destination '%destDir%' };" ^
    "Write-Host 'File transfer complete';"

pause
