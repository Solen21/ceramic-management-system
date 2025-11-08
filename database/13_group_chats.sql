DROP TABLE IF EXISTS group_chats;
CREATE TABLE group_chats (
   id INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(100) NOT NULL,
   store_id INT NULL,
   created_by INT,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (store_id) REFERENCES stores(id),
   FOREIGN KEY (created_by) REFERENCES users(id)
);
