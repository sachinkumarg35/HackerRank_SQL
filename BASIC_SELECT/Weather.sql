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