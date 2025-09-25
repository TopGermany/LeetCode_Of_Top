CREATE DATABASE BT_LEETCODE11

USE BT_LEETCODE11

-- Tạo bảng activity_log
CREATE TABLE activity_log (
    user_id INT NOT NULL,
    session_id INT NOT NULL,
    activity_date DATE NOT NULL,
    activity_type VARCHAR(50) NOT NULL
);

INSERT INTO activity_log (user_id, session_id, activity_date, activity_type) VALUES
(1, 1, '2019-07-20', 'open_session'),
(1, 1, '2019-07-20', 'scroll_down'),
(1, 1, '2019-07-20', 'end_session'),
(2, 4, '2019-07-20', 'open_session'),
(2, 4, '2019-07-21', 'send_message'),
(2, 4, '2019-07-21', 'end_session'),
(3, 2, '2019-07-21', 'open_session'),
(3, 2, '2019-07-21', 'send_message'),
(3, 2, '2019-07-21', 'end_session'),
(4, 3, '2019-06-25', 'open_session'),
(4, 3, '2019-06-25', 'end_session');

SELECT activity_date AS day ,COUNT(DISTINCT(user_id))  AS active_users FROM activity_log
WHERE activity_date BETWEEN '2019-06-27' AND '2019-07-27'
GROUP BY activity_date


