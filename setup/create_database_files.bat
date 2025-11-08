@echo off
REM =================================================
REM Create all 20 database SQL files for Product Management System
REM Fully working 01-20 tables
REM =================================================

set DB_PATH=C:\Users\hp\OneDrive\Documents\project\ceramic-management-system\database
mkdir "%DB_PATH%"

REM ===============================
REM 01_roles_and_users.sql
REM ===============================
echo DROP TABLE IF EXISTS users;>"%DB_PATH%\01_roles_and_users.sql"
echo DROP TABLE IF EXISTS roles;>>"%DB_PATH%\01_roles_and_users.sql"
echo CREATE TABLE roles (>>"%DB_PATH%\01_roles_and_users.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\01_roles_and_users.sql"
echo    name VARCHAR(50) NOT NULL UNIQUE,>>"%DB_PATH%\01_roles_and_users.sql"
echo    description VARCHAR(255) NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP>>"%DB_PATH%\01_roles_and_users.sql"
echo );>>"%DB_PATH%\01_roles_and_users.sql"

echo CREATE TABLE users (>>"%DB_PATH%\01_roles_and_users.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\01_roles_and_users.sql"
echo    username VARCHAR(50) NOT NULL UNIQUE,>>"%DB_PATH%\01_roles_and_users.sql"
echo    password_hash VARCHAR(255) NOT NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    full_name VARCHAR(100) NOT NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    role_id INT NOT NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    store_id INT NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    email VARCHAR(100) NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    phone VARCHAR(20) NULL,>>"%DB_PATH%\01_roles_and_users.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\01_roles_and_users.sql"
echo    FOREIGN KEY (role_id) REFERENCES roles(id)>>"%DB_PATH%\01_roles_and_users.sql"
echo );>>"%DB_PATH%\01_roles_and_users.sql"

REM ===============================
REM 02_stores.sql
REM ===============================
echo DROP TABLE IF EXISTS stores;>"%DB_PATH%\02_stores.sql"
echo CREATE TABLE stores (>>"%DB_PATH%\02_stores.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\02_stores.sql"
echo    name VARCHAR(100) NOT NULL,>>"%DB_PATH%\02_stores.sql"
echo    location VARCHAR(255) NULL,>>"%DB_PATH%\02_stores.sql"
echo    capacity INT DEFAULT 0,>>"%DB_PATH%\02_stores.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP>>"%DB_PATH%\02_stores.sql"
echo );>>"%DB_PATH%\02_stores.sql"

REM ===============================
REM 03_product_suppliers.sql
REM ===============================
echo DROP TABLE IF EXISTS product_suppliers;>"%DB_PATH%\03_product_suppliers.sql"
echo CREATE TABLE product_suppliers (>>"%DB_PATH%\03_product_suppliers.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\03_product_suppliers.sql"
echo    name VARCHAR(100) NOT NULL,>>"%DB_PATH%\03_product_suppliers.sql"
echo    code VARCHAR(50) NOT NULL UNIQUE,>>"%DB_PATH%\03_product_suppliers.sql"
echo    type ENUM('Company','Merchant','Importer') DEFAULT 'Company',>>"%DB_PATH%\03_product_suppliers.sql"
echo    contact_info VARCHAR(255),>>"%DB_PATH%\03_product_suppliers.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP>>"%DB_PATH%\03_product_suppliers.sql"
echo );>>"%DB_PATH%\03_product_suppliers.sql"

REM ===============================
REM 04_products.sql
REM ===============================
echo DROP TABLE IF EXISTS products;>"%DB_PATH%\04_products.sql"
echo CREATE TABLE products (>>"%DB_PATH%\04_products.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\04_products.sql"
echo    name VARCHAR(100) NOT NULL,>>"%DB_PATH%\04_products.sql"
echo    supplier_id INT NULL,>>"%DB_PATH%\04_products.sql"
echo    purchase_price DECIMAL(10,2) NOT NULL,>>"%DB_PATH%\04_products.sql"
echo    transport_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\04_products.sql"
echo    loading_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\04_products.sql"
echo    unloading_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\04_products.sql"
echo    other_expenses DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\04_products.sql"
echo    total_cost DECIMAL(10,2) GENERATED ALWAYS AS (purchase_price + transport_fee + loading_fee + unloading_fee + other_expenses) STORED,>>"%DB_PATH%\04_products.sql"
echo    sell_price DECIMAL(10,2) NOT NULL,>>"%DB_PATH%\04_products.sql"
echo    status ENUM('Active','Unteach') DEFAULT 'Active',>>"%DB_PATH%\04_products.sql"
echo    unteach_start_date DATETIME NULL,>>"%DB_PATH%\04_products.sql"
echo    unteach_duration INT NULL,>>"%DB_PATH%\04_products.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\04_products.sql"
echo    FOREIGN KEY (supplier_id) REFERENCES product_suppliers(id)>>"%DB_PATH%\04_products.sql"
echo );>>"%DB_PATH%\04_products.sql"

