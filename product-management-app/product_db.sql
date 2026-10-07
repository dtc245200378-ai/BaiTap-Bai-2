CREATE DATABASE IF NOT EXISTS product_db;
USE product_db;

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    price DOUBLE NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO products (name, price, quantity) VALUES
('Điện thoại iPhone 15 Pro Max', 29990000, 15),
('Laptop Dell XPS 15', 35500000, 8),
('Tai nghe Sony WH-1000XM5', 6990000, 20),
('Bàn phím cơ Keychron K2', 1850000, 30);
