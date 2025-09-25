-- Tạo cơ sở dữ liệu
CREATE DATABASE BT_LEETCODE12

-- Sử dụng cơ sở dữ liệu
USE BT_LEETCODE12

-- Tạo bảng sales
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    year INT NOT NULL,
    quantity INT NOT NULL,
    price INT NOT NULL
);

-- Chèn dữ liệu vào bảng sales
INSERT INTO sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);


-- Tìm firstYear cho bảng
WITH FirstYear AS (
SELECT product_id,MIN(year) AS first_year
FROM sales
GROUP BY product_id
)
-- Tạo bảng mới
SELECT F.product_id,F.first_year,S.quantity,S.price FROM FirstYear AS F
	INNER JOIN sales AS S
ON F.product_id = S.product_id AND F.first_year = S.year

