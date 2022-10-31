CREATE DATABASE REPORT;
USE REPORT;

#The Report
CREATE TABLE Students
(ID int primary Key,
Name Char(30),
Marks int(30)
);

Create table Grades
(Grade int primary key,
Min_Mark int(30),
Max_Mark int(30),
foreign key (Grade)
	REFERENCES Students(ID)
    ON DELETE CASCADE
);

INSERT INTO Students VALUES (1, 'Julia', 88),
(2, 'Samantha', 68),
(3, 'Maria', 99),
(4, 'Scarlet', 78),
(5, 'Ashley', 63),
(6, 'Jane', 81);

SELECT * FROM Students;

SET FOREIGN_KEY_CHECKS=0;
SET GLOBAL FOREIGN_KEY_CHECKS=0;
INSERT INTO Grades values (1, 0, 9),
(2, 10, 19),
(3, 20, 29),
(4, 30, 39),
(5, 40, 49),
(6, 50, 59),
(7, 60, 69),
(8, 70, 79),
(9, 80, 89),
(10, 90, 100);

SELECT * FROM Grades;

/* Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn’t want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade — i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use “NULL” as their name and list them by their grades in descending 
order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.*/

SELECT IF(g.Grade<8, NULL, s.Name), g.Grade, s.Marks FROM Students AS s 
JOIN Grades AS g ON s.Marks BETWEEN g.MIN_MARK AND g.Max_Mark ORDER BY g.Grade DESC, s.Name, s.Marks;

#Top Competitors
CREATE TABLE Hackers
(hacker_id int primary key auto_increment,
name char(20)
);

CREATE TABLE Difficulty
(difficulty_level int(20),
score int(30)
);

CREATE TABLE Challenges 
(challenge_id int(20),
hacker_id int(20),
difficulty_level int(20)
);

CREATE TABLE Submissions
(submission_id int(30),
hacker_id int(30),
challenge_id int(30),
score int(30)
);

INSERT INTO Hackers VALUES
(5580, 'Rose'),
(8439, 'Angelia'),
(27205, 'Frank'),
(52243, 'Patrick'),
(52348, 'Lisa'),
(57645, 'Kimberly'),
(77726, 'Bonnie'),
(83082, 'Michael'),
(86870, 'Todd'),
(90411, 'Joe');

SELECT * FROM Hackers;

INSERT INTO Difficulty values
(1, 20),
(2, 30),
(3, 40),
(4, 60),
(5, 80),
(6, 100),
(7, 120);

SELECT * FROM Difficulty;

INSERT INTO Challenges values
(4810, 77726, 4),
(21089, 27205, 1),
(36566, 5580, 7),
(66730, 52243, 6),
(71055, 52243, 2);

SELECT * FROM Challenges;

INSERT INTO Submissions Values
(68628, 77726, 36566, 30),
(65300, 77726, 21089, 10),
(40326, 52243, 36566, 77),
(8941, 27205, 4810, 4),
(83554, 77726, 66730, 30),
(43353, 52243, 66730, 0),
(55385, 52348, 71055, 20),
(39784, 27205, 71055, 23),
(94613, 86870, 71055, 30),
(45788, 52348, 36566, 0),
(93058, 86870, 36566, 30),
(7344, 8439, 66730, 92),
(2721, 8439, 4810, 36),
(523, 5580, 71055, 4),
(49105, 52348, 66730, 0),
(55877, 57645, 66730, 80),
(38355, 27205, 66730, 35),
(3924, 8439, 36566, 80),
(97397, 90411, 66730, 100),
(84162, 83082, 4810, 40),
(97431, 90411, 71055, 30);

SELECT * FROM Submissions;

/* Problem
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers
 who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score.
 If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id. */
 
 select Hackers.hacker_id, Hackers.name from Hackers
 join Submissions
 on Hackers.hacker_id = Submissions.hacker_id
 join Challenges
 on Challenges.challenge_id = Submissions.challenge_id
 join Difficulty
 on Difficulty.difficulty_level = Challenges.difficulty_level
 where Submissions.score = Difficulty.score 
 group by Hackers.hacker_id, Hackers.name having count(*)>1
 order by count(*) desc, Hackers.hacker_id;
 
 #Ollivander's Inventory
 CREATE TABLE Wands 
 (id int primary key auto_increment,
 code int(30),
 coins_needed int(30),
 power int(30)
 );
 
 CREATE table Wands_Property
 (code int(30),
 age int(30),
 is_evil int(30)
 );
 
 insert Wands values (1, 4, 3688, 8),
 (2, 3, 9365, 3),
 (3, 3, 7187, 10),
 (4, 3, 734, 8),
 (5, 1, 6020, 2),
 (6, 2, 6773, 3),
 (7, 3, 9873, 9),
 (8, 3, 7721, 7),
 (9, 1, 1647, 10), 
 (10, 4, 504, 5),
 (11, 2, 7587, 5),
 (12, 5, 9897, 10),
 (13, 3, 4651, 8),
 (14, 2, 5408, 1),
 (15, 2, 6018, 7),
 (16, 4, 7710, 5),
 (17, 2, 8798, 7),
 (18, 2, 3312, 3),
 (19, 4, 7651, 6),
 (20, 5, 5689, 3);
 
 select * from Wands;
 
 insert into Wands_Property values (1, 45, 0),
 (2, 40, 0),
 (3, 4, 1),
 (4, 20, 0),
 (5, 17, 0);
 
 select * from Wands_Property;
 
