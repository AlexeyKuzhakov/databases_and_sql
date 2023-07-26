CREATE DATABASE dz_seminar_5;
USE dz_seminar_5;

CREATE TABLE cars
(
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(20),
    Cost INT
);

INSERT INTO cars(Name, Cost)
VALUES ('Audi', 52642),
       ('Mercedes', 57127),
       ('Skoda', 9000),
       ('Volvo', 29000),
       ('Bentley', 350000),
       ('Citroen', 21000),
       ('Hummer', 41400),
       ('Volkswagen', 21600);
       
SELECT * FROM cars;       
       
-- Создайте представление, в которое попадут автомобили стоимостью до 25 000
CREATE VIEW CheapCars AS 
SELECT * FROM cars 
WHERE Cost < 25000;

-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW CheapCars AS 
SELECT * FROM cars
WHERE Cost < 30000;

SELECT * FROM CheapCars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично) 
CREATE VIEW CheapCars_2 AS
SELECT * FROM cars
WHERE Name IN ('Skoda', 'Audi');

SELECT * FROM CheapCars_2;

-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
-- Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; an_cost — себестоимость анализа; 
-- an_price — розничная цена анализа; an_group — группа анализов. 
-- Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; gr_temp — температурный режим хранения. 
-- Есть таблица заказов Orders: ord_id — ID заказа; ord_datetime — дата и время заказа; ord_an — ID анализа.

SELECT an_name, an_price, ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_id
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';