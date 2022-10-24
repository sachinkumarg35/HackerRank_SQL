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
 
 #WEATHER OBSERVATION STATION - 2
 #Query the following two values from the STATION table:
 #1.The sum of all values in LAT_N rounded to a scale of 2 decimal places.
#2.The sum of all values in LONG_W rounded to a scale of 2 decimal places.
select ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;

#WEATHER OBSERVATION STATION - 13
#Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
select round(sum(LAT_N), 4) FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

#WEATHER OBSERVATION STATION - 14
#Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.
select round(max(LAT_N), 4) FROM STATION 
WHERE LAT_N < 137.2345;

#WEATHER OBSERVATION STATION - 15
#Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.
select round(long_w, 4) from station where LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);

#WEATHER OBSERVATION STATION - 16
#Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.
select round(min(LAT_N), 4)
FROM STATION WHERE LAT_N > 38.7780;

#WEATHER OBSERVATION STATION - 17
#Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.
select round(LONG_W, 4) FROM STATION WHERE LAT_N = (SELECT MIN(LAT_N)
FROM STATION WHERE LAT_N > 38.7780);

#WEATHER OBSERVATION STATION - 18
#Problem
#Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.

 #1. happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
 #2. happens to equal the minimum value in Western Longitude (LONG_W in STATION).
 #3. happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
 #4. happens to equal the maximum value in Western Longitude (LONG_W in STATION).
# Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4) FROM STATION;

#WEATHER OBSERVATION STATION - 19
#Problem
#Consider P!(a, c) and P2(c, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c, d) are the 
#respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
#Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.
SELECT ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W)-MIN(LONG_W), 2)), 4) FROM STATION;

#WEATHER OBSERVATION STATION - 20
#Problem
#A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and 
#round your answer to 4 decimal places.
SET @r = 0;
SELECT ROUND(AVG(Lat_N), 4)
FROM (SELECT (@r := @r + 1) AS r, Lat_N FROM Station ORDER BY Lat_N) Temp
WHERE
    r = (SELECT CEIL(COUNT(*) / 2) FROM Station) OR
    r = (SELECT FLOOR((COUNT(*) / 2) + 1) FROM Station);
    

