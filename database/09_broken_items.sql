DROP TABLE IF EXISTS broken_items;
CREATE TABLE broken_items (
   id INT AUTO_INCREMENT PRIMARY KEY,
   product_id INT NOT NULL,
   store_id INT NOT NULL,
   quantity INT NOT NULL,
   reason VARCHAR(255),
   reported_by INT,
   report_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (product_id) REFERENCES products(id),
   FOREIGN KEY (store_id) REFERENCES stores(id),
   FOREIGN KEY (reported_by) REFERENCES users(id)
);
