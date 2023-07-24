CREATE DATABASE dz_seminar_3;
USE dz_seminar_3;

-- Задание №1 
CREATE TABLE salespeople
(
	snum INT,
    sname VARCHAR(30),
    city VARCHAR(30),
    comm FLOAT
);

CREATE TABLE custumers
(
	cnum INT,
    cname VARCHAR(30),
    city VARCHAR(30),
    rating INT,
    snum INT
);

CREATE TABLE orders
(
	onum INT,
    amt FLOAT,
    odate DATE,
    cnum INT,
    snum INT
);

INSERT INTO salespeople(snum, sname, city, comm)
VALUES (1001, 'Peel', 'Londom', 0.12),
       (1002, 'Serres', 'San Jose', 0.13),
       (1004, 'Motika', 'London', 0.11),
       (1007, 'Rifkin', 'Barcelona', 0.15),
       (1003, 'Axelrod', 'New York', 0.10);

INSERT INTO custumers(cnum, cname, city, rating, snum)
VALUES (2001, 'Hoffman', 'London', 100, 1001),
       (2002, 'Giovanni', 'Rome', 200, 1003),
       (2003, 'Liu', 'SanJose', 200, 1002),
       (2004, 'Grass', 'Berlin', 300, 1002),
       (2006, 'Clemens', 'London', 100, 1001),
       (2008, 'Cisneros', 'SanJose', 300, 1007),
       (1007, 'Pereira', 'Rome', 100, 1004);
       
INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES (3001, 18.69, '1990-03-10', 2008, 1007),
       (3003, 767.19, '1990-03-10', 2001, 1001),
       (3002, 1900.10, '1990-03-10', 2007, 1004),
       (3005, 5160.45, '1990-03-10', 2003, 1002),
       (3006, 1098.16, '1990-03-10', 2008, 1007),
       (3009, 1713.23, '1990-04-10', 2002, 1003),
       (3007, 75.75, '1990-04-10', 2004, 1002),
       (3008, 4723.00, '1990-05-10', 2006, 1001),
       (3010, 1309.95, '1990-06-10', 2004, 1002),
       (3011, 9891.88, '1990-06-10', 2006, 1001);
       
-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT SUM(amt) FROM orders 
WHERE odate = '2016-01-01'; 

-- 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(DISTINCT city) FROM custumers;

-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT cnum, MIN(amt) FROM orders 
GROUP BY cnum;

-- 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE".
SELECT cname FROM custumers
WHERE cname LIKE 'Г%';

-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, MAX(rating) FROM custumers
GROUP BY city;

-- Задание №2
CREATE TABLE emploies
(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NULL,
	surname VARCHAR(100) NULL,
	speciality VARCHAR(100) NULL,
	seniority INT NULL,
	salary INT NULL,
	age INT NULL
);

INSERT emploies(name, surname, speciality, seniority, salary, age)
VALUES ("Вася", "Васькин", "начальник", 40, 100000, 60),
       ("Петя", "Петькин", "начальник", 8, 70000, 30),
	   ("Катя", "Катькина", "инженер", 2, 70000, 25),
	   ("Саша", "Сашкин", "инженер", 12, 50000, 35),
       ("Маша", "Машкина", "инженериха", 12, 45000, 33),
       ("Иван", "Иванов", "рабочий", 40, 30000, 59);
       
-- Отсортируйте поле “сумма” в порядке убывания:
SELECT * FROM emploies
ORDER BY salary DESC;

--  и возрастания:
SELECT * FROM emploies
ORDER BY salary;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой:
SELECT salary FROM emploies
ORDER BY salary
LIMIT 5;

-- Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000 
SELECT * FROM emploies
WHERE speciality = 'рабочий' AND salary > 20000;