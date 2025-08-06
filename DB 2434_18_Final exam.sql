-- Final exam EDGE program
-- Program: DB 34

-- Part A – Basic SQL
-- 1. SQL statements to create table Students
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE,
    dob DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- 2. Query to insert two new rows
INSERT INTO Students (student_id, name, email, dob, department_id)
VALUES 
    (101, 'John Doe', 'john@example.com', '2002-06-15', 2),
    (102, 'Jane Smith', 'jane@example.com', '2001-10-30', 1);

-- 3. Query to retrieve all students born after 2002, sorted by name in descending order
SELECT * FROM Students
WHERE dob > '2002-01-01'
ORDER BY name DESC;

-- 4. Query to display the total number of students in each department.
SELECT department_id, COUNT(*) AS total_students
FROM Students
GROUP BY department_id;

-- 5. Query to delete all students from the Students table whose dob is before 2000-01-01.
DELETE FROM Students
WHERE dob < '2000-01-01';


-- Part B – Intermediate SQL

-- 6. Query to retrieve the name and department_name of all students.
SELECT s.name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;


-- 7. Query to find the average grade of each course. Only show courses with an average grade greater than 3.0.
SELECT c.course_name, AVG(e.grade) AS average_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_id, c.course_name
HAVING AVG(e.grade) > 3.0;


-- 8. Query to display all students who have not enrolled in any course.
SELECT s.*
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;


-- 9. Query to display the course_name and the number of students enrolled in each course, ordered from highest to lowest.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY student_count DESC;


-- 10. Query to list all students whose grade in any course is above the average grade of that course.
SELECT s.*
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
JOIN (
    SELECT course_id, AVG(grade) AS avg_grade
    FROM Enrollments
    GROUP BY course_id
) avg_grades ON e.course_id = avg_grades.course_id
WHERE e.grade > avg_grades.avg_grade;



