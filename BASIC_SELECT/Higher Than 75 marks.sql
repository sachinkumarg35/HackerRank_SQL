CREATE DATABASE STUDENT;
USE STUDENT;
CREATE TABLE STUDENT
(
ID INT PRIMARY KEY,
NAME VARCHAR(20),
MARKS INT(20)
);

INSERT INTO STUDENT VALUES (1, 'Ashley', 81),
(2, 'Samantha', 75), 
(3, 'Julia', 76),
(4, 'Belvet', 84), 
(5, 'Stuart',  85), 
(6, 'Kristeen', 86),
(7, 'Christene', 87),
(8, 'Amina', 88),
(9, 'Priya', 84), 
(10, 'Heraldo', 80), 
(11, 'Scarlet', 82),
(12, 'Salma', 86),
(13, 'Britney', 89),
(14, 'Priyanka', 83);

SELECT * FROM STUDENT;

#Query the name of any student in STUDENTS who scored higher than 75 marks. order your output by the last three character of each name. If two or more students both have name 
#ending in the same last three characters (i.e., Bobby, Robby, etc.), Secondary sort them by ascending ID.

SELECT NAME FROM STUDENT WHERE MARKS > 75 ORDER BY RIGHT(NAME, 3) ASC, ID ASC;