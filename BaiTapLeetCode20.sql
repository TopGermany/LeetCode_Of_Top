CREATE DATABASE BT_LEETCODE20

USE BT_LEETCODE20

-- Tạo bảng Logs
CREATE TABLE Logs (
    id INT PRIMARY KEY,
    num INT
);

-- Chèn dữ liệu vào bảng Logs
INSERT INTO Logs (id, num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 2);

-- Số xuất hiện 3 lần liên tiếp
SELECT DISTINCT(num) AS ConsecutiveNums FROM
(SELECT id,num,LAG(num,1) OVER (ORDER BY L.id) as Hang_Truoc, LEAD(num,1)  OVER (ORDER BY L.id) AS Hang_Sau
FROM Logs AS L) AS So_LienTruoc_Va_LienSau
WHERE num = Hang_Truoc AND num = Hang_Sau

SELECT DISTINCT(L1.num) AS ConsecutiveNums FROM Logs AS L1
	INNER JOIN Logs AS L2
ON L1.id = L2.id + 1 AND L1.num = L2.num
	INNER JOIN Logs AS L3
ON L3.id + 2 = L2.id + 1 AND L2.num = L3.num



CREATE TABLE Logs2 (
    id INT PRIMARY KEY,
    num INT
);


INSERT INTO Logs2 (id, num) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2);

SELECT * FROM Logs2 AS L1
	INNER JOIN Logs2 AS L2
ON L1.id = L2.id + 1 AND L1.num = L2.num
	INNER JOIN Logs2 AS L3
ON L3.id + 2 = L2.id + 1 AND L2.num = L3.num
	INNER JOIN Logs2 AS L4
ON L4.id + 3 = L3.id + 2 AND L3.num = L4.num
