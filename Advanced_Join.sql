CREATE DATABASE Advanced_Join;
USE Advanced_Join;
/* SQL PROJECT PLANNIG */
Create table Projects
(Task_ID int primary key not null,
Start_Date date,
End_Date Date);

Insert into Projects Values (1, '2015-10-1', '2015-10-02'),
(2, '2015-10-02', '2015-10-03'),
(3, '2015-10-03', '2015-10-04'),
(4, '2015-10-13', '2015-10-14'),
(5, '2015-10-14', '2015-10-15'),
(6, '2015-10-28', '2015-10-29'),
(7, '2015-10=30', '2015-10-31');

select * from Projects;

/* Problem
You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is 
equal to 1 day for each row in the table.

1443819551 639948acc0 1
If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project 
that have the same number of completion days, then order by the start date of the project. */

select START_DATE, MIN(END_DATE)
FROM
(SELECT START_DATE
FROM PROJECTS
WHERE START_DATE NOT IN 
(SELECT END_DATE
FROM PROJECTS)) A,
(SELECT END_DATE 
FROM PROJECTS
WHERE END_DATE NOT IN 
(SELECT START_DATE 
FROM PROJECTS)) B
WHERE START_DATE < END_DATE
GROUP BY START_DATE
ORDER BY (MIN(END_DATE) - START_DATE), START_DATE;

#Placements
create table Students
(ID int primary key not null auto_increment,
Name char(50) not null);

create table  Friends
(id int primary key not null auto_increment,
Friend_ID int(30) not null);

create table Packages
(ID int(50),
Salary float(50)
);

insert into Students values (1, 'Ashley'),
(2, 'Samantha'),
(3, 'Julia'),
(4, 'Scarlet');

insert into Friends values (1, 2),
(2, 3),
(3, 4),
(4, 1);

insert into Packages values (1, 15.20),
(2, 10.06),
(3, 11.55),
(4, 12.12);

select * from students;
select * from Friends;
select * from Packages;

/* Problem
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and Friend_ID (ID of the ONLY best 
friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).
Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students got same salary offer. */

select temp1.sn
from (select S.ID si, S.Name sn,P.Salary ps from Students S join Packages P on 
S.ID = P.ID) temp1 join (select FF.ID fi, FF.Friend_ID fd, PP.Salary
pps from Friends FF join Packages PP on FF.Friend_ID = pp.ID) temp2 on temp1.si=temp2.fi
and temp1.ps<temp2.pps
order by temp2.pps asc;

#Symmetric Pairs
create table Functions
(X int not null,
Y int(20) not null);


select * from Functions;

insert into Functions values (20, 20), (20, 20), (20, 21), (23, 22), (22, 23), (21, 20);

/* Problem
You are given a table, Functions, containing two columns: X and Y.

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X. List the rows such that X1 ≤ Y1. */

SELECT X, Y FROM FUNCTIONS F1
WHERE EXISTS (SELECT * FROM FUNCTIONS F2 WHERE F2.Y = F1.X
AND F2.X = F1.Y AND F2.X > F1.X) AND (X != Y)
UNION
SELECT X, Y FROM FUNCTIONS F1 WHERE X = Y AND 
((SELECT COUNT(*) FROM FUNCTIONS WHERE X = F1.X AND Y = F1.X) > 1)
ORDER BY X;

/* Interviews */ 
create table Contests 
(contest_id int primary key not null auto_increment,
hacker_id int(30),
name char(50) not null);

create table Colleges 
(college_id int(30),
contest_id int(30));



create table Challenges
(challenge_id int(20) not null,
college_id int(20));

create table View_Stats
(challenge_id int(30),
total_views int(30),
total_unique_views int(30));

create table Submission_Stats
(challenge_id int(30),
total_submission int(30),
total_accepted_submission int(30));

insert into Contests values (66406, 17973, 'Rose'),
(66556, 79153, 'Angela'),
(94828, 80275, 'Frank');

insert into Colleges values (11219, 66406),
(32473, 66556),
(56685, 94828);

insert into Challenges values (18765, 11219),
(47127, 11219),
(60292, 32473),
(72974, 56685);

insert into View_Stats values (47127, 26, 19),
(47127, 15, 14),
(18765, 43, 10),
(18765, 72, 13),
(75516, 35, 17),
(60292, 11, 10),
(72974, 41, 15),
(75516, 75, 11);

insert into Submission_Stats values (75516, 34, 12),
(47127, 27, 10),
(47127, 56, 18),
(75516, 74, 12),
(75516, 83, 8),
(72974, 68, 24),
(72974, 82, 14),
(47127, 28, 11);

