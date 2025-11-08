DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
   id INT AUTO_INCREMENT PRIMARY KEY,
   sender_id INT NOT NULL,
   receiver_id INT NOT NULL,
   message_text TEXT NOT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   is_read BOOLEAN DEFAULT FALSE,
   FOREIGN KEY (sender_id) REFERENCES users(id),
   FOREIGN KEY (receiver_id) REFERENCES users(id)
);
