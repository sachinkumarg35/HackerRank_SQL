CREATE DATABASE CITY;
USE CITY;
CREATE TABLE CITY 
(
ID INT PRIMARY KEY,
NAME VARCHAR(17),
COUTRYCODE VARCHAR(3),
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

SELECT COUTRYCODE AS COUNTRYCODE FROM CITY;

#Query all columns for all American cities in the CITY table with populations larger than 100000, the CountryCode for 
#America is USA. 
SELECT * FROM CITY WHERE POPULATION > 100000 AND COUTRYCODE = 'USA';

#REVISING SELECT-2
#Query the NAME field for all american cities in the CITY table with populations larger than 120000. 
#The countrycode for america is USA.
SELECT NAME FROM CITY WHERE POPULATION > 120000 AND COUTRYCODE = 'USA';

#SELECT ALL
#Query all columns (attributes) for every row in the CITY table.
SELECT * FROM CITY;

INSERT INTO CITY VALUES (1661, 'Sayama', 'JPN', 'Saitama', 162472);
SELECT * FROM CITY;

INSERT INTO CITY VALUES (1613, 'Neyagawa', 'JPN', 'Osaka', 257315),
(1630, 'Ageo', 'JPN', 'Saitama', 209442),
(1656, 'Sayama', 'JPN', 'Saitama', 162472),
(1681, 'Omuta', 'JPN', 'Fukuoka', 142889),
(1739, 'Tokuyama', 'JPN', 'Yamaguchi', 107078);	

#SELECT BY ID (Filtering in SQL)
#Query all columns for a city in the CITY with the ID 1661.
SELECT * FROM CITY WHERE ID = 1656;

#Query all attributes of every Japanese city in the CITY table. The countrycode for Japan is 'JPN'
SELECT * FROM CITY WHERE COUTRYCODE = 'JPN';

#Query the names of all the Japanese cities in the CITY table. The countrycode for Japan is JPN.
SELECT NAME FROM CITY WHERE COUTRYCODE = 'JPN';	

