CREATE DATABASE BT_LEETCODE4

USE BT_LEETCODE4

-- Create Signups table
CREATE TABLE Signups (
    user_id INT PRIMARY KEY,
    time_stamp DATETIME NOT NULL
);

-- Create Confirmations table
CREATE TABLE Confirmations (
    user_id INT,
    time_stamp DATETIME NOT NULL,
    action VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Signups(user_id)
);

-- Insert data into Signups table
INSERT INTO Signups (user_id, time_stamp) VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

-- Insert data into Confirmations table
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');

-- Đề bài : Người dùng 6 không yêu cầu bất kỳ tin nhắn xác nhận nào. Tỷ lệ xác nhận là 0.
-- Người dùng 3 đã thực hiện 2 yêu cầu và cả hai đều hết thời gian chờ. Tỷ lệ xác nhận là 0.
-- Người dùng 7 đã thực hiện 3 yêu cầu và tất cả đều được xác nhận. Tỷ lệ xác nhận là 1.
-- Người dùng 2 đã thực hiện 2 yêu cầu trong đó một yêu cầu được xác nhận và yêu cầu còn lại đã hết thời gian. Tỷ lệ xác nhận là 1/2 = 0,5.

SELECT S.user_id,ROUND(COALESCE(COUNT(CASE WHEN C.action = 'confirmed' THEN 1 END)/COUNT(*),0),2) AS confirmation_rate 
FROM Signups AS S 
	LEFT JOIN Confirmations AS C
ON S.user_id = C.user_id
GROUP BY S.user_id
ORDER BY confirmation_rate ASC
