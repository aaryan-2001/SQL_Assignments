
-- CREATE DATABASE

CREATE DATABASE SISDB

--This is already in 3NF Becoz there is no non prime column dependent on any super key and
--Each Table has there own primary key and non prime columm are dependent on that only

--------------------------------------------------------------------------------------------------------------------------

-- Data Definition Language (DDL)
-- Creating Tables

--Student Table 

CREATE TABLE Students (
student_id INT PRIMARY KEY IDENTITY,
first_name VARCHAR(255),
last_name VARCHAR(255),
date_of_birth DATE,
email VARCHAR(255),
phone_number VARCHAR(15)
)

-- Teachers table

CREATE TABLE Teachers (
teacher_id INT PRIMARY KEY IDENTITY,
first_name VARCHAR(255),
last_name VARCHAR(255),
email VARCHAR(255)
)

-- Courses Table

CREATE TABLE Courses (
course_id INT PRIMARY KEY IDENTITY,
course_name VARCHAR(255),
credits INT,
teacher_id INT,
FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
)

-- Enrollments table

CREATE TABLE Enrollments (
enrollment_id INT PRIMARY KEY IDENTITY,
student_id INT,
course_id INT,
enrollment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id)
)

-- Payments table

CREATE TABLE Payments (
payment_id INT PRIMARY KEY IDENTITY,
student_id INT,
amount NUMERIC(10, 2),
payment_date DATE,
FOREIGN KEY (student_id) REFERENCES Students(student_id)
)

---------------------------------------------------------------------------------------------------------------------

--Data Manipulation Language (DML)
--a) Insert at least 10 sample records into each of the following tables

--Student Table

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('Aarav', 'Sharma', '2000-01-15', 'aarav.sharma@email.com', '123-456-7890'),
('Aanya', 'Patel', '1999-05-22', 'aanya.patel@email.com', '987-654-3210'),
('Advait', 'Verma', '2001-09-10', 'advait.verma@email.com', '555-123-4567'),
('Ananya', 'Singh', '2002-03-28', 'ananya.singh@email.com', '333-999-0000'),
('Aryan', 'Gupta', '2003-08-12', 'aryan.gupta@email.com', '111-222-3333'),
('Ishaan', 'Malhotra', '2000-12-05', 'ishaan.malhotra@email.com', '444-555-6666'),
('Kavya', 'Joshi', '1999-07-18', 'kavya.joshi@email.com', '777-888-9999'),
('Mira', 'Kumar', '2001-02-20', 'mira.kumar@email.com', '666-444-1111'),
('Riya', 'Trivedi', '2002-06-30', 'riya.trivedi@email.com', '999-888-7777'),
('Varun', 'Verma', '2003-11-08', 'varun.verma@email.com', '222-333-4444')

SELECT * FROM Students

--Teachers Table

INSERT INTO Teachers (first_name, last_name, email)
VALUES
('Professor', 'Sharma', 'prof.sharma@email.com'),
('Dr.', 'Patel', 'dr.patel@email.com'),
('Ms.', 'Verma', 'ms.verma@email.com'),
('Mr.', 'Singh', 'mr.singh@email.com'),
('Professor', 'Gupta', 'prof.gupta@email.com'),
('Dr.', 'Malhotra', 'dr.malhotra@email.com'),
('Ms.', 'Joshi', 'ms.joshi@email.com'),
('Mr.', 'Kumar', 'mr.kumar@email.com'),
('Professor', 'Trivedi', 'prof.trivedi@email.com'),
('Dr.', 'Verma', 'dr.verma@email.com')

SELECT * FROM Teachers

--Course Table

INSERT INTO Courses (course_name, credits, teacher_id)
VALUES
('Mathematics 101', 3, 1),
('History 201', 4, 2),
('Physics 301', 3, 3),
('Computer Science 101', 4, 4),
('Economics 202', 3, 1),
('Chemistry 302', 4, 2),
('Literature 101', 3, 3),
('Programming 303', 4, 4),
('Biology 201', 3, 1),
('Political Science 202', 4, 2)

