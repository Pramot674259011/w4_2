@echo off
REM push_changes_debug.bat — runs push_changes.bat and logs output to push_changes_log.txt
cd /d "%~dp0"
echo Running push_changes.bat and saving output to push_changes_log.txt
(
	echo ==== START TIME: %DATE% %TIME% ====
	echo Working directory: %CD%
	echo.
	echo --- git version ---
	git --version
	echo.
	echo --- git status ---
	git status
	echo.
	echo --- Running push_changes.bat ---
	call push_changes.bat
	echo.
	echo ==== END TIME: %DATE% %TIME% ====
) > push_changes_log.txt 2>&1
echo Log written to push_changes_log.txt
echo (open the file and paste its contents here or attach it)
pause