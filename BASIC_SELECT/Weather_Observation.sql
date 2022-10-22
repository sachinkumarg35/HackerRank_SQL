CREATE DATABASE STATION;
USE STATION;
CREATE TABLE STATION 
(
ID INT PRIMARY KEY,
CITY VARCHAR(210),
STATE VARCHAR(200),
LAT_N INT(200),
LONG_W INT(150)
);

INSERT INTO STATION VALUES (794, 'Kissee', 'Mills MO', 140, 73),
(824, 'Loma', 'Mar CA', 49, 131),
(603, 'Sandy', 'Hook CT', 72, 148),
(478, 'Tipton', 'IN', 34, 98),
(619, 'Arlington', 'CO', 75, 93),
(711, 'Turner', 'AR', 50, 101),
(839, 'Slidell', 'LA', 85, 152),
(754, 'South Haven', 'MI', 145, 53),
(144, 'Eskridge', 'KS', 120, 1);

SELECT * FROM STATION;

#WEATHER OBSERVATION STATION - 1 
#Query a list of CITY and STATE from the STATION table.
SELECT CITY, STATE FROM STATION;

#WEATHER OBSERVATION  STATION - 3
#Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude
#duplicates from the answer.
SELECT DISTINCT CITY FROM STATION WHERE ID % 2 = 0;

 #WEATHER OBSERVATION - 4
 #Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.
 SELECT (count(CITY) - count(DISTINCT CITY)) AS difference FROM STATION;
 
 #WEATHER OBSERVATION STATION - 5
 #Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e., number of characters in the name.) 
 #If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
 
 #Solution - 1 (Single Qurey with UNION) 
 (SELECT CITY, lengTh(CITY) AS len FROM STATION ORDER BY len, CITY LIMIT 1)
 UNION
 (SELECT CITY, length(CITY) AS len FROM STATION ORDER BY len desc, CITY LIMIT 1);
 
 #Solution - 2 (Seperate queries)
 SELECT CITY, length(CITY) as len FROM STATION ORDER BY len, CITY LIMIT 1;
 SELECT CITY, length(CITY) as len FROM STATION ORDER BY len DESC, CITY LIMIT 1;
 
 #WEATHER OBSERVATION STATION - 6
 #Query the list of CITY names starting with vowels (i.e., a, e, i, o, or, u) from STATION. Your result cannot contain duplicates.
 
 #Solution - 1 (Using LIKE Function)
 SELECT DISTINCT CITY FROM STATION WHERE CITY LIKE 'A%'
 OR CITY LIKE 'E%'
 OR CITY LIKE 'I%'
 OR CITY LIKE 'O%'
 OR CITY LIKE 'U%';
 
 #Solution - 2 Using REGEXP_LIKE Function.
 SELECT DISTINCT CITY FROM STATION 
 WHERE REGEXP_LIKE(CITY, '^[aeiou]', 'i');
 
 #Solution - 3 Using LEFT Function
 SELECT DISTINCT CITY FROM STATION
 WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
 
 #WEATHER OBSERVATION STATION - 7
 #Query the list of CITY names ending with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
 
 #Solution - 1 (Using LIKE Function)
 SELECT DISTINCT CITY FROM STATION 
 WHERE CITY LIKE '%A'
 OR CITY LIKE '%E'
 OR CITY LIKE '%I'
 OR CITY LIKE '%O'
 OR CITY LIKE '%U';
 
 #Solution - 2 (Using REGEXP_LIKE) Function
 SELECT DISTINCT CITY FROM STATION
 WHERE REGEXP_LIKE(city, '[aeiou]$', 'i');
 
 #Solution - 3 (Using RIGHT Function)
 SELECT DISTINCT CITY FROM STATION WHERE RIGHT (CITY, 1) in ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
 
 #WEATHER OBSERVATION STATION - 8
 #Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
 
 #Solution - 1(Using REGEXP_LIKE Function)
 SELECT DISTINCT CITY FROM STATION WHERE REGEXP_LIKE(CITY, '^[aeiou].*[aeiou]$', 'i');
 
 #Solution - 2 (Using REGEXP_LIKE function)
 SELECT DISTINCT CITY FROM STATION WHERE REGEXP_LIKE (CITY, '^[aeiou]', 'i')
 AND REGEXP_LIKE(CITY, '[aeiou]$', 'i');
 
 #Solution - 3 (USing LEFT & RIGHT Function)
 SELECT DISTINCT CITY FROM STATION 
 WHERE LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
 AND RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
 
 #WEATHER OBSERVATION STATION - 9
 #Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
 
 #Solution - 1 (Using REGEXP_LIKE Function)
 SELECT DISTINCT CITY FROM STATION
 WHERE NOT REGEXP_LIKE(CITY, '^[aeiou]', 'i');
 
 #Solution - 2 (Using LEFT Function)
 SELECT DISTINCT CITY FROM STATION 
 WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
 
 #WEATHER OBSERVATION STATION - 10
 #Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
 
 #Solution - 1 (Using REGEXP_LIKE Function)
 SELECT DISTINCT CITY FROM STATION
 WHERE NOT REGEXP_LIKE(CITY, '[aeiou]$', 'i');
 
 #Solution - 2 (Using RIGHT Function)
 SELECT DISTINCT CITY FROM STATION
 WHERE RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
 
 #WEATHER OBSERVATION STATION - 11
 #Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
 
 #Solution - 1 (Using REGEXP_LIKE Function)
 SELECT DISTINCT CITY FROM STATION WHERE NOT REGEXP_LIKE(CITY, '^[aeiou]', 'i')
 OR NOT REGEXP_LIKE(CITY, '[aeiou]$', 'i');
 
 #Solution - 2 (Using RIGHT Function)
 SELECT DISTINCT CITY FROM STATION 
 WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
 OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');
 
 #WEATHER OBSERVATION STATION - 12
 #Query the  list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
 
 #Solution - 1 (Using REGEXP_LIKE Function)
 SELECT DISTINCT CITY FROM STATION 
 WHERE NOT REGEXP_LIKE(CITY, '^[aeiou]', 'i')
 AND NOT REGEXP_LIKE(CITY, '[aeiou]$', 'i');
 
 #Soltuion - 2 (Using RIGHT Function)
 SELECT DISTINCT CITY FROM STATION
 WHERE LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U')
 AND RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U');