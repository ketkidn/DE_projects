USE master;
GO

CREATE DATABASE DE_project;
GO

USE DE_project;
GO

CREATE TABLE customers (
    customer_id INT IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE orders (
    order_id INT IDENTITY PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO customers (name, email)
VALUES
('Ketki', 'ketki@gmail.com'),
('Amit', 'amit@gmail.com');

INSERT INTO orders (customer_id, amount, order_date)
VALUES
(1, 1200.50, '2025-01-10'),
(1, 850.00, '2025-01-12'),
(2, 450.00, '2025-01-15');

SELECT * FROM customers;
SELECT * FROM orders;


SELECT c.name, o.amount, o.order_date
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;
