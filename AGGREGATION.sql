CREATE DATABASE AGGREGATION;
USE AGGREGATION;
CREATE TABLE CITY (
ID INT PRIMARY KEY,
NAME VARCHAR(17),
COUNTRYCODE VARCHAR(20),
DISTRICT VARCHAR(20),
POPULATION INT(20)
);

INSERT INTO CITY VALUES (6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),
(3965, 'Corona', 'USA', 'California', 124966),
(3973, 'Concord', 'USA', 'California', 121780),
(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),
(3982, 'Coral Springs', 'USA', 'Florida', 117549),
(4054, 'Fairfield', 'USA', 'California', 92256),
(4058, 'Boulder', 'USA', 'Colorado', 91238),
(4061, 'Fall River', 'USA','Massachusetts', 90555);

SELECT * FROM CITY;

#1. Revising Aggregations - The Count Function
#Query a count of the number of cities in the CITY having a population larger than 100000.
select count(*) from city where population > 100000;

#2. Revising Aggregations - The Sum Function
#Query the total population of all cities in CITY where district is california.
select sum(POPULATION) from CITY where DISTRICT = 'California';

#3. Revising Aggregations - Averages
#Query the average population of all cities in CITY where district is California.
select avg(POPULATION) FROM CITY WHERE DISTRICT = 'California';

#4. Average Population
#Query the average population for all cities in CITY, rounded down to the nearest integer.
#Solution - 1 (Using Round and AVG Function)
SELECT ROUND(AVG(POPULATION), 0) FROM CITY;

#Solution - 2 (Using Floor and avg function)
select FLOOR(avg(POPULATION)) FROM CITY; 

#5. Japan Population
#Query the sum of populations for all japanies cities in CITY. The COUNTRYCODE for japan is JPN.
select sum(POPULATION) FROM CITY WHERE COUNTRYCODE = 'JPN';

#6. Population Density Difference
#Query the difference between the maximum and minimum populations in CITY.
select MAX(POPULATION) - MIN(POPULATION) FROM CITY;

#7. The Blunder
#Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after 
#completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed),and the actual average salary.
#Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

CREATE TABLE EMPLOYEES (
ID INT PRIMARY KEY,
NAME VARCHAR(20),
SALARY INT(20),
FOREIGN KEY (ID)
	REFERENCES CITY(ID)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

SET FOREIGN_KEY_CHECKS = 1;
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO EMPLOYEES (ID, NAME, SALARY)
VALUES (1, 'Kristeen', 1420),
(2, 'Ashley', 2006),
(3, 'Julia', 2210),
(4, 'Maria', 3000);

SELECT * FROM EMPLOYEES;

#Solution -> Using MAX and MIN Function
SELECT CEIL(AVG(SALARY) - AVG(REPLACE(SALARY, '0', ''))) FROM EMPLOYEES;

#8. Top Earners
#We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the 
#Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
#Then print these values as 2 space-separated integers.Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it 
#up to the next integer.
CREATE TABLE Employee_Table (
Employee_id int,
Name varchar(20),
Months INT(20),
Salary int(20),
FOREIGN KEY(Employee_id)
	REFERENCES CITY(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO Employee_Table VALUES (12228, 'Rose', 15, 1968),
(33645, 'Angela', 1, 3443),
(45692, 'Frank', 17, 1608),
(56118, 'Patrick', 7, 1345),
(59725, 'Lisa', 11, 2330),
(74197, 'Kimberly', 16, 4372),
(78454, 'Bonnie', 8, 1771),
(83565, 'Michael', 6, 2017),
(98607, 'Todd', 5, 3396),
(99989, 'Joe', 9, 3573);

SELECT * FROM Employee_Table;
#The maximum earnings value is 69952. The only employee with earnings = 69952 is Kimberly, so we print the maximum earnings value (69952) and a count of the number of 
#employees who have earned $69952 (which is 1) as two space-separated values.

#Solution - 1 (Using GROUP BY, ORDER BY & LIMIT)
select (Salary * Months) as Max_Salary, count(*) from Employee_Table
GROUP BY Max_Salary
ORDER BY Max_Salary DESC
LIMIT 1;

#Solution - 2 (Using GROUP BY & SUB-QUERY)
SELECT SALARY*MONTHS, COUNT(*)
FROM Employee_Table
WHERE (SALARY*MONTHS) = (SELECT MAX(SALARY*MONTHS) FROM Employee_Table) 
GROUP BY SALARY*MONTHS;

#Solution - 3 (Using MAX & SUB query)
select max(Salary * Months), count(*)
From Employee_Table
where (Salary * Months) = (Select Max(Salary * Months) from Employee_Table);

#Weather Observation Station - 2