REM ===============================
REM 05_stock.sql
REM ===============================
echo DROP TABLE IF EXISTS stock;>"%DB_PATH%\05_stock.sql"
echo CREATE TABLE stock (>>"%DB_PATH%\05_stock.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\05_stock.sql"
echo    store_id INT NOT NULL,>>"%DB_PATH%\05_stock.sql"
echo    product_id INT NOT NULL,>>"%DB_PATH%\05_stock.sql"
echo    quantity INT DEFAULT 0,>>"%DB_PATH%\05_stock.sql"
echo    broken INT DEFAULT 0,>>"%DB_PATH%\05_stock.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\05_stock.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\05_stock.sql"
echo    UNIQUE KEY store_product_unique (store_id, product_id)>>"%DB_PATH%\05_stock.sql"
echo );>>"%DB_PATH%\05_stock.sql"

REM ===============================
REM 06_purchases.sql
REM ===============================
echo DROP TABLE IF EXISTS purchases;>"%DB_PATH%\06_purchases.sql"
echo CREATE TABLE purchases (>>"%DB_PATH%\06_purchases.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\06_purchases.sql"
echo    product_id INT NOT NULL,>>"%DB_PATH%\06_purchases.sql"
echo    store_id INT NOT NULL,>>"%DB_PATH%\06_purchases.sql"
echo    supplier_id INT NULL,>>"%DB_PATH%\06_purchases.sql"
echo    quantity INT NOT NULL,>>"%DB_PATH%\06_purchases.sql"
echo    transport_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\06_purchases.sql"
echo    loading_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\06_purchases.sql"
echo    unloading_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\06_purchases.sql"
echo    other_expenses DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\06_purchases.sql"
echo    purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\06_purchases.sql"
echo    worker_id INT,>>"%DB_PATH%\06_purchases.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\06_purchases.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\06_purchases.sql"
echo    FOREIGN KEY (supplier_id) REFERENCES product_suppliers(id),>>"%DB_PATH%\06_purchases.sql"
echo    FOREIGN KEY (worker_id) REFERENCES users(id)>>"%DB_PATH%\06_purchases.sql"
echo );>>"%DB_PATH%\06_purchases.sql"

REM ===============================
REM 07_sales.sql
REM ===============================
echo DROP TABLE IF EXISTS sales;>"%DB_PATH%\07_sales.sql"
echo CREATE TABLE sales (>>"%DB_PATH%\07_sales.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\07_sales.sql"
echo    product_id INT NOT NULL,>>"%DB_PATH%\07_sales.sql"
echo    store_id INT NOT NULL,>>"%DB_PATH%\07_sales.sql"
echo    quantity INT NOT NULL,>>"%DB_PATH%\07_sales.sql"
echo    sell_price DECIMAL(10,2) NOT NULL,>>"%DB_PATH%\07_sales.sql"
echo    loading_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\07_sales.sql"
echo    unloading_fee DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\07_sales.sql"
echo    customer_name VARCHAR(100),>>"%DB_PATH%\07_sales.sql"
echo    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\07_sales.sql"
echo    worker_id INT,>>"%DB_PATH%\07_sales.sql"
echo    mini_manager_id INT NULL,>>"%DB_PATH%\07_sales.sql"
echo    manager_id INT NULL,>>"%DB_PATH%\07_sales.sql"
echo    approved_by_admin BOOLEAN DEFAULT FALSE,>>"%DB_PATH%\07_sales.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\07_sales.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\07_sales.sql"
echo    FOREIGN KEY (worker_id) REFERENCES users(id),>>"%DB_PATH%\07_sales.sql"
echo    FOREIGN KEY (mini_manager_id) REFERENCES users(id),>>"%DB_PATH%\07_sales.sql"
echo    FOREIGN KEY (manager_id) REFERENCES users(id)>>"%DB_PATH%\07_sales.sql"
echo );>>"%DB_PATH%\07_sales.sql"

