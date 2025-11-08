DROP TABLE IF EXISTS products;
CREATE TABLE products (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   supplier_id INT NULL,
   purchase_price DECIMAL(10,2) NOT NULL,
   transport_fee DECIMAL(10,2) DEFAULT 0,
   loading_fee DECIMAL(10,2) DEFAULT 0,
   unloading_fee DECIMAL(10,2) DEFAULT 0,
   other_expenses DECIMAL(10,2) DEFAULT 0,
   total_cost DECIMAL(10,2) GENERATED ALWAYS AS (purchase_price + transport_fee + loading_fee + unloading_fee + other_expenses) STORED,
   sell_price DECIMAL(10,2) NOT NULL,
   status ENUM('Active','Unteach') DEFAULT 'Active',
   unteach_start_date DATETIME NULL,
   unteach_duration INT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (supplier_id) REFERENCES product_suppliers(id)
);
