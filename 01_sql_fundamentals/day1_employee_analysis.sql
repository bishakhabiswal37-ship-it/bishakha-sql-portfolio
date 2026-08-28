-- SQL Portfolio: Day 1
-- Topic: SQL Fundamentals
-- Database: Employee Analysis

-- 1. Display employee names and salaries
SELECT name, salary
FROM Employees;


-- 2. Find employees working in IT
SELECT *
FROM Employees
WHERE department = 'IT';


-- 3. Employees earning more than 50,000
SELECT name, salary
FROM Employees
WHERE salary > 50000;


-- 4. Unique employee cities
SELECT DISTINCT city
FROM Employees;


-- 5. Highest-paid employees first
SELECT name, salary
FROM Employees
ORDER BY salary DESC;


-- 6. Top 3 highest-paid employees
SELECT name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 3;


-- 7. IT employees earning more than 60,000
SELECT *
FROM Employees
WHERE department = 'IT'
  AND salary > 60000;


-- 8. Employees from selected cities
SELECT name, city
FROM Employees
WHERE city IN ('Delhi', 'Mumbai', 'Pune');


-- 9. Employees earning between 45,000 and 60,000
SELECT name, salary
FROM Employees
WHERE salary BETWEEN 45000 AND 60000;


-- 10. Employees whose names start with A
SELECT name, department
FROM Employees
WHERE name LIKE 'A%';


-- 11. Employees with missing email addresses
SELECT *
FROM Employees
WHERE email IS NULL;


-- 12. IT or Sales employees earning at least 50,000
SELECT *
FROM Employees
WHERE department IN ('IT', 'Sales')
  AND salary >= 50000
ORDER BY salary DESC;
