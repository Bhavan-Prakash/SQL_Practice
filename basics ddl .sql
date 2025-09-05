create database gpt_Students;

use gpt_Students;

create table Students (
	student_id int primary key,
    name varchar(50) not null,
    age int not null,
    departmant varchar(10),
    marks int not null
);

create table Courses (
	course_id int primary key,
    course_name varchar(50) not null,
    departmant varchar(10)not null
);


insert into Students(student_id,name,age,departmant,marks) values
	(1,"rahul",20,"cse",85),
    (2,"priya",21,"ece",78),
    (3,"amit",22,"cse",92),
    (4,"neha",20,"me",67),
    (5,"ankit",21,"cse",88)
;

insert into Courses (course_id,course_name,departmant) values
	(101,"dbms","cse"),
    (102,"networks","ece"),
    (103,"mechanics","me"),
    (104,"java","cse")
;

-- Q1: Select all students from the CSE department.
select * from Students where departmant = "cse";


-- Q2: Get names of students with marks greater than 80.
select * from Students where marks>80;

-- Q3: List students sorted by marks in descending order.
select * from Students order by marks desc;

-- Q4: Show the top 3 students with the highest marks.
select * from Students order by marks desc limit 3;

-- Q5: Find the average marks of all students.
select avg(marks) from Students;

-- Q6: Count how many students belong to each department.
select departmant, count(name) from Students group by departmant;

-- Q7: Get the highest and lowest marks in the CSE department.
select max(marks) , min(marks) from Students where departmant = "cse";

-- Q8: Find the average marks of students grouped by department.
select departmant, avg(marks) from Students group by departmant;

-- tough questions 

-- Q1: Find all students whose name starts with ‘A’

-- sol: 
	SELECT * 
	FROM Students
	WHERE name LIKE 'A%';
    
-- Q2: Show only those departments where the average marks > 80
-- sol:
	SELECT department, AVG(marks) AS avg_marks
	FROM Students
	GROUP BY department
	HAVING AVG(marks) > 80;

