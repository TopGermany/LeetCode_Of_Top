-- 1. Tạo database
CREATE DATABASE BT_LEETCODE23
GO

-- 2. Sử dụng database
USE BT_LEETCODE23;
GO

-- 3. Tạo bảng Accounts
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    income INT NOT NULL
);
GO

-- 4. Chèn dữ liệu
INSERT INTO Accounts (account_id, income) VALUES
(3, 108939),
(2, 12747),
(8, 87709),
(6, 91796);
GO

-- 5. Xem dữ liệu
WITH Change_Income AS (
SELECT *,CASE
	WHEN income < 20000 THEN 'Low Salary'
	WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
	WHEN income > 50000 THEN 'High Salary'
	END AS category 
FROM Accounts
),
-- Tạo bảng tạm thời(Mới)
Temp_Table AS (
SELECT 'Low Salary' AS Category
union
SELECT 'Average Salary' AS Category
union
SELECT 'High Salary' AS Category
)
SELECT A2.Category,COUNT(A1.category) AS accounts_count FROM Change_Income AS A1 
	RIGHT JOIN Temp_Table AS A2
ON A1.category = A2.Category
GROUP BY  A2.Category 



