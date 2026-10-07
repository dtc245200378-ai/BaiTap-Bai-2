CREATE DATABASE IF NOT EXISTS inotes_db;
USE inotes_db;

CREATE TABLE IF NOT EXISTS note_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS notes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES note_type(id) ON DELETE SET NULL
);

INSERT INTO note_type (id, name, description) VALUES 
(1, 'Cá nhân', 'Ghi chú cá nhân'),
(2, 'Công việc', 'Ghi chú công việc'),
(3, 'Học tập', 'Ghi chú học tập')
ON DUPLICATE KEY UPDATE name=VALUES(name);
