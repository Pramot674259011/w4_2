@echo off
REM push_changes.bat — interactive helper for committing and pushing changes
REM Usage: run from the repository folder (double-click or from cmd.exe)

cd /d "%~dp0"
echo Working directory: %CD%

:: show git status first
git status
echo.
set /p SKIPCOMMIT=Do you want to add & commit changes now? (Y/n): 
if /I "%SKIPCOMMIT%"=="n" goto pushonly

set /p BRANCH=Branch to push [main]: 
if "%BRANCH%"=="" set BRANCH=main

echo Adding files...
git add w4_2.html favicon.svg README.md .github\workflows\pages.yml

set /p MSG=Commit message (leave blank for default): 
if "%MSG%"=="" set MSG=Update site

git commit -m "%MSG%"

:pushonly
set /p REMOTE=Remote name or URL (leave blank to use 'origin'): 
if "%REMOTE%"=="" set REMOTE=origin

echo Pushing to %REMOTE%/%BRANCH% ...
git push %REMOTE% %BRANCH%
echo.
echo Done. If push failed, check remote and authentication.
pause