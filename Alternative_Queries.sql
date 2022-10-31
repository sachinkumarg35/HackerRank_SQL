#Draw the Triangle 1
SET @TEMP:=10;
SELECT REPEAT('* ', @TEMP:= @TEMP -1)
FROM INFORMATION_SCHEMA.TABLES;

#Draw the Triangle - 2
SET @row := 0;
select repeat('* ', @row := @row+1) from information_schema.tables where @row < 20;

#Print Prime_Numbers
#Write a query to print all prime numbers less than or equal to 1000. Print your result on a single line, and use the ampersand (&) character as your separator 
#(instead of a space).
SELECT GROUP_CONCAT(NUMB SEPARATOR '&')
FROM (
	SELECT @num:= @num+1 as NUMB FROM
    information_schema.tables t1,
    information_schema.tables t2,
    (SELECT @num:=1) tmp
) tempNum
WHERE NUMB <= 1000 AND NOT EXISTS(
SELECT * FROM (
SELECT @nu:= @nu+1 as NUMA FROM
information_schema.tables t1,
information_schema.tables t2,
(SELECT @nu:= 1) tmp1
LIMIT 1000
) tataka
WHERE FLOOR(NUMB/NUMA)=(NUMB/NUMA) AND NUMA<NUMB AND NUMA>1
);