-- Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
CREATE DATABASE dz_seminar_1;
USE dz_seminar_1;

CREATE TABLE mobile_phone
(
	id int not null auto_increment primary key,
    brand varchar(30),
    model varchar(40),
    year_of_issue int,
    quantity int,
    price float
);

INSERT INTO mobile_phone(brand, model, year_of_issue, quantity, price)
VALUES ("Samsung", "Galaxy Z Fold4", 2022, 3, 104990),
	   ("Samsung", "Galaxy S23 Ultra", 2023, 1, 119999),
       ("Asus", "Pegasus 4S", 2017, 2, 4500),
       ("Xiaomi", "Mi Note 10 Lite", 2020, 4, 30990),
       ("Nokia", "6.1 Plus", 2018, 2, 9900),
       ("Nokia", "Lumia 735", 2014, 3, 10900),
       ("Samsung", "Galaxy M12", 2021, 1, 15140);

       
-- Выведите название, производителя и цену для товаров, количество которых превышает 2
SELECT model, brand, price FROM mobile_phone
WHERE quantity > 2;

-- Выведите весь ассортимент товаров марки “Samsung”
SELECT * FROM mobile_phone
WHERE brand = "Samsung"