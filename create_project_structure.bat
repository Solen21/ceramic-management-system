@echo off
REM =================================================
REM Ceramic/General Product Management System Setup
REM Creates full folder structure and starter files
REM =================================================

REM --- Change this path to your project folder ---
set PROJECT_PATH=C:\Users\hp\OneDrive\Documents\project\ceramic-management-system

echo Creating project structure at %PROJECT_PATH% ...
mkdir "%PROJECT_PATH%"
cd "%PROJECT_PATH%"

REM --- Main folders ---
mkdir app app\models app\routes app\templates app\static\css app\static\js app\static\images app\utils migrations tests database

REM --- App init files ---
echo.>app\__init__.py
echo.>app\models\__init__.py
echo.>app\routes\__init__.py
echo.>app\utils\__init__.py
echo.>config.py
echo.>run.py
echo.>requirements.txt

REM --- Templates folders ---
mkdir app\templates\dashboard
mkdir app\templates\products
mkdir app\templates\purchases
mkdir app\templates\sales
mkdir app\templates\returns
mkdir app\templates\broken
mkdir app\templates\reports
mkdir app\templates\stores
mkdir app\templates\users

REM --- Starter template files ---
type nul > app\templates\base.html
type nul > app\templates\login.html
type nul > app\templates\dashboard\dashboard.html
type nul > app\templates\products\product_list.html
type nul > app\templates\products\product_form.html
type nul > app\templates\purchases\purchase_list.html
type nul > app\templates\sales\sale_list.html
type nul > app\templates\returns\return_list.html
type nul > app\templates\broken\broken_list.html
type nul > app\templates\reports\profit_report.html
type nul > app\templates\stores\store_list.html
type nul > app\templates\users\user_list.html

REM --- Static files ---
type nul > app\static\css\style.css
type nul > app\static\js\script.js

REM --- Utils files ---
type nul > app\utils/calculations.py
type nul > app\utils/notifications.py
type nul > app\utils/helpers.py

echo Project folder structure created successfully!
pause