select * from Contests;
select * from Colleges;
select * from Challenges;
select * from View_Stats;
select * from Submission_Stats;

SELECT con.contest_id, con.hacker_id, con.name,
SUM(sg.total_submission), SUM(sg.total_accepted_submission),
SUM(vg.total_views), SUM(vg.total_unique_views)
FROM Contests AS con
JOIN Colleges AS col ON con.contest_id = col.contest_id
JOIN Challenges AS cha ON cha.college_id = col.college_id
LEFT JOIN
(SELECT ss.challenge_id, SUM(ss.total_submission) AS total_submission, SUM(ss.total_accepted_submission) AS total_accepted_submission FROM Submission_Stats AS ss GROUP BY ss.challenge_id) AS sg
ON cha.challenge_id = sg.challenge_id
LEFT JOIN
(SELECT vs.challenge_id, SUM(vs.total_views) AS total_views, SUM(vs.total_unique_views) AS total_unique_views
FROM View_Stats AS vs GROUP BY vs.challenge_id) AS vg
ON cha.challenge_id = vg.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING SUM(sg.total_submission) +
       SUM(sg.total_accepted_submission) +
       SUM(vg.total_views) +
       SUM(vg.total_unique_views) > 0
ORDER BY con.contest_id;

/* 15 Days of Learning SQL */
create table Hackers 
(hacker_id int primary key not null auto_increment,
name char(30) not null);

create table Submissions
(submission_date date,
submission_id int,
hacker_id int,
score int);

insert into Hackers Values (15758, 'Rose'),
(20703, 'Angela'),
(36396, 'Frank'),
(38289, 'Patrick'),
(44065, 'Lisa'),
(53473, 'Kimberly'),
(62529, 'Bonnie'),
(79722, 'Michael');

insert into Submissions values ('2016-03-01', 8494, 20703, 0),
('2016-03-01', 22403, 53743, 15),
('2016-03-01', 23965, 79722, 60),
('2016-03-01', 30173, 36396, 70),
('2016-03-02', 34928, 20703, 0),
('2016-03-02', 38740, 15758, 60),
('2016-03-02', 42769, 79722, 25),
('2016-03-02', 44364, 79722, 60),
('2016-03-03', 45440, 20703, 0),
('2016-03-03', 49050, 36396, 70),
('2016-03-03', 50273, 79722, 5),
('2016-03-04', 50344, 20703, 0),
('2016-03-04', 51360, 44065, 90),
('2016-03-04', 54404, 53743, 65),
('2016-03-04', 61533, 79722, 45),
('2016-03-05', 72852, 20703, 0),
('2016-03-05', 74546, 38289, 0),
('2016-03-05', 76487, 62529, 0),
('2016-03-05', 82439, 36396, 10),
('2016-03-05', 90006, 36396, 40),
('2016-03-06', 90404, 20703, 0);

select * from Hackers;
select * from Submissions;

SELECT t1.submission_date, hkr_cnt, t2.hacker_id, name
FROM(SELECT p1.submission_date,
			COUNT(DISTINCT p1.hacker_id) AS hkr_cnt
		FROM(SELECT submission_date, hacker_id,
			@h_rnk := CASE WHEN @h_grp != hacker_id THEN 1 ELSE @h_rnk+1 END AS hacker_rank,
            @h_grp := hacker_id AS hacker_group
		FROM(SELECT DISTINCT submission_date, hacker_id
			FROM submissions
            ORDER BY hacker_id, submission_date) AS a,
            (SELECT @h_rnk := 1, @h_grp := 0) AS r) AS p1
JOIN (SELECT submission_date,
			@d_rnk := @d_rnk +1 AS date_rank
	FROM (SELECT DISTINCT submission_date
		FROM submissions
        ORDER BY submission_date) AS b,
        (SELECT @d_rnk := 0) r) AS p2
	ON p1.submission_date = p2.submission_date
    AND hacker_rank = date_rank
    GROUP BY p1.submission_date) AS t1
JOIN (SELECT submission_date, hacker_id, sub_cnt,
			@s_rnk := CASE WHEN @d_grp != submission_date THEN 1 ELSE @s_rnk + 1 END AS max_rnk,
            @d_grp := submission_date AS date_group
	FROM (SELECT submission_date, hacker_id, COUNT(*) AS sub_cnt
		FROM submissions AS s
        GROUP BY submission_date, hacker_id
        ORDER BY submission_date, sub_cnt DESC, hacker_id) AS c,
        (SELECT @s_rnk := 1, @d_grp := 0) AS r) AS t2
ON t1.submission_date = t2.submission_date AND max_rnk = 1
JOIN Hackers AS h ON h.hacker_id = t2.hacker_id
ORDER BY t1.submission_date;