REM ===============================
REM 08_returns.sql
REM ===============================
echo DROP TABLE IF EXISTS returns;>"%DB_PATH%\08_returns.sql"
echo CREATE TABLE returns (>>"%DB_PATH%\08_returns.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\08_returns.sql"
echo    sale_id INT NOT NULL,>>"%DB_PATH%\08_returns.sql"
echo    quantity INT NOT NULL,>>"%DB_PATH%\08_returns.sql"
echo    reason VARCHAR(255),>>"%DB_PATH%\08_returns.sql"
echo    return_date DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\08_returns.sql"
echo    approved_by_admin BOOLEAN DEFAULT FALSE,>>"%DB_PATH%\08_returns.sql"
echo    refund_amount DECIMAL(10,2) DEFAULT 0,>>"%DB_PATH%\08_returns.sql"
echo    FOREIGN KEY (sale_id) REFERENCES sales(id)>>"%DB_PATH%\08_returns.sql"
echo );>>"%DB_PATH%\08_returns.sql"

REM ===============================
REM 09_broken_items.sql
REM ===============================
echo DROP TABLE IF EXISTS broken_items;>"%DB_PATH%\09_broken_items.sql"
echo CREATE TABLE broken_items (>>"%DB_PATH%\09_broken_items.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\09_broken_items.sql"
echo    product_id INT NOT NULL,>>"%DB_PATH%\09_broken_items.sql"
echo    store_id INT NOT NULL,>>"%DB_PATH%\09_broken_items.sql"
echo    quantity INT NOT NULL,>>"%DB_PATH%\09_broken_items.sql"
echo    reason VARCHAR(255),>>"%DB_PATH%\09_broken_items.sql"
echo    reported_by INT,>>"%DB_PATH%\09_broken_items.sql"
echo    report_date DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\09_broken_items.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\09_broken_items.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\09_broken_items.sql"
echo    FOREIGN KEY (reported_by) REFERENCES users(id)>>"%DB_PATH%\09_broken_items.sql"
echo );>>"%DB_PATH%\09_broken_items.sql"

REM ===============================
REM 10_expenses.sql
REM ===============================
echo DROP TABLE IF EXISTS expenses;>"%DB_PATH%\10_expenses.sql"
echo CREATE TABLE expenses (>>"%DB_PATH%\10_expenses.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\10_expenses.sql"
echo    store_id INT NULL,>>"%DB_PATH%\10_expenses.sql"
echo    product_id INT NULL,>>"%DB_PATH%\10_expenses.sql"
echo    amount DECIMAL(10,2) NOT NULL,>>"%DB_PATH%\10_expenses.sql"
echo    category VARCHAR(50),>>"%DB_PATH%\10_expenses.sql"
echo    description VARCHAR(255),>>"%DB_PATH%\10_expenses.sql"
echo    created_by INT,>>"%DB_PATH%\10_expenses.sql"
echo    expense_date DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\10_expenses.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\10_expenses.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\10_expenses.sql"
echo    FOREIGN KEY (created_by) REFERENCES users(id)>>"%DB_PATH%\10_expenses.sql"
echo );>>"%DB_PATH%\10_expenses.sql"

REM ===============================
REM 11_alerts.sql
REM ===============================
echo DROP TABLE IF EXISTS alerts;>"%DB_PATH%\11_alerts.sql"
echo CREATE TABLE alerts (>>"%DB_PATH%\11_alerts.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\11_alerts.sql"
echo    product_id INT NOT NULL,>>"%DB_PATH%\11_alerts.sql"
echo    store_id INT NOT NULL,>>"%DB_PATH%\11_alerts.sql"
echo    alert_type ENUM('LowStock','Unteach','Return','Broken') NOT NULL,>>"%DB_PATH%\11_alerts.sql"
echo    message VARCHAR(255),>>"%DB_PATH%\11_alerts.sql"
echo    is_read BOOLEAN DEFAULT FALSE,>>"%DB_PATH%\11_alerts.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\11_alerts.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\11_alerts.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id)>>"%DB_PATH%\11_alerts.sql"
echo );>>"%DB_PATH%\11_alerts.sql"

REM ===============================
REM 12_messages.sql
REM ===============================
echo DROP TABLE IF EXISTS messages;>"%DB_PATH%\12_messages.sql"
echo CREATE TABLE messages (>>"%DB_PATH%\12_messages.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\12_messages.sql"
echo    sender_id INT NOT NULL,>>"%DB_PATH%\12_messages.sql"
echo    receiver_id INT NOT NULL,>>"%DB_PATH%\12_messages.sql"
echo    message_text TEXT NOT NULL,>>"%DB_PATH%\12_messages.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\12_messages.sql"
echo    is_read BOOLEAN DEFAULT FALSE,>>"%DB_PATH%\12_messages.sql"
echo    FOREIGN KEY (sender_id) REFERENCES users(id),>>"%DB_PATH%\12_messages.sql"
echo    FOREIGN KEY (receiver_id) REFERENCES users(id)>>"%DB_PATH%\12_messages.sql"
echo );>>"%DB_PATH%\12_messages.sql"

