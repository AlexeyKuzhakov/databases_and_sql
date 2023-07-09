CREATE DATABASE lesson_1;
USE lesson_1;

CREATE TABLE student
(
	id int not null auto_increment primary key,
    name varchar(45),
    course_name varchar(100),
    email varchar(20)
);

INSERT INTO student(name, course_name, email)
VALUES ("Alexey", "Java", "alexey@gmail.com"),
       ("Sergey", "Python", "ser@gmail.com"),
       ("John", "C#", "john@gmail.com"),
       ("Bob", "Java", "bob@gmail.com");

SELECT * FROM student;

SELECT * FROM student
WHERE name = 'Bob';

SELECT s.name 'Имя', course_name FROM student s;

SELECT * FROM student
WHERE course_name LIKE "J%";

SELECT * FROM student
WHERE course_name LIKE "%A%";