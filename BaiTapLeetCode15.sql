CREATE DATABASE BT_LEETCODE15

USE BT_LEETCODE15

-- Create the MyNumbers table
CREATE TABLE MyNumbers (
    num INT
);

-- Insert the data
INSERT INTO MyNumbers (num) VALUES
(8),
(8),
(3),
(3),
(1),
(4),
(5),
(6);


/* 
Giải thích: Các số đơn là 1, 4, 5 và 6. 
Vì 6 là số đơn lớn nhất nên chúng ta trả về số đó.
*/

-- MyNumbers

-- Tìm số lần xuất hiện bằng 1 
WITH SoLanXuatHien AS ( 
SELECT num FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1
)

SELECT MAX(S.num) AS num FROM SoLanXuatHien AS S

-- MyNumbers2
CREATE TABLE MyNumbers2 (
    num INT
);

INSERT INTO MyNumbers2 (num) VALUES
(8),
(8),
(7),
(7),
(3),
(3),
(3);


WITH SoLanXuatHien AS ( 
SELECT num FROM MyNumbers2
GROUP BY num
HAVING COUNT(*) = 1
)

SELECT MAX(S.num) AS num FROM SoLanXuatHien AS S


 