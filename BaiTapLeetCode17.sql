CREATE DATABASE BT_LEETCODE17

USE BT_LEETCODE17

-- Tạo bảng Employees
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    reports_to INT,
    age INT,
    FOREIGN KEY (reports_to) REFERENCES Employees(employee_id)
);

-- Chèn dữ liệu vào bảng
INSERT INTO Employees (employee_id, name, reports_to, age) VALUES
(9, 'Hercy', NULL, 43),
(6, 'Alice', 9, 41),
(4, 'Bob', 9, 36),
(2, 'Winston', NULL, 37);

SELECT E1.employee_id,E1.name,COUNT(*) AS reports_to, ROUND(AVG(CAST(E2.age AS FLOAT)),0) AS  average_age FROM Employees AS E1
	INNER JOIN Employees AS E2
ON E1.employee_id = E2.reports_to
GROUP BY E1.employee_id,E1.name
HAVING COUNT(*) > 0
ORDER BY E1.employee_id ASC


-- Tạo bảng Employees
CREATE TABLE Employees2 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    reports_to INT,
    age FLOAT,
    FOREIGN KEY (reports_to) REFERENCES Employees2(employee_id)
);


-- Chèn dữ liệu vào bảng
INSERT INTO Employees2 (employee_id, name, reports_to, age) VALUES
(1, 'Michael', NULL, 45),
(2, 'Alice', 1, 38),
(3, 'Bob', 1, 42),
(4, 'Charlie', 2, 34),
(5, 'David', 2, 40),
(6, 'Eve', 3, 37),
(7, 'Frank', NULL, 50),
(8, 'Grace', NULL, 48);

SELECT E1.employee_id,E1.name,COUNT(*) AS reports_to, ROUND(AVG(CAST(E2.age AS FLOAT)),0) AS  average_age FROM Employees2 AS E1
	INNER JOIN Employees2 AS E2
ON E1.employee_id = E2.reports_to
GROUP BY E1.employee_id,E1.name
HAVING COUNT(*) > 0
ORDER BY E1.employee_id ASC


