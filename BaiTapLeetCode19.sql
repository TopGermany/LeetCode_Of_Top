CREATE DATABASE BT_LEETCODE19

USE BT_LEETCODE19

CREATE TABLE triangle (
    x INT,
    y INT,
    z INT
);

INSERT INTO triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);

-- ĐIỀU KIỆN 3 CẠNH TAM GIÁC
SELECT x,
y,
z,
CASE 
	WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes' 
	ELSE 'No'
END AS  triangle 
FROM triangle