--Enrollment Table

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2023-01-01'),
(2, 1, '2023-01-02'),
(3, 2, '2023-01-03'),
(4, 6, '2023-01-04'),
(5, 4, '2023-01-05'),
(6, 8, '2023-01-06'),
(7, 6, '2023-01-07'),
(8, 7, '2023-01-08'),
(9, 8, '2023-01-09'),
(10, 9, '2023-01-10')

--Payemnts Table

INSERT INTO Payments (student_id, amount, payment_date)
VALUES
(1, 50.00, '2023-02-01'),
(2, 75.00, '2023-02-02'),
(3, 60.00, '2023-02-03'),
(4, 90.00, '2023-02-04'),
(5, 55.00, '2023-02-05'),
(6, 80.00, '2023-02-06'),
(7, 65.00, '2023-02-07'),
(8, 100.00, '2023-02-08'),
(9, 70.00, '2023-02-09'),
(10, 85.00, '2023-02-10')

---------------------------------------------------------------------------------------------------------------------

--b) Write SQL queries for the following tasks:
--1. Write an SQL query to insert a new student into the "Students" table with the following details:
--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890

INSERT INTO Students(first_name,last_name, date_of_birth, email,phone_number)
VALUES
('John','Doe','1995-08-15','john.doe@example.com','123-456-7890')

---------------------------------------------------------------------------------------------------------------------

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
--insert a record into the "Enrollments" table with the enrollment date.

INSERT INTO Enrollments(student_id, course_id, enrollment_date)
VALUES
(11,8,'2023-11-30')

---------------------------------------------------------------------------------------------------------------------

--3.Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
--modify their email address.

UPDATE Teachers 
SET
email = 'Dr.Sverma@gmail.com'
WHERE teacher_id=10

---------------------------------------------------------------------------------------------------------------------

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
--an enrollment record based on student and course.

DELETE FROM Enrollments
WHERE enrollment_id=6

---------------------------------------------------------------------------------------------------------------------

--5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
--teacher from the respective tables.

UPDATE Courses
SET
teacher_id = 10
WHERE course_id = 10

---------------------------------------------------------------------------------------------------------------------

--6. Delete a specific student from the "Students" table and remove all their enrollment records
--from the "Enrollments" table. Be sure to maintain referential integrity.

DELETE FROM Enrollments
WHERE student_id = 8

DELETE FROM Students
WHERE student_id = 8

DELETE FROM Payments
WHERE student_id = 8

SELECT * FROM Students

SELECT * FROM Enrollments

SELECT * FROM Payments

---------------------------------------------------------------------------------------------------------------------

--7.Update the payment amount for a specific payment record in the "Payments" table. Choose any
--payment record and modify the payment amount.

UPDATE Payments
SET
amount = 1000
WHERE payment_id = 2

SELECT * FROM Payments

---------------------------------------------------------------------------------------------------------------------

--4. Joins

--1. Write an SQL query to calculate the total payments made by a specific student. You will need to
--join the "Payments" table with the "Students" table based on the student's ID

SELECT S.first_name, S.last_name, S.student_id, SUM(P.amount) AS Amount
FROM Payments P
JOIN Students S ON
P.student_id = S.student_id
WHERE S.student_id = 1
GROUP BY S.first_name, S.last_name, S.student_id

---------------------------------------------------------------------------------------------------------------------

--2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
--course. Use a JOIN operation between the "Courses" table and the "Enrollments" table

SELECT C.course_id, C.course_name, COUNT(E.student_id)
AS Enrolled_Student
FROM Courses C
JOIN Enrollments E ON
C.course_id = E.course_id
GROUP BY C.course_id, C.course_name

---------------------------------------------------------------------------------------------------------------------

--3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
--LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments

