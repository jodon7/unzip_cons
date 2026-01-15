
@echo off
setlocal enabledelayedexpansion

echo Extracting all .tgz files in %cd%
echo.

for %%F in (*.tgz) do (
    echo Processing %%F ...
    tar -xvf "%%F"
)

echo.
echo Done!
pause

