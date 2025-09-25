CREATE DATABASE EMPLOYEES

-- Tạo bảng Employee
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    managerId INT,
    FOREIGN KEY (managerId) REFERENCES Employee(id)
);

-- Chèn dữ liệu vào bảng Employee
INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);

 
SELECT name FROM Employee AS EMP1
JOIN (	
SELECT managerId FROM Employee
GROUP BY managerId
HAVING COUNT(*) >= 5
) as EMP2
ON EMP1.id = EMP2.managerId





SELECT EMP1.name
FROM Employee AS EMP1
JOIN (
    SELECT managerId
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) AS EMP2
ON EMP1.id = EMP2.managerId;


SELECT managerId,COUNT(*) FROM Employee
GROUP BY managerId
HAVING COUNT(*) >= 5


