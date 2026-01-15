
:: Contact John O'Donovan with any questions regarding this script
@echo off
setlocal enabledelayedexpansion

echo ======================================
echo Extracting all .tgz files (recursive)
echo ======================================
echo.

REM Recursively find *.tgz and extract them
for /r %%F in (*.tgz) do (
    echo Processing %%F ...
    tar -xvf "%%F" -C "%%~dpF"
)

echo.
echo ======================================
echo Collecting all CSV files into .\all
echo ======================================

set destDir=.\all

REM Create the destination directory if it doesn't exist
if not exist "%destDir%" (
    mkdir "%destDir%"
)

REM Use PowerShell to find & copy CSV files (recursive depth 8)
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$sourceDir = './';" ^
    "Get-ChildItem -Path $sourceDir -Recurse -Depth 8 -Filter '*.csv' | ForEach-Object { Copy-Item -Path $_.FullName -Destination '%destDir%' -Force };" ^
    "Write-Host 'CSV file transfer complete';"

echo.
echo Done!
pause

