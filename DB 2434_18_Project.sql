-- PROJECT: EDGE DB 34

-- Part A – Advanced SQL

-- 11. Query to create a view named TopStudents that shows student_id, name, and average_grade for students whose average grade is greater than 3.5.

CREATE VIEW TopStudents AS
SELECT s.student_id, s.name, AVG(e.grade) AS average_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING AVG(e.grade) > 3.5;


-- 12. Query to write a stored procedure to increase the grade of all students in a given course by 0.5 (maximum grade is 4.0).
DELIMITER //

CREATE PROCEDURE IncreaseGrade(IN input_course_id INT)
BEGIN
    UPDATE Enrollments
    SET grade = CASE 
        WHEN grade + 0.5 > 4.0 THEN 4.0
        ELSE grade + 0.5
    END
    WHERE course_id = input_course_id;
END //

DELIMITER ;


-- 13. Query to list the students whose grade in any course is the highest grade for that course.
SELECT s.student_id, s.name
FROM DISTINCT Students s
JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.grade = (
    SELECT MAX(e2.grade)
    FROM Enrollments e2
    WHERE e2.course_id = e.course_id
);



-- Part B – Applied Scenario
-- Question: Using the above schema, write a single SQL query to produce the following report:
-- department_name,
-- total_students in the department,
-- average_grade of the department,
-- number_of_courses offered by the department,
--  Show only departments with at least 2 courses, ordered by average_grade in descending order.

SELECT d.department_name,
       COUNT(DISTINCT s.student_id) AS total_students,
       ROUND(AVG(e.grade),2) AS average_grade,
       COUNT(DISTINCT c.course_id) AS number_of_courses
FROM Departments d
JOIN Students s ON d.department_id = s.department_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON d.department_id = c.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(DISTINCT c.course_id) >= 2
ORDER BY average_grade DESC;
