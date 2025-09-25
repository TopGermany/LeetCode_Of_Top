CREATE DATABASE BT_LEETCODE18

USE BT_LEETCODE18


CREATE TABLE Employee (
    employee_id INT,
    department_id INT,
    primary_flag CHAR(1)
);

INSERT INTO Employee (employee_id, department_id, primary_flag) VALUES
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');

SELECT employee_id,department_id 
FROM EMPLOYEE
WHERE primary_flag = 'Y'
UNION ALL
SELECT employee_id,department_id 
FROM EMPLOYEE
GROUP BY employee_id,department_id
HAVING COUNT(*) = 1 AND employee_id 
NOT IN ( SELECT employee_id FROM Employee WHERE primary_flag = 'Y')


WITH CTE AS(
SELECT Employee_id, count(department_id) as cnt
FROM Employee
GROUP BY employee_id
)
SELECT employee_id,department_id FROM Employee
WHERE employee_id IN (SELECT employee_id FROM CTE WHERE cnt = 1)
UNION ALL
SELECT employee_id,department_id FROM EMPLOYEE
WHERE primary_flag = 'Y'


WITH SO1 AS 
(SELECT employee_id,COUNT(DISTINCT(department_id)) AS D1 FROM Employee
GROUP BY employee_id
HAVING COUNT(DISTINCT(department_id)) = 1 
)
SELECT employee_id,department_id FROM Employee
WHERE employee_id IN (SELECT employee_id FROM SO1)
UNION
SELECT employee_id,department_id FROM Employee
WHERE primary_flag = 'Y'

