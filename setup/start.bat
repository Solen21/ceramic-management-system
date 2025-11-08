@echo off
color a
REM =================================================
REM Smart Setup & Run for Ceramic Management System
REM =================================================

REM --- Change this path to your project folder ---
set PROJECT_PATH=C:\Users\hp\OneDrive\Documents\project\ceramic-management-system

cd "%PROJECT_PATH%"

REM --- Create virtual environment if not exists ---
if not exist venv (
    python -m venv venv
    echo Virtual environment created.
) else (
    echo Virtual environment already exists.
)

REM --- Activate virtual environment ---
call venv\Scripts\activate

REM --- Install required packages ---
pip install --upgrade pip
pip install flask flask_sqlalchemy pymysql flask-login flask-wtf

REM --- Freeze installed packages ---
pip freeze > requirements.txt

REM --- Run Flask app ---
echo Running Flask App...
python run.py

pause
