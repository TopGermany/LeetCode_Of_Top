-- Tạo cơ sở dữ liệu
CREATE DATABASE SchoolExams
USE SchoolExams;

-- Tạo bảng Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL
);

-- Tạo bảng Subjects
CREATE TABLE Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

-- Tạo bảng Examinations
CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_name) REFERENCES Subjects(subject_name)
);

-- Chèn dữ liệu vào bảng Students
INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

-- Chèn dữ liệu vào bảng Subjects
INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

-- Chèn dữ liệu vào bảng Examinations
INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

/* Bảng kết quả phải chứa tất cả học sinh và tất cả môn học.
Alice đã tham dự kỳ thi Toán 3 lần, kỳ thi Vật lý 2 lần và kỳ thi Lập trình 1 lần.
Bob đã tham dự kỳ thi Toán 1 lần, kỳ thi Lập trình 1 lần và không tham dự kỳ thi Vật lý.
Alex không tham dự bất kỳ kỳ thi nào.
John đã tham dự kỳ thi Toán 1 lần, kỳ thi Vật lý 1 lần và kỳ thi Lập trình 1 lần.*/

SELECT ST.student_id,ST.student_name,SJ.subject_name,COALESCE(EX.attended_exams,0) 
FROM Students AS ST CROSS JOIN Subjects AS SJ
LEFT JOIN (
SELECT  student_id, subject_name, COUNT(*) AS attended_exams 
FROM Examinations 
GROUP BY student_id,subject_name
) AS EX
ON ST.student_id = EX.student_id AND SJ.subject_name = EX.subject_name
ORDER BY ST.student_id ASC





SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
-- Làm Lại

SELECT ST.student_id,ST.student_name,SJ.subject_name,COALESCE(EX.attended_exams,0) FROM Students AS ST
	CROSS JOIN Subjects AS SJ
LEFT JOIN 
(SELECT student_id,subject_name,COUNT(subject_name) AS attended_exams  FROM Examinations 
GROUP BY student_id,subject_name) AS EX
	ON ST.student_id = EX.student_id AND SJ.subject_name = EX.subject_name
ORDER BY ST.student_id ASC
