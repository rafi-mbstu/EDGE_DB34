# 📊 EDGE_DB34 – Advanced SQL Solutions

This repository contains MySQL query solutions for the **Final Exam** and **Project** of course DB2434, focused on advanced SQL and applied database scenarios.

## 📁 Contents

- `DB 2434_18_Final exam.sql` – Solutions to final exam questions (Part A & Part B)
- `DB 2434_18_Project.sql` – Solutions to project-based SQL tasks
- `FinalExam 34-37 question.pdf` – Original exam questions
- `Project 34-37 problem stat.pdf` – Project problem statement

## 🧠 Topics Covered

- Views and stored procedures
- Correlated subqueries
- Aggregation and filtering
- Joins across multiple tables
- Department-level performance analysis

## 🏫 Schema Overview

```sql
Students(student_id, name, dob, department_id)
Departments(department_id, department_name)
Courses(course_id, course_name, department_id)
Enrollments(enrollment_id, student_id, course_id, grade)
