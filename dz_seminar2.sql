CREATE DATABASE dz_seminar_2;
USE dz_seminar_2;

-- 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE TABLE sales
(
	id INT NOT NULL,
	order_date DATE NOT NULL,
	bucket VARCHAR(50) NOT NULL
);

SELECT * FROM sales;

INSERT INTO sales(id, order_date, bucket)
VALUES (1, '2021-01-01', '101 to 300'),
	   (1, '2021-01-02', '101 to 300'),
	   (1, '2021-01-02', 'less than equal to 100'),
	   (1, '2021-01-04', '101 to 300'),
	   (1, '2021-01-05', 'greater than 300');
       
-- 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.
SELECT *,
CASE bucket
WHEN 'less than equal to 100' THEN 'меньше 100'
WHEN '101 to 300' THEN '100-300'
WHEN 'greater than 300' THEN 'больше 300'
END AS group_bucket
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE
CREATE TABLE orders
(
	orderid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employeeid VARCHAR(5),
    amount FLOAT,
    orderstatus VARCHAR(25)
);

INSERT INTO orders(employeeid, amount, orderstatus)
VALUES ('e03', 15.00, 'OPEN'),
	   ('e01', 15.50, 'OPEN'),
       ('e05', 100.70, 'CLOSED'),
       ('e02', 22.18, 'OPEN'),
       ('e04', 9.50, 'CANCELLED'),
       ('e04', 99.99, 'OPEN');
       
SELECT * FROM orders;

SELECT orderid, orderstatus,
CASE orderstatus
WHEN 'OPEN' THEN 'Order is in open state.'
WHEN 'CLOSED' THEN 'Order is closed.'
WHEN 'CANCELLED' THEN 'Order is cancelled'
END AS order_summary
FROM orders;

-- 4. Чем NULL отличается от 0?
-- NULL это специальное значение, которое означает отсутсвтвие каких либо данных. В то время как 0, является числом.