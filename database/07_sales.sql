DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
   id INT AUTO_INCREMENT PRIMARY KEY,
   product_id INT NOT NULL,
   store_id INT NOT NULL,
   quantity INT NOT NULL,
   sell_price DECIMAL(10,2) NOT NULL,
   loading_fee DECIMAL(10,2) DEFAULT 0,
   unloading_fee DECIMAL(10,2) DEFAULT 0,
   customer_name VARCHAR(100),
   sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   worker_id INT,
   mini_manager_id INT NULL,
   manager_id INT NULL,
   approved_by_admin BOOLEAN DEFAULT FALSE,
   FOREIGN KEY (product_id) REFERENCES products(id),
   FOREIGN KEY (store_id) REFERENCES stores(id),
   FOREIGN KEY (worker_id) REFERENCES users(id),
   FOREIGN KEY (mini_manager_id) REFERENCES users(id),
   FOREIGN KEY (manager_id) REFERENCES users(id)
);
