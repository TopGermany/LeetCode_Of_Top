CREATE DATABASE BT_LEETCODE21

USE BT_LEETCODE21

CREATE TABLE Products (
    product_id INT,
    new_price INT,
    change_date DATE
);

INSERT INTO Products (product_id, new_price, change_date) VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');

-- Tìm ngày mới nhất ngày  trước ngày 16-08-2019 của các sản phẩm
WITH Ngay_Moi_Nhat AS (
SELECT product_id,new_price,change_date, ROW_NUMBER() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS Ngay_Moi FROM Products
WHERE change_date <= '2019-08-16'),
-- Tất cả các ngày sau ngày 16-08-2019 trả về 10
Ngay_Chua_Doi_Gia AS (
SELECT product_id,new_price,change_date
FROM Ngay_Moi_Nhat
WHERE Ngay_Moi = 1
),
-- Tất cả các sản phẩm
Tat_Ca_San_Pham AS (
SELECT DISTINCT(product_id) FROM Products
)
SELECT T.product_id,COALESCE(N.new_price,10) AS Price FROM Tat_Ca_San_Pham AS T
	LEFT JOIN Ngay_Chua_Doi_Gia AS N
ON T.product_id = N.product_id







