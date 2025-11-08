DROP TABLE IF EXISTS purchases;
CREATE TABLE purchases (
   id INT AUTO_INCREMENT PRIMARY KEY,
   product_id INT NOT NULL,
   store_id INT NOT NULL,
   supplier_id INT NULL,
   quantity INT NOT NULL,
   transport_fee DECIMAL(10,2) DEFAULT 0,
   loading_fee DECIMAL(10,2) DEFAULT 0,
   unloading_fee DECIMAL(10,2) DEFAULT 0,
   other_expenses DECIMAL(10,2) DEFAULT 0,
   purchase_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   worker_id INT,
   FOREIGN KEY (product_id) REFERENCES products(id),
   FOREIGN KEY (store_id) REFERENCES stores(id),
   FOREIGN KEY (supplier_id) REFERENCES product_suppliers(id),
   FOREIGN KEY (worker_id) REFERENCES users(id)
);
