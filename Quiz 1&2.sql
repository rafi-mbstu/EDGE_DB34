
--  Quiz 1
-- ------------------------------
-- 1. Students born after 2003-01-01
SELECT * 
FROM Students 
WHERE dob > '2003-01-01';


-- 2. Distinct department names
SELECT DISTINCT department_name 
FROM Departments;


-- 3. Student name and department name 

SELECT s.name, d.department_name 
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;


-- 4. Insert a new student record

INSERT INTO Students (student_id, name, dob, department_id)
VALUES (205, 'Rafiq', '2004-11-10', 2);

-- ------------------------------
-- Quiz 2

-- 1. Employees with salary > 50,000

SELECT * 
FROM Employees 
WHERE salary > 50000;


-- 2. Employee names and project names 
SELECT e.emp_name, p.proj_name 
FROM Employees e
JOIN Assignments a ON e.emp_id = a.emp_id
JOIN Projects p ON a.proj_id = p.proj_id;


-- 3. Total number of projects per department 

SELECT d.dept_name, COUNT(p.proj_id) AS total_projects
FROM Departments d
JOIN Projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_name;


-- 4. Employees not assigned to any project 

SELECT * 
FROM Employees 
WHERE emp_id NOT IN (
    SELECT DISTINCT emp_id 
    FROM Assignments
);


