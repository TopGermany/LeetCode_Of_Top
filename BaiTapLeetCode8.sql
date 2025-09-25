CREATE DATABASE BT_LEETCODE8

USE BT_lEETCODE8

-- Tạo bảng Delivery
CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Insert dữ liệu
INSERT INTO Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13'),
(7, 4, '2019-08-09', '2019-08-09');

/*
Mã khách hàng 1 có đơn hàng đầu tiên với mã giao hàng là 1 và được lên lịch. 
Mã khách hàng 2 có đơn hàng đầu tiên với mã giao hàng là 2 và được giao ngay lập tức. 
Mã khách hàng 3 có đơn hàng đầu tiên với mã giao hàng là 5 và được lên lịch. 
Mã khách hàng 4 có đơn hàng đầu tiên với mã giao hàng là 7 và được giao ngay lập tức. 
Do đó, một nửa số khách hàng có đơn hàng đầu tiên ngay lập tức.*/

SELECT ROUND(CAST(COUNT(CASE WHEN DATEDIFF(DAY,order_date,customer_pref_delivery_date) = 0 THEN 1 END ) AS FLOAT) / COUNT(*) * 100,2) AS immediate_percentage 
FROM (SELECT customer_id,MIN(order_date) AS first_order_date FROM Delivery
GROUP BY customer_id) AS FistOrders 
	JOIN Delivery D ON D.customer_id = FistOrders.customer_id AND D.order_date = FistOrders.first_order_date

SELECT * 
FROM (SELECT customer_id,MIN(order_date) AS first_order_date FROM Delivery
GROUP BY customer_id) AS FistOrders 
	JOIN Delivery D ON D.customer_id = FistOrders.customer_id AND D.order_date = FistOrders.first_order_date


