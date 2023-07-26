CREATE DATABASE dz_seminar_6;
USE dz_seminar_6;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER $$
CREATE FUNCTION seconds_format(seconds INT)  
RETURNS VARCHAR(55)
DETERMINISTIC 
READS SQL DATA
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    DECLARE formatted VARCHAR(55);

    SET days = FLOOR(seconds / (24 * 3600));
    SET seconds = seconds % (24 * 3600);
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET formatted = CONCAT(days, " days ", hours, " hours ", minutes, " minutes ", seconds, " seconds");
    RETURN formatted;
END $$

DELIMITER ;

SELECT seconds_format(123456);

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 Данная промежуточная аттестация оценивается по системе 
-- "зачет" / "не зачет" "Зачет" ставится, если слушатель успешно выполнил 1 или 2 задачи "Незачет" ставится, если 
-- слушатель успешно выполнил 0 задач Критерии оценивания: 1 - слушатель верно создал функцию, которая принимает кол-во сек 
-- и формат их в кол-во дней часов. 2 - слушатель выведили только четные числа от 1 до 10.
DELIMITER $$
CREATE PROCEDURE even_numbers()
BEGIN
    DECLARE x INT DEFAULT 1;
    DECLARE even VARCHAR(45) DEFAULT '';
    WHILE x <= 10 DO
        IF x % 2 = 0 THEN
            IF even = '' THEN
                SET even = x;
            ELSE
                SET even = CONCAT(even, ',', x);
            END IF;
        END IF;
        SET x = x + 1;
    END WHILE;
    SELECT even;
END $$
DELIMITER ;

CALL even_numbers(); 