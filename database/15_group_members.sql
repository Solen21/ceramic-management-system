DROP TABLE IF EXISTS group_members;
CREATE TABLE group_members (
   id INT AUTO_INCREMENT PRIMARY KEY,
   group_id INT NOT NULL,
   user_id INT NOT NULL,
   joined_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (group_id) REFERENCES group_chats(id),
   FOREIGN KEY (user_id) REFERENCES users(id),
   UNIQUE KEY group_user_unique (group_id, user_id)
);