SELECT S.first_name, S.last_name, S.student_id 
FROM Students S
LEFT JOIN Enrollments E ON
S.student_id = E.student_id
WHERE E.enrollment_id IS NULL

---------------------------------------------------------------------------------------------------------------------

--4. Write an SQL query to retrieve the first name, last name of students, and the names of the
--courses they are enrolled in. Use JOIN operations between the "Students" table and the
--"Enrollments" and "Courses" tables

SELECT S.first_name, S.last_name , C.course_name, E.course_id, S.student_id
FROM Students S,Courses C, Enrollments E
WHERE E.course_id = C.course_id AND  E.student_id = S.student_id

SELECT S.student_id, S.first_name, S.last_name , C.course_name, E.course_id
FROM Students S
JOIN Enrollments E ON
E.student_id=S.student_id
JOIN Courses C ON
E.course_id = C.course_id
GROUP BY E.course_id, S.student_id,S.first_name, S.last_name , C.course_name

---------------------------------------------------------------------------------------------------------------------

--5. Create a query to list the names of teachers and the courses they are assigned to. Join the
--"Teacher" table with the "Courses" table.

SELECT T.first_name, T.last_name, C.course_name
FROM Teachers T
JOIN Courses C ON
T.teacher_id = C.teacher_id

---------------------------------------------------------------------------------------------------------------------

--6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
--"Students" table with the "Enrollments" and "Courses" tables.

SELECT S.first_name, S.last_name, E.enrollment_date
FROM Students S
JOIN Enrollments E ON
S.student_id = E.student_id
JOIN Courses C ON
E.course_id = C.course_id

---------------------------------------------------------------------------------------------------------------------

--7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
--"Students" table and the "Payments" table and filter for students with NULL payment records

SELECT S.first_name, S.last_name 
FROM Students S
LEFT JOIN Payments P ON
S.student_id = P.student_id
WHERE P.student_id IS NULL

SELECT * FROM Payments
SELECT * FROM Students

---------------------------------------------------------------------------------------------------------------------

--8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
--between the "Courses" table and the "Enrollments" table and filter for courses with NULL
--enrollment records.

SELECT C.course_name 
FROM Courses C
LEFT JOIN Enrollments E ON
C.course_id = E.course_id
WHERE E.course_id IS NULL

SELECT * FROM Enrollments
SELECT * FROM Courses

---------------------------------------------------------------------------------------------------------------------

--9.Identify students who are enrolled in more than one course. Use a self-join on the 
--"Enrollments" table to find students with multiple enrollment records.

SELECT DISTINCT E1.student_id, S.first_name, S.last_name
FROM Enrollments E1
JOIN Enrollments E2 ON E1.student_id = E2.student_id 
AND E1.course_id <> E2.course_id
JOIN Students S ON E1.student_id = S.student_id

SELECT * FROM Enrollments

---------------------------------------------------------------------------------------------------------------------

--10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
--table and the "Courses" table and filter for teachers with NULL course assignments.

SELECT T.first_name, T.last_name
FROM Teachers T
LEFT JOIN Courses C ON
C.teacher_id = T.teacher_id
WHERE C.teacher_id IS NULL

--------------------------------------------------------------------------------------------------------------------

--5. Aggregate Functions and Subqueries:

--1. Write an SQL query to calculate the average number of students enrolled in each course. Use
--aggregate functions and subqueries to achieve this.

SELECT AVG(Enrollment_Count) AS average_course
FROM (SELECT C.course_id, COUNT(E.student_id)
AS Enrollment_Count
FROM Courses C
LEFT JOIN Enrollments E ON 
C.course_id = E.course_id
GROUP BY C.course_id)
AS CourseEnrollments


SELECT * FROM Enrollments

--------------------------------------------------------------------------------------------------------------------

--2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
--payment amount and then retrieve the student(s) associated with that amount

SELECT student_id  
FROM Payments 
WHERE amount = (SELECT MAX(amount) FROM Payments)

SELECT * FROM Payments

