CREATE DATABASE ADVANCED_SELECT;
USE ADVANCED_SELECT;
CREATE TABLE TRIANGLE 
(
A INT (40),
B INT(40),
C INT(40)
);

INSERT INTO TRIANGLE VALUES (10, 10, 10),
(15, 15, 15),
(16, 16, 18),
(12, 12, 12),
(20, 20, 23),
(20, 20, 20),
(20, 21, 22),
(13, 14, 30),
(15, 16, 15),
(18, 19, 18),
(19, 20, 19),
(12, 13, 25),
(16, 17, 28);

SELECT * FROM TRIANGLE;
#Type of Triangle
/* Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with 3 sides of equal length.
Isosceles: It's a triangle with 2 sides of equal length.
Scalene: It's a triangle with 3 sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle. */

#SOlution - 1 Using 'AND', 'OR' Clauses
SELECT
  CASE
    WHEN (A + B <= C)
    OR (B + C <= A)
    OR (A + C <= B) THEN 'Not A Triangle'
    WHEN (A = B)
    AND (B = C) THEN 'Equilateral'
    WHEN ((A = B) &(A != C))
    OR ((B = C) &(B != A))
    OR ((A = C) &(A != B)) THEN 'Isosceles'
    WHEN (A != B)
    AND (B != C)
    AND (A != C) THEN 'Scalene'
  END AS Triangle_Type
FROM
  TRIANGLE;
  
#Solution - 2 Using '&' , '|' Operators
SELECT
	CASE
	WHEN (A + B <= C) | (B + C <= A) | (A + C <= B) THEN 'Not A Triangle'
    WHEN (A = B) & (B = C) THEN 'Equilateral'
    WHEN ((A = B) & (A != C)) | ((B = C ) & (B != A)) | ((A = C) & (A != B)) THEN 'Isosceles'
    WHEN (A != B) & (B != C) & (A != C) THEN 'Scalene'
END AS Triangle_Type
FROM TRIANGLE;

#The Pads
CREATE TABLE OCCUPATIONS 
(Name VARCHAR(100),
Occupation VARCHAR(100)
);

INSERT INTO OCCUPATIONS (Name, Occupation) VALUES 
('Samantha', 'Doctor');

INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Julia', 'Actor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Maria', 'Actor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Meera', 'Singer');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Ashley', 'Professor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Ketty', 'Professor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Christeen', 'Professor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Jane', 'Actor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Jenny', 'Doctor');
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES ('Priya', 'Singer');

SELECT * FROM OCCUPATIONS;

/* Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.:enclosed in parentheses).
For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the 
same [occupation_count], they should be ordered alphabetically.

Note: There will be at least two entries in the table for each type of occupation. */

#Solution :- Using CONCAT & LEFT Function
SELECT CONCAT (Name, '(', LEFT (Occupation, 1), ')') AS col1 FROM OCCUPATIONS ORDER BY NAME;

SELECT CONCAT ('There are a total of ', COUNT(Occupation), ' ', lower (Occupation), 's') as col1
FROM Occupations GROUP BY Occupation ORDER BY COUNT(Occupation), Occupation;

#Occupation
/* Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation. */
#Solution :- Using SET, CASE WHEN & ROW_NUM.
SET @d = 0, @p = 0, @s = 0, @a = 0;
SELECT MIN(DOCTOR_NAMES), MIN(PROFESSOR_NAMES), MIN(SINGER_NAMES), MIN(ACTOR_NAMES)
FROM
(
SELECT 
CASE WHEN OCCUPATION = 'Doctor' THEN NAME END AS DOCTOR_NAMES,
CASE WHEN OCCUPATION = 'Professor' THEN NAME END AS PROFESSOR_NAMES,
CASE WHEN OCCUPATION = 'Singer' THEN NAME END AS SINGER_NAMES,
CASE WHEN OCCUPATION = 'Actor' THEN NAME END AS ACTOR_NAMES,
CASE
WHEN OCCUPATION = 'Doctor' THEN (@d := @d + 1)
WHEN OCCUPATION = 'Professor' THEN (@p := @p + 1)
WHEN OCCUPATION = 'Singer' THEN (@s := @s + 1)
WHEN OCCUPATION = 'Actor' THEN (@a := @a + 1)
END AS ROW_NUM
FROM OCCUPATIONS
ORDER BY NAME
) AS TEMP
GROUP BY ROW_NUM;

