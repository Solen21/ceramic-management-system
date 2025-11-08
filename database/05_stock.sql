DROP TABLE IF EXISTS stock;
CREATE TABLE stock (
   id INT AUTO_INCREMENT PRIMARY KEY,
   store_id INT NOT NULL,
   product_id INT NOT NULL,
   quantity INT DEFAULT 0,
   broken INT DEFAULT 0,
   FOREIGN KEY (store_id) REFERENCES stores(id),
   FOREIGN KEY (product_id) REFERENCES products(id),
   UNIQUE KEY store_product_unique (store_id, product_id)
);
