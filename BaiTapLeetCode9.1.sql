CREATE DATABASE BT_LEETCODE9

USE BT_LEETCODE9 

CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT
);

INSERT INTO Activity (player_id, device_id, event_date, games_played)
VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);




-- Xác định ngày đăng nhập đầu tiên của mỗi player_id
WITH FirstLogin AS ( 
SELECT player_id,MIN(event_date) AS First_day FROM Activity
GROUP BY player_id
),
-- Kiểm tra xem người chơi có đăng nhập lại vào ngày tiếp theo sau ngày đầu tiên hay không.
NextDayLogin AS (
SELECT F.player_id FROM FirstLogin AS F
	INNER JOIN Activity AS A
ON F.player_id = A.player_id AND A.event_date = DATEADD(DAY,1,F.First_day)
),
-- Đếm tổng số người chơi
TotalPlayer AS (
SELECT COUNT(DISTINCT(player_id)) AS Total_Player FROM Activity
),
-- Đếm tổng số người chơi quay lại
TotalPlayerReturning AS (
SELECT COUNT(DISTINCT(player_id)) AS TotalPlayerReturning FROM NextDayLogin
)
-- Tính tỷ lệ và làm tròn đến 2 chữ số thập phân
SELECT ROUND(CAST(tpr.TotalPlayerReturning AS float)/ tp.Total_Player,2) AS fraction  FROM TotalPlayerReturning  AS tpr, TotalPlayer as tp 




