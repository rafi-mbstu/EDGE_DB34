-- Part A – Basic SQL (5 Marks)
-- -----------------------------------

-- 1. Create the Departments table 
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) DEFAULT 'Dhaka'
);


-- 2. Insert a record into Departments
INSERT INTO Departments (dept_id, dept_name, location)
VALUES (101, 'IT', 'Chattogram');

-- 3. Retrieve employees earning more than 50,000

SELECT * 
FROM Employees 
WHERE salary > 50000;


-- 4. Display distinct job designations
SELECT DISTINCT designation 
FROM Employees;

-- . Delete employees in department 103
DELETE FROM Employees 
WHERE dept_id = 103;




--  Part B – Intermediate SQL
-- -----------------------------------
--  1. emp_name, dept_name, location for all employees
SELECT e.emp_name, d.dept_name, d.location
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;


-- 2. Employees not assigned to any project
SELECT * 
FROM Employees 
WHERE emp_id NOT IN (
    SELECT DISTINCT emp_id 
    FROM Assignments
);


-- 3. Average salary per department > 60,000
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 60000;


-- 4. proj_name and total hours worked
SELECT p.proj_name, SUM(a.hours_worked) AS total_hours
FROM Projects p
JOIN Assignments a ON p.proj_id = a.proj_id
GROUP BY p.proj_name;


-- 5. Employees earning more than department average 

SELECT e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM Employees 
    WHERE dept_id = e.dept_id
);




--  Part C – Applied Query
-- -----------------------------------


SELECT d.dept_name, COUNT(p.proj_id) AS number_of_projects, SUM(p.budget) AS total_budget
FROM Departments d
JOIN Projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_name
HAVING COUNT(p.proj_id) > 2 AND SUM(p.budget) > 5000000
ORDER BY total_budget DESC;

