@echo off
echo ========================================================
echo   Push NextStep India to GitHub
echo ========================================================
echo.

where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in your system PATH.
    echo Please download and install Git from: https://git-scm.com/download/win
    echo After installing, reopen this script.
    echo.
    pause
    exit /b
)

echo Initializing local repository...
if not exist .git (
    git init
    git branch -M main
)

git add .
git commit -m "Initial commit: NextStep India 24/7 Career & Admission Guide"

echo.
set /p REPO_URL="Enter your GitHub Repository URL (e.g. https://github.com/username/nextstep-india.git): "

if "%REPO_URL%"=="" (
    echo No URL entered. Aborted.
    pause
    exit /b
)

git remote remove origin 2>nul
git remote add origin %REPO_URL%
git push -u origin main

echo.
echo ========================================================
echo   Done! Your code has been pushed to GitHub.
echo ========================================================
pause
