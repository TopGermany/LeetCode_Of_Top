CREATE DATABASE BT_LEETCODE7

USE  BT_LEETCODE7

-- Tạo bảng Transactions
CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(2),
    state VARCHAR(10),
    amount INT,
    trans_date DATE
);

-- Insert dữ liệu
INSERT INTO Transactions (id, country, state, amount, trans_date) VALUES
(121, 'US', 'approved', 1000, '2018-12-18'),
(122, 'US', 'declined', 2000, '2018-12-19'),
(123, 'US', 'approved', 2000, '2019-01-01'),
(124, 'DE', 'approved', 2000, '2019-01-07');

SELECT FORMAT(trans_date,'yyyy-MM') AS month,
country,
COUNT(*) AS trans_count,COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
SUM(amount) AS trans_total_amount,
SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM  Transactions
GROUP BY FORMAT(trans_date,'yyyy-MM'),country


