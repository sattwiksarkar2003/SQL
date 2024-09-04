CREATE DATABASE college;

USE college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
);

INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(101,"Anil",78,"C","Pune"),
(102,"Bhumika",93,"A","Mumbai"),
(103,"Chetan",85,"B","Mumbai"),
(104,"Dhruv",96,"A","Delhi"),
(105,"Emanuel",12,"F","Delhi"),
(106,"Farah",82,"B","Delhi");

SELECT name,marks FROM student;

SELECT * FROM student;

SELECT city FROM student;

SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks>80;

SELECT * FROM student WHERE city="Mumbai";

SELECT * FROM student WHERE marks>80 AND city="Mumbai";

SELECT * FROM student WHERE marks+10>100;

SELECT * FROM student WHERE marks>80 OR city="Mumbai";

SELECT * FROM student WHERE marks BETWEEN 80 AND 90;

SELECT * FROM student WHERE city IN ("Mumbai","Delhi");

SELECT * FROM student WHERE city NOT IN ("Mumbai","Delhi");

SELECT * FROM student LIMIT 3;

SELECT * FROM student ORDER BY city ASC;

SELECT * FROM student ORDER BY marks DESC LIMIT 3;

SELECT MAX(marks) FROM student;

SELECT MIN(marks) FROM student;

SELECT AVG(marks) FROM student;

SELECT COUNT(rollno) FROM student;

SELECT COUNT(city) FROM student;

SELECT DISTINCT COUNT(city) FROM student;

SELECT city,COUNT(name) FROM student GROUP BY city;

SELECT city,COUNT(name) FROM student GROUP BY city,name;

SELECT city,AVG(marks) FROM student GROUP BY city ORDER BY avg(marks) ASC;

SELECT grade,count(rollno) FROM student GROUP BY grade ORDER BY grade ASC;

SELECT count(name),city FROM student GROUP BY city HAVING max(marks)>90;

SELECT city
FROM student
WHERE grade="A"
GROUP BY city
HAVING MAX(marks) >= 93
ORDER BY city ASC;

UPDATE student
SET grade="O"
WHERE grade="A";

SET SQL_SAFE_UPDATES=0;

SELECT * FROM student;

UPDATE student
SET marks=82
WHERE rollno = 105;

UPDATE student
SET grade="B"
WHERE marks BETWEEN 80 AND 90;

UPDATE student
SET marks=marks+1;

UPDATE student
SET marks=12
WHERE rollno = 105;

DELETE FROM student 
WHERE marks<33;

USE college;

insert into dept values(101,"English"),(102,"IT");

select * from dept;

CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

DROP TABLE teacher;

insert into teacher values(101,"English",101),(102,"IT",102);

SELECT * FROM teacher;

UPDATE dept SET id=103 WHERE id=102;

ALTER TABLE student ADD COLUMN age INT;

SELECT * FROM student;

ALTER TABLE student DROP COLUMN age;

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student MODIFY COLUMN age VARCHAR(2);

INSERT INTO student
(rollno,name,marks,stu_age)
VALUES
(107,"Bob",68,100);

ALTER TABLE student CHANGE age stu_age INT;

ALTER TABLE student DROP COLUMN stu_age;

ALTER TABLE stu RENAME TO student;

TRUNCATE TABLE student;

ALTER TABLE student CHANGE name full_name VARCHAR(20);

DELETE FROM student WHERE marks<80;

ALTER TABLE student DROP COLUMN grade;

CREATE DATABASE joining;

USE joining;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE course (
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO student(id,name)
VALUES
(101,"adam"),
(102,"bob"),
(103,"casey");

SELECT * FROM student;

INSERT INTO course(id,course)
VALUES
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science");

SELECT * FROM course;

SELECT * FROM student
INNER JOIN course
ON student.id=course.id;

SELECT * FROM student as a
LEFT JOIN course as b
ON a.id=b.id;

SELECT * FROM student as a
RIGHT JOIN course as b
ON a.id=b.id;

SELECT * FROM student as a
LEFT JOIN course as b
ON a.id=b.id
UNION
SELECT * FROM student as a
RIGHT JOIN course as b
ON a.id=b.id;

SELECT * FROM student as a
LEFT JOIN course as b
ON a.id=b.id WHERE b.id IS NULL;

SELECT * FROM student as a
RIGHT JOIN course as b
ON a.id=b.id WHERE a.id IS NULL;

SELECT * FROM student as a
RIGHT JOIN course as b
ON a.id=b.id WHERE a.id IS NULL;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee(id,name,manager_id)
VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"donald",103);

SELECT * FROM employee;

SELECT name FROM employee
UNION
SELECT name FROM employee;

SELECT a.name as manager_name,b.name
FROM employee as a
JOIN employee as b
ON a.id=b.manager_id;

SELECT name FROM employee
UNION ALL
SELECT name FROM employee;

USE college;

SELECT AVG(marks)
FROM student;

ALTER TABLE student CHANGE full_name name VARCHAR(20);

SELECT name, marks
FROM student
WHERE marks>(SELECT AVG(marks) FROM student);

SELECT rollno FROM student WHERE rollno % 2 = 0;

SELECT name,rollno FROM student WHERE rollno IN (SELECT rollno FROM student WHERE rollno % 2 = 0);

SELECT * FROM student WHERE city="Delhi";

SELECT MAX(marks) FROM (SELECT * FROM student WHERE city="Delhi") AS temp;

SELECT (SELECT MAX(marks) FROM student),name FROM student;

CREATE VIEW view1 AS
SELECT rollno,name,marks FROM student;

SELECT * FROM view1;

DROP VIEW view1;