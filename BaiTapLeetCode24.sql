CREATE DATABASE BT_LEETCODE24

USE BT_LEETCODE24



CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    salary INT NOT NULL
);

CREATE TABLE Employees2 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    salary INT NOT NULL
);

CREATE TABLE Employees3 (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    manager_id INT NULL,
    salary INT NOT NULL
);

INSERT INTO Employees3 (employee_id, name, manager_id, salary) VALUES
(2,  'Forrest', NULL, 3417),
(3,  'Kieran',  15,   40130),
(14, 'Amiyah',  7,    80916),
(8,  'Marcos',  22,   58585),
(10, 'Jayden',  13,   19569),
(9,  'Skye',    19,   65929),
(12, 'Ensley',  18,   19575),
(7,  'Margot',  NULL, 49379),
(11, 'Sadie',   20,   89210),
(22, 'Kamari',  3,    75274),
(21, 'Maison',  3,    68485),
(15, 'Fabian',  21,   68118),
(18, 'Kimora',  NULL, 71537),
(5,  'Mya',     19,   70623),
(13, 'Cullen',  12,   55491),
(4,  'Jovanni', 11,   16973);

INSERT INTO Employees2 (employee_id, name, manager_id, salary) VALUES
(18, 'Drew',   NULL, 41568),
(20, 'Ronan',  3,    65209),
(10, 'Jaxton', 15,   96667),
(13, 'Louie',  16,   6801),
(17, 'Mylah',  20,   26540),
(21, 'Kenia',  15,   98690),
(7,  'Hadley', 6,    23590),
(9,  'Hayden', 4,    90798),
(2,  'Nixon',  NULL, 25560),
(8,  'Arthur', 11,   67027),
(11, 'Brycen', NULL, 42570),
(3,  'Noemi',  NULL, 87321),
(14, 'Hayden', NULL, 4123),
(19, 'Astrid', 20,   37680);

INSERT INTO Employees (employee_id, name, manager_id, salary) VALUES
(3,  'Mila',      9,     60301),
(12, 'Antonella', NULL,  31000),
(13, 'Emery',     NULL,  67084),
(1,  'Kalel',     11,    21241),
(9,  'Mikaela',   NULL,  50937),
(11, 'Joziah',    6,     28485);

-- Sử dụng Inner Join
SELECT E1.employee_id FROM Employees AS E1
LEFT JOIN Employees AS E2
ON E1.manager_id = E2.employee_id
WHERE E1.salary < 30000 AND E2.employee_id IS NULL AND E1.manager_id IS NOT NULL
ORDER BY E1.employee_id ASC

-- Sử dụng truy vấn lồng
SELECT employee_id FROM Employees
WHERE salary < 30000 AND manager_id NOT IN (SELECT employee_id FROM Employees)