REM ===============================
REM 13_group_chats.sql
REM ===============================
echo DROP TABLE IF EXISTS group_chats;>"%DB_PATH%\13_group_chats.sql"
echo CREATE TABLE group_chats (>>"%DB_PATH%\13_group_chats.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\13_group_chats.sql"
echo    name VARCHAR(100) NOT NULL,>>"%DB_PATH%\13_group_chats.sql"
echo    store_id INT NULL,>>"%DB_PATH%\13_group_chats.sql"
echo    created_by INT,>>"%DB_PATH%\13_group_chats.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\13_group_chats.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\13_group_chats.sql"
echo    FOREIGN KEY (created_by) REFERENCES users(id)>>"%DB_PATH%\13_group_chats.sql"
echo );>>"%DB_PATH%\13_group_chats.sql"

REM ===============================
REM 14_group_messages.sql
REM ===============================
echo DROP TABLE IF EXISTS group_messages;>"%DB_PATH%\14_group_messages.sql"
echo CREATE TABLE group_messages (>>"%DB_PATH%\14_group_messages.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\14_group_messages.sql"
echo    group_id INT NOT NULL,>>"%DB_PATH%\14_group_messages.sql"
echo    sender_id INT NOT NULL,>>"%DB_PATH%\14_group_messages.sql"
echo    message_text TEXT NOT NULL,>>"%DB_PATH%\14_group_messages.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\14_group_messages.sql"
echo    is_read BOOLEAN DEFAULT FALSE,>>"%DB_PATH%\14_group_messages.sql"
echo    FOREIGN KEY (group_id) REFERENCES group_chats(id),>>"%DB_PATH%\14_group_messages.sql"
echo    FOREIGN KEY (sender_id) REFERENCES users(id)>>"%DB_PATH%\14_group_messages.sql"
echo );>>"%DB_PATH%\14_group_messages.sql"

REM ===============================
REM 15_group_members.sql
REM ===============================
echo DROP TABLE IF EXISTS group_members;>"%DB_PATH%\15_group_members.sql"
echo CREATE TABLE group_members (>>"%DB_PATH%\15_group_members.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\15_group_members.sql"
echo    group_id INT NOT NULL,>>"%DB_PATH%\15_group_members.sql"
echo    user_id INT NOT NULL,>>"%DB_PATH%\15_group_members.sql"
echo    joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\15_group_members.sql"
echo    FOREIGN KEY (group_id) REFERENCES group_chats(id),>>"%DB_PATH%\15_group_members.sql"
echo    FOREIGN KEY (user_id) REFERENCES users(id),>>"%DB_PATH%\15_group_members.sql"
echo    UNIQUE KEY group_user_unique (group_id, user_id)>>"%DB_PATH%\15_group_members.sql"
echo );>>"%DB_PATH%\15_group_members.sql"

REM ===============================
REM 16_audit_log.sql
REM ===============================
echo DROP TABLE IF EXISTS audit_log;>"%DB_PATH%\16_audit_log.sql"
echo CREATE TABLE audit_log (>>"%DB_PATH%\16_audit_log.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\16_audit_log.sql"
echo    user_id INT NOT NULL,>>"%DB_PATH%\16_audit_log.sql"
echo    action VARCHAR(255) NOT NULL,>>"%DB_PATH%\16_audit_log.sql"
echo    table_name VARCHAR(100) NULL,>>"%DB_PATH%\16_audit_log.sql"
echo    record_id INT NULL,>>"%DB_PATH%\16_audit_log.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\16_audit_log.sql"
echo    FOREIGN KEY (user_id) REFERENCES users(id)>>"%DB_PATH%\16_audit_log.sql"
echo );>>"%DB_PATH%\16_audit_log.sql"

