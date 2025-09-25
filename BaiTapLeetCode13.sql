CREATE DATABASE BT_LEETCODE13

USE BT_LEETCODE13

-- Create the Courses table
CREATE TABLE Courses (
    student VARCHAR(50),
    class VARCHAR(50)
);

-- Insert the data
INSERT INTO Courses (student, class) VALUES
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Math');

/*
- Môn Toán có 6 sinh viên, vì vậy chúng ta bao gồm nó. 
- Môn Tiếng Anh có 1 sinh viên, vì vậy chúng ta không bao gồm nó. 
- Môn Sinh học có 1 sinh viên, vì vậy chúng ta không bao gồm nó. 
- Môn Máy tính có 1 sinh viên, vì vậy chúng ta không bao gồm nó.
*/
SELECT class FROM Courses
GROUP BY class
HAVING COUNT(class) >= 5 

