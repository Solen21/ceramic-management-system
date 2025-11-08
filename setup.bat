@echo off
echo ===================================================
echo  Ceramic Management System - One-Time Setup
echo ===================================================

REM Check if Python is installed and available in PATH
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Python is not installed or not found in your PATH.
    echo Please install Python 3 and ensure it's added to your system's PATH.
    pause
    exit /b
)

echo [1/4] Creating virtual environment in 'venv' folder...
if not exist venv (
    python -m venv venv
) else (
    echo Virtual environment already exists. Skipping.
)

echo [2/4] Installing required Python packages...
call venv\Scripts\pip.exe install -r requirements.txt

echo [3/4] Setting up the database and populating initial data...
call venv\Scripts\python.exe setup_database.py

echo [4/4] Setup complete! You can now run start_server.bat to launch the application.
echo.
pause