#Binary Tree Nodes
/* You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

1. Root: If node is root node.
2. Leaf: If node is leaf node.
3. Inner: If node is neither root nor leaf node. */
CREATE TABLE BST 
(N INT(20),
P INT(20)
);

INSERT INTO BST VALUES (1, 2),
(3, 2),
(6, 8),
(9, 8),
(2, 5),
(8, 5),
(5, null);

SELECT * FROM BST;

#Solution - 1: Using CASE WHEN Statement.
SELECT N,
CASE
   WHEN P IS NULL THEN 'Root'
   WHEN (SELECT COUNT(*) FROM BST WHERE B.N=P)>0 THEN 'Inner'
   ELSE 'Leaf'
END AS PLACE
FROM BST B
ORDER BY N;

#Solution - 2 Using IF Statement.
SELECT N,
IF (P IS NULL, 'Root',
IF ((SELECT COUNT(*) FROM BST WHERE B.N = P) > 0, 'Inner', 'Leaf')
) AS PLACE 
FROM BST B
ORDER BY N;

#New Companies
/* SQL Problem Statement:

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
Founder --> Lead Manager --> Senior Manager --> Manager --> Employee.

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers,
 and total number of employees. Order your output by ascending company_code.

NOTE:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10,
 and C_2. */

CREATE TABLE Company 
(Company_Code VARCHAR(100),
Founder VARCHAR(100)
);

CREATE TABLE Lead_Manager 
(Lead_Manager_Code VARCHAR(100),
Company_Code VARCHAR(100)
);

CREATE TABLE Senior_Manager
(Senior_Manager_Code VARCHAR(100),
Lead_Manager_Code VARCHAR(100),
Company_Code VARCHAR(100)
);


CREATE TABLE Manager
(Manager_Code VARCHAR(100),
Senior_Manager_Code VARCHAR(100),
Lead_Manager_Code VARCHAR(100),
Company_Code VARCHAR(100)
);

CREATE TABLE Employee
(Employee_Code VARCHAR(100),
Manager_Code VARCHAR(100),
Senior_Manager_Code VARCHAR(100),
Lead_Manager_Code VARCHAR(100),
Company_Code VARCHAR(100)
);

INSERT INTO Company VALUES ('C1', 'Monika'),
('C2', 'Samantha');

INSERT INTO Lead_Manager VALUES ('LM1', 'C1'),
('LM2', 'C2');

SELECT * FROM Senior_Manager;
INSERT INTO Senior_Manager VALUES('SM1', 'LM1', 'C1'),
('SM2', 'LM1', 'C1'),
('SM3', 'LM2', 'C2');

INSERT INTO Manager VALUES ('M1', 'SM1', 'LM1', 'C1'),
('M2', 'SM3', 'LM2', 'C2'),
('M3', 'SM3', 'LM2', 'C2');

INSERT INTO Employee VALUES ('E1', 'M1', 'SM1', 'LM1', 'C1'),
('E2', 'M1', 'SM1', 'LM1', 'C1'),
('E3', 'M2', 'SM3', 'LM2', 'C2'),
('E4', 'M3', 'SM3', 'LM2', 'C2');

SELECT * FROM Company;
SELECT * FROM Lead_Manager;
SELECT * FROM Senior_Manager;
SELECT * FROM Manager;
SELECT * FROM Employee;

#Solution :- Using LEFT JOIN & COUNT(DISTINCT)
SELECT
	c.company_code,
    c.Founder,
    count(distinct l.lead_manager_code) as no_of_lead_manager,
    count(distinct s.senior_manager_code) as no_of_senior_manager,
    count(distinct m.manager_code) as no_of_manager,
    count(distinct e.employee_code) as no_of_employee
FROM
	Company c
    LEFT JOIN Lead_Manager l ON c.company_code = l.company_code
    LEFT JOIN Senior_Manager s ON c.company_code = s.company_code
    AND l.lead_manager_code = s.lead_manager_code
    LEFT JOIN Manager m ON c.company_code = m.company_code
    AND l.lead_manager_code = m.lead_manager_code
    AND s.senior_manager_code = m.senior_manager_code
    LEFT JOIN Employee e ON c.company_code = e.company_code
    AND l.lead_manager_code = e.lead_manager_code
    AND s.senior_manager_code = e.senior_manager_code
    AND m.manager_code = e.manager_code
GROUP BY
	c.company_code,
    founder
ORDER BY
	c.company_code asc;