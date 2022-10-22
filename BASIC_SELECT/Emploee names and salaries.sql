CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;
CREATE TABLE EMPLOYEE (
Employee_id int Primary Key,
Name Varchar(20),
Months int(20),
Salary int(20)
);

INSERT INTO EMPLOYEE VALUES (12228, 'Rose', 15, 1968),
(33645, 'Angela', 1, 3443),
(45692, 'Frank', 17, 1608),
(56118, 'Patrick', 7, 1345),
(59725, 'Lisa', 11, 2330),
(74197, 'Kimberly', 16, 4372),
(78454, 'Bonnie', 8, 1771),
(83565, 'Michael', 6, 2017),
(98607, 'Todd', 5, 3396),
(99989, 'Joe', 9, '3573');

SELECT * FROM EMPLOYEE;

#Write a query that prints a list of employee names (i.e., the name attribute) from the Employee table in alphabetical order.
SELECT NAME FROM EMPLOYEE ORDER BY NAME;

#Employee Salaries.
#Write a query that prints a list of employee names (i.e., the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees
#for less than 10 months. Sort your result by acending employee_id.

SELECT NAME FROM EMPLOYEE WHERE SALARY > 2000 AND MONTHS < 10 ORDER BY Employee_id ASC;