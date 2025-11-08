@echo off
echo ===================================================
echo  Starting Ceramic Management System Server
echo ===================================================

REM Check if the virtual environment exists
if not exist venv (
    echo Error: Virtual environment not found.
    echo Please run the setup.bat file first.
    pause
    exit /b
)

echo Activating virtual environment...
set FLASK_APP=run.py

echo Starting Flask server...
echo You can access the application at http://127.0.0.1:5000
call venv\Scripts\flask.exe run

echo.
echo The server has stopped. Press any key to exit.
pause