--------------------------------------------------------------------------------------------------------------------

--3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
--course(s) with the maximum enrollment count.

SELECT course_id
FROM Enrollments
GROUP BY course_id
HAVING COUNT(student_id) = (SELECT MAX(enrollment_count) FROM
(SELECT COUNT(student_id) AS enrollment_count FROM Enrollments GROUP BY course_id) AS course_enrollments
)

SELECT * FROM Enrollments

--------------------------------------------------------------------------------------------------------------------

--4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
--payments for each teacher's courses.

SELECT T.teacher_id, T.first_name, T.last_name,
(SELECT SUM(P.amount)
FROM Enrollments E
JOIN Payments P ON
E.student_id = P.student_id
WHERE E.course_id IN (SELECT course_id FROM Courses WHERE teacher_id = T.teacher_id)) AS total_payments
FROM Teachers T

--------------------------------------------------------------------------------------------------------------------

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a
-- student's enrollments with the total number of courses.

SELECT S.first_name, S.last_name
FROM Students S
WHERE (SELECT COUNT(DISTINCT C.course_id)
FROM Courses C) = 
(SELECT COUNT(DISTINCT E.course_id) 
FROM Enrollments E 
WHERE E.student_id= S.student_id)

--------------------------------------------------------------------------------------------------------------------

--6.Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
--find teachers with no course assignments.

SELECT T.first_name, T.last_name
FROM Teachers T
WHERE T.teacher_id NOT IN (SELECT DISTINCT C.teacher_id FROM Courses C)

--------------------------------------------------------------------------------------------------------------------

--7. Calculate the average age of all students. Use subqueries to calculate the age of each student
-- based on their date of birth.

SELECT ABS(AVG(DATEDIFF(YEAR, GETDATE(), date_of_birth)))
FROM Students

--------------------------------------------------------------------------------------------------------------------

--8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

SELECT Course_id, course_name FROM Courses WHERE Course_id NOT IN
(SELECT DISTINCT Course_id FROM Enrollments)

SELECT * FROM Enrollments

--------------------------------------------------------------------------------------------------------------------

--9. Calculate the total payments made by each student for each course they are enrolled in. Use
--subqueries and aggregate functions to sum payments.

SELECT student_id, course_id,(SELECT SUM(p.amount) FROM Payments P WHERE P.student_id = E.student_id) AS total_payments
FROM Enrollments E

SELECT * FROM Payments

--------------------------------------------------------------------------------------------------------------------

--10. Identify students who have made more than one payment. Use subqueries and aggregate
--functions to count payments per student and filter for those with counts greater than one.


SELECT student_id, COUNT(*) AS Payment_Count
FROM Payments
GROUP BY student_id
HAVING COUNT(*)>1

--------------------------------------------------------------------------------------------------------------------

--11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
--table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

SELECT S.student_id, S.first_name, S.last_name, SUM(P.amount)
FROM Students S
LEFT JOIN Payments P ON
S.student_id=P.student_id
GROUP BY S.student_id, S.first_name, S.last_name

--------------------------------------------------------------------------------------------------------------------

--12. Retrieve a list of course names along with the count of students enrolled in each course. Use
--JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

SELECT C.course_id, C.course_name, COUNT(E.student_id) as Student_Count
FROM Courses C
LEFT JOIN Enrollments E ON
C.course_id = E.course_id
GROUP BY C.course_id, C.course_name

SELECT * FROM Enrollments

--------------------------------------------------------------------------------------------------------------------

--13. Calculate the average payment amount made by students. Use JOIN operations between the
--"Students" table and the "Payments" table and GROUP BY to calculate the average.

SELECT  S.student_id, S.first_name, S.last_name, AVG(P.amount) as avg_amount
FROM Students S
LEFT JOIN Payments P ON
S.student_id = p.student_id
GROUP BY S.first_name, S.last_name, s.student_id

SELECT * FROM Payments

--------------------------------------------------------------------------------------------------------------------
