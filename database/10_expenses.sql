DROP TABLE IF EXISTS expenses;
CREATE TABLE expenses (
   id INT AUTO_INCREMENT PRIMARY KEY,
   store_id INT NULL,
   product_id INT NULL,
   amount DECIMAL(10,2) NOT NULL,
   category VARCHAR(50),
   description VARCHAR(255),
   created_by INT,
   expense_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (store_id) REFERENCES stores(id),
   FOREIGN KEY (product_id) REFERENCES products(id),
   FOREIGN KEY (created_by) REFERENCES users(id)
);
