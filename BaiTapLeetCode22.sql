CREATE DATABASE BT_LEETCODE22

USE BT_LEETCODE22

-- 3. Tạo bảng Queue
CREATE TABLE Queue (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(50) NOT NULL,
    weight INT NOT NULL,
    turn INT NOT NULL
);

-- 4. Thêm dữ liệu
INSERT INTO Queue (person_id, person_name, weight, turn) VALUES
(5, 'Alice', 250, 1),
(4, 'Bob', 175, 5),
(3, 'Alex', 350, 2),
(6, 'John Cena', 400, 3),
(1, 'Winston', 500, 6),
(2, 'Marie', 200, 4);

-- 5. Xem dữ liệu
WITH Sum_Weight AS (
SELECT person_name,weight,SUM(weight) OVER(ORDER BY turn) AS Total_Weight  FROM Queue
)
SELECT TOP 1 person_name FROM Sum_Weight
WHERE Total_Weight <= 1000
ORDER BY Total_Weight DESC


