DROP TABLE IF EXISTS returns;
CREATE TABLE returns (
   id INT AUTO_INCREMENT PRIMARY KEY,
   sale_id INT NOT NULL,
   quantity INT NOT NULL,
   reason VARCHAR(255),
   return_date DATETIME DEFAULT CURRENT_TIMESTAMP,
   approved_by_admin BOOLEAN DEFAULT FALSE,
   refund_amount DECIMAL(10,2) DEFAULT 0,
   FOREIGN KEY (sale_id) REFERENCES sales(id)
);