REM ===============================
REM 17_transportation.sql
REM ===============================
echo DROP TABLE IF EXISTS transportation;>"%DB_PATH%\17_transportation.sql"
echo CREATE TABLE transportation (>>"%DB_PATH%\17_transportation.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\17_transportation.sql"
echo    product_id INT NOT NULL,>>"%DB_PATH%\17_transportation.sql"
echo    store_id INT NOT NULL,>>"%DB_PATH%\17_transportation.sql"
echo    transport_type ENUM('Import','Delivery') NOT NULL,>>"%DB_PATH%\17_transportation.sql"
echo    fee DECIMAL(10,2) NOT NULL,>>"%DB_PATH%\17_transportation.sql"
echo    worker_id INT NULL,>>"%DB_PATH%\17_transportation.sql"
echo    transport_date DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\17_transportation.sql"
echo    FOREIGN KEY (product_id) REFERENCES products(id),>>"%DB_PATH%\17_transportation.sql"
echo    FOREIGN KEY (store_id) REFERENCES stores(id),>>"%DB_PATH%\17_transportation.sql"
echo    FOREIGN KEY (worker_id) REFERENCES users(id)>>"%DB_PATH%\17_transportation.sql"
echo );>>"%DB_PATH%\17_transportation.sql"

REM ===============================
REM 18_general_settings.sql
REM ===============================
echo DROP TABLE IF EXISTS general_settings;>"%DB_PATH%\18_general_settings.sql"
echo CREATE TABLE general_settings (>>"%DB_PATH%\18_general_settings.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\18_general_settings.sql"
echo    setting_key VARCHAR(100) NOT NULL UNIQUE,>>"%DB_PATH%\18_general_settings.sql"
echo    setting_value TEXT NOT NULL,>>"%DB_PATH%\18_general_settings.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP>>"%DB_PATH%\18_general_settings.sql"
echo );>>"%DB_PATH%\18_general_settings.sql"

REM ===============================
REM 19_graph_data.sql
REM ===============================
echo DROP TABLE IF EXISTS graph_data;>"%DB_PATH%\19_graph_data.sql"
echo CREATE TABLE graph_data (>>"%DB_PATH%\19_graph_data.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\19_graph_data.sql"
echo    graph_type VARCHAR(50) NOT NULL,>>"%DB_PATH%\19_graph_data.sql"
echo    data JSON NOT NULL,>>"%DB_PATH%\19_graph_data.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP>>"%DB_PATH%\19_graph_data.sql"
echo );>>"%DB_PATH%\19_graph_data.sql"

REM ===============================
REM 20_user_settings.sql
REM ===============================
echo DROP TABLE IF EXISTS user_settings;>"%DB_PATH%\20_user_settings.sql"
echo CREATE TABLE user_settings (>>"%DB_PATH%\20_user_settings.sql"
echo    id INT AUTO_INCREMENT PRIMARY KEY,>>"%DB_PATH%\20_user_settings.sql"
echo    user_id INT NOT NULL,>>"%DB_PATH%\20_user_settings.sql"
echo    setting_key VARCHAR(100) NOT NULL,>>"%DB_PATH%\20_user_settings.sql"
echo    setting_value TEXT NOT NULL,>>"%DB_PATH%\20_user_settings.sql"
echo    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,>>"%DB_PATH%\20_user_settings.sql"
echo    FOREIGN KEY (user_id) REFERENCES users(id),>>"%DB_PATH%\20_user_settings.sql"
echo    UNIQUE KEY user_setting_unique (user_id, setting_key)>>"%DB_PATH%\20_user_settings.sql"
echo );>>"%DB_PATH%\20_user_settings.sql"

REM ===============================
REM 21_create_database.sql
REM ===============================
echo -- ================================================= > "%DB_PATH%\21_create_database.sql"
echo -- Create database for Ceramic / General Product Management System >> "%DB_PATH%\21_create_database.sql"
echo -- ================================================= >> "%DB_PATH%\21_create_database.sql"
echo. >> "%DB_PATH%\21_create_database.sql"
echo -- 1️⃣ Create the database >> "%DB_PATH%\21_create_database.sql"
echo CREATE DATABASE IF NOT EXISTS ceramic_management_system CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; >> "%DB_PATH%\21_create_database.sql"
echo. >> "%DB_PATH%\21_create_database.sql"
echo -- 2️⃣ Use the database >> "%DB_PATH%\21_create_database.sql"
echo USE ceramic_management_system; >> "%DB_PATH%\21_create_database.sql"
echo. >> "%DB_PATH%\21_create_database.sql"
echo -- 3️⃣ Create tables >> "%DB_PATH%\21_create_database.sql"

REM Loop to add all SOURCE commands
for /l %%i in (1,1,20) do (
    setlocal enabledelayedexpansion
    if %%i LSS 10 (
        echo SOURCE database/0%%i_*>.sql; >> "%DB_PATH%\21_create_database.sql"
    ) else (
        echo SOURCE database/%%i_*>.sql; >> "%DB_PATH%\21_create_database.sql"
    )
    endlocal
)

echo 20 SQL files created successfully in %DB_PATH%!
pause
