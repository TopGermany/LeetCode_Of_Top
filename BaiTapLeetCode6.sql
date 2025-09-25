CREATE DATABASE BT_LEETCODE6

USE BT_LEETCODE6

/* Tạo bảng Queries để lưu thông tin truy vấn, kết quả, vị trí và đánh giá */
CREATE TABLE Queries (
    query_name VARCHAR(50) NOT NULL,
    result VARCHAR(50) NOT NULL,
    position INT NOT NULL,
    rating INT NOT NULL
);

/* Chèn dữ liệu vào bảng Queries */
INSERT INTO Queries (query_name, result, position, rating) VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);

/* Chất lượng truy vấn của chó là ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2,50
Truy vấn của chó poor_query_percentage là (1 / 3) * 100 = 33,33

Chất lượng truy vấn của mèo bằng ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0,66
Mèo truy vấn poor_query_percentage là (1 / 3) * 100 = 33,33 */

SELECT query_name,
       ROUND(CAST(SUM(CAST(rating AS FLOAT) / position) / COUNT(*) AS FLOAT), 2) AS quality,
       ROUND(CAST(COUNT(CASE WHEN rating < 3 THEN 1 END) AS FLOAT) / COUNT(*) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;







