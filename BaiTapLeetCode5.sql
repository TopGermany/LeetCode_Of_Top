CREATE DATABASE BT_LEETCODE5

USE BT_LEETCODE5

-- Tạo bảng Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL
);

-- Tạo bảng Register
CREATE TABLE Register (
    contest_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Chèn dữ liệu vào bảng Users
INSERT INTO Users (user_id, user_name) VALUES
(6, 'Alice'),
(2, 'Bob'),
(7, 'Alex');

-- Chèn dữ liệu vào bảng Register
INSERT INTO Register (contest_id, user_id) VALUES
(215, 6),
(209, 2),
(208, 2),
(210, 6),
(208, 6),
(209, 7),
(209, 6),
(215, 7),
(208, 7),
(210, 2),
(207, 2),
(210, 7);

-- Đề bài: Tất cả người dùng đã đăng ký trong cuộc thi 208, 209 và 210. Tỷ lệ phần trăm là 100% và chúng tôi sắp xếp chúng trong bảng câu trả lời theo contest_id theo thứ tự tăng dần.
-- Alice và Alex đã đăng ký tham gia cuộc thi 215 và tỷ lệ phần trăm là ((2/3) * 100) = 66,67%
-- Bob đã đăng ký tham gia cuộc thi 207 và tỷ lệ phần trăm là ((1/3) * 100) = 33,33%

SELECT DISTINCT R.contest_id,ROUND((COUNT(R.contest_id)/(SELECT COUNT(*) FROM Users))*100,2) AS percentage  FROM Users AS U
	INNER JOIN Register AS R
ON U.user_id = R.user_id
GROUP BY R.contest_id
ORDER BY percentage DESC,R.contest_id





SELECT COUNT(*) FROM Users
SELECT * FROM Register