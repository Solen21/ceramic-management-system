DROP TABLE IF EXISTS alerts;
CREATE TABLE alerts (
   id INT AUTO_INCREMENT PRIMARY KEY,
   product_id INT NOT NULL,
   store_id INT NOT NULL,
   alert_type ENUM('LowStock','Unteach','Return','Broken') NOT NULL,
   message VARCHAR(255),
   is_read BOOLEAN DEFAULT FALSE,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (product_id) REFERENCES products(id),
   FOREIGN KEY (store_id) REFERENCES stores(id)
);