/* Problem
Harry Potter and his friends are at Ollivander’s with Ron, finally replacing Charlie’s old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to 
print the id, age, coins_needed, and power of the wands that Ron’s interested in, sorted in order of descending power. If more than one wand has same power, sort the result 
in order of descending age. */

select a.id,
b.age,
a.coins_needed,
a.power
From Wands a 
Join Wands_Property b
on a.code = b.code
where b.is_evil = 0
and a.coins_needed = (select Min(a1.coins_needed)
from Wands a1
join Wands_Property b1
on a1.code = b1.code
where b.age = b1.age
and a.power = a1.power)
order by a.power desc,
b.age desc;

#Challenges
CREATE TABLE Hacker
(hacker_id int primary key,
name char(50) NOT NULL
);

CREATE TABLE Challenge
(challenge_id int(20) AUTO_INCREMENT,
hacker_id int(20) NOT NULL,
	FOREIGN key (hacker_id)
    References Hacker(hacker_id)
    ON DELETE CASCADE
);

DESC Challenge;
select * from Challenge;

INSERT INTO Hacker values (5077, 'Rose'),
(21283, 'Angela'),
(62743, 'Frank'),
(88255, 'Patrick'),
(96196, 'Lisa');



INSERT INTO Challenge values (6154, 5077),
(58302, 21283),
(40587, 88255),
(29477, 5077),
(1220, 21283),
(69514, 21283),
(46561, 62743),
(58077, 62743),
(18483, 88255),
(76766, 21283),
(52382, 5077),
(74467, 21283),
(33625, 96196),
(26053, 88255),
(42665, 62743),
(12859, 62743),
(70094, 21283),
(34599, 88255),
(54680, 88255),
(61881, 5077);

select * from Hacker;
select * from Challenge;

/* Problem
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result. */

SELECT HACKER_ID, NAME, TOTAL_CHALLENGE.SUM FROM
(
    SELECT HACKER.HACKER_ID, HACKER.NAME, COUNT(*) AS SUM
    FROM HACKER, CHALLENGE
    WHERE HACKER.HACKER_ID = CHALLENGE.HACKER_ID
    GROUP BY HACKER_ID, NAME
) AS TOTAL_CHALLENGE
JOIN
(
    SELECT SUM, COUNT(*) AS COUNT FROM
    (
        SELECT HACKER.HACKER_ID, HACKER.NAME, COUNT(*) AS SUM
        FROM HACKER, CHALLENGE
        WHERE HACKER.HACKER_ID = CHALLENGE.HACKER_ID
        GROUP BY HACKER_ID, NAME
    ) AS TOTAL_CHALLENGE
    GROUP BY SUM
) AS COUNT_TOTAL
ON TOTAL_CHALLENGE.SUM = COUNT_TOTAL.SUM,
(
    SELECT MAX(SUM) AS MAX FROM
    (
        SELECT HACKER.HACKER_ID, HACKER.NAME, COUNT(*) AS SUM
        FROM HACKER, CHALLENGE
        WHERE HACKER.HACKER_ID = CHALLENGE.HACKER_ID
        GROUP BY HACKER_ID, NAME
    ) AS TOTAL_CHALLENGE
) AS MAX_TOTAL_CHALLENGE
WHERE COUNT_TOTAL.COUNT = 1 OR (TOTAL_CHALLENGE.SUM = MAX_TOTAL_CHALLENGE.MAX)
ORDER BY COUNT_TOTAL.SUM DESC, HACKER_ID ASC;

#Contest Leaderboard
create table Hackers1
(hacker_id int primary key,
name char(100) not null
);

create table Submissions1 
(submission_id int(20) not null,
hacker_id int(20),
challenge_id int(20),
score int(20)
);

insert into Hackers1 values (4071, 'Rose'),
(4806, 'Angela'),
(26071, 'Frank'),
(49438, 'Patrick'),
(74842, 'Lisa'),
(80305, 'Kimberly'),
(84072, 'Bonnie'),
(87868, 'Michael'),
(92118, 'Todd'),
(95895, 'Joe');

insert into Submissions1 values (67194, 74842, 63132, 76),
(64479, 74842, 19797, 98),
(40742, 26071, 49593, 20),
(17513, 4806, 49593, 32),
(69846, 80305, 19797, 19),
(41002, 26071, 89343, 36),
(52826, 49438, 49593, 9),
(31093, 29071, 19797, 2),
(81614, 84072, 49593, 100),
(44829, 26071, 89343, 17),
(75147, 80305, 49593, 48),
(14115, 4806, 49593, 76),
(6943, 4071, 19797, 95),
(12855, 4806, 25917, 13),
(73343, 80305, 49593, 42),
(84264, 84072, 63132, 0),
(9951, 4071, 49593, 43),
(45104, 49438, 25917, 34),
(53795, 74842, 19797, 5),
(26363, 26071, 19797, 29),
(10063, 4071, 49593, 96);

select * from Hackers1;
select * from Submissions1;

/* Problem
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by
 the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  
 from your result. */
select X.hacker_id,
(select H.NAME FROM HACKERS1 H
						where H.HACKER_ID = X.HACKER_ID) NAME,
SUM(X.SCORE) TOTAL_SCORE FROM 
(SELECT HACKER_ID, MAX(SCORE) SCORE FROM SUBMISSIONS1 S
GROUP BY 1, S.CHALLENGE_ID) X
GROUP BY 1
HAVING TOTAL_SCORE > 0
ORDER BY TOTAL_SCORE DESC, HACKER_ID;