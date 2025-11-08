DROP TABLE IF EXISTS group_messages;
CREATE TABLE group_messages (
   id INT AUTO_INCREMENT PRIMARY KEY,
   group_id INT NOT NULL,
   sender_id INT NOT NULL,
   message_text TEXT NOT NULL,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   is_read BOOLEAN DEFAULT FALSE,
   FOREIGN KEY (group_id) REFERENCES group_chats(id),
   FOREIGN KEY (sender_id) REFERENCES users(id)
);
