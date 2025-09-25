CREATE DATABASE BT_LEETCODE14

USE BT_LEETCODE14

-- Create the Followers table
CREATE TABLE Followers (
    user_id INT,
    follower_id INT
);

-- Insert the data
INSERT INTO Followers (user_id, follower_id) VALUES
(0, 1),
(1, 0),
(2, 0),
(2, 1);

/* 
Người theo dõi của 0 là {1} 
Người theo dõi của 1 là {0} 
Người theo dõi của 2 là {0,1}
*/

SELECT user_id,COUNT(*) AS followers_count FROM Followers
GROUP BY user_id