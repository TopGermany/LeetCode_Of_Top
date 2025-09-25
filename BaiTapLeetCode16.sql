CREATE DATABASE BT_LEETCODE16

USE BT_LEETCODE16


-- Tạo bảng Customer
CREATE TABLE Customer (
    customer_id INT,
    product_key INT
);

-- Tạo bảng Product
CREATE TABLE Product (
    product_key INT
);

-- Insert dữ liệu vào bảng Customer
INSERT INTO Customer (customer_id, product_key) VALUES
(1, 5),
(2, 6),
(3, 5),
(3, 6),
(1, 6);

-- Insert dữ liệu vào bảng Product
INSERT INTO Product (product_key) VALUES
(5),
(6);

SELECT C.customer_id FROM Customer AS C
GROUP BY C.customer_id
HAVING COUNT(DISTINCT(C.product_key)) = (SELECT COUNT(*) FROM Product)












