-- Tạo database
CREATE DATABASE product_sales;
USE product_sales;

-- Tạo bảng Prices
CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY (product_id, start_date)
);

-- Tạo bảng UnitsSold
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

-- Insert dữ liệu vào bảng Prices
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

-- Insert dữ liệu vào bảng UnitsSold
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

SELECT P.product_id ,ROUND(COALESCE(SUM(U.units * P.price) / NULLIF(SUM(U.units), 0), 0), 2) AS average_price 
FROM UnitsSold AS U
INNER JOIN Prices AS P
	ON U.product_id = P.product_id
WHERE purchase_date BETWEEN start_date AND end_date
GROUP BY P.product_id

SELECT 
    P.product_id,
    ROUND(
        COALESCE(SUM(U.units * P.price) / NULLIF(SUM(U.units), 0), 0), 
        2
    ) AS average_price
FROM UnitsSold AS U
RIGHT JOIN Prices AS P
    ON U.product_id = P.product_id
    AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;