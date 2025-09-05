create database management_system;

use management_system;

-- Create the Classes and Students tables with a foreign key class_id.

-- Make sure if a class is deleted, all students in that class are automatically deleted (ON DELETE CASCADE).

create table students(
	student_id int primary key,
    name varchar(50) not null,
    age int not null,
    class_id int,
    foreign key (class_id) references classes(class_id)
    on delete cascade
    on update cascade
);


create table classes(
	class_id int primary key,
    class_name varchar(50) not null,
    teacher varchar(50) not null
);

-- Insert 5 classes and 10 students (assign them to different classes).

insert into classes (class_id,class_name,teacher) values
(101,"class 08","suman"),
(102,"class 09","sashi"),
(103,"class 10","ashish"),
(104,"class 11","parul"),
(105,"class 12","palavi");



insert into students (student_id,name,age,class_id) values
(101,"bhavan",20,101),
(102,"arjun",21,103),
(103,"arush",22,102),
(104,"vansh",21,103),
(105,"kerni",20,105),
(106,"satvik",22,104),
(107,"bhau",22,103),
(108,"rita",20,102),
(109,"kashish",21,105),
(110,"mannu",21,105);

select * from students;
select * from classes;

-- Update all students of "Class 10" to "Class 12".

SET SQL_SAFE_UPDATES = 0;

update classes
set class_name = "class12"
where class_name = "class 10";

update classes
set class_id = 106
where class_id = 103;

-- Delete all students whose age is greater than 20.

delete from students
where age>22;

-- Add a new column email in Students.

alter table students
add column email varchar(50);

select * from students;

-- Modify age column to be SMALLINT.

alter table students
modify age smallint not null;

-- Change column name teacher → class_teacher.

alter table classes 
change column teacher class_teacher varchar(50) not null;

-- Write a query to show student_name, class_name, class_teacher for all students.

SELECT students.name,
       classes.class_name,
       classes.class_teacher
FROM students
INNER JOIN classes
    ON students.class_id = classes.class_id;

