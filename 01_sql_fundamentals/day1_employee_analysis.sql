-- =====================================================
-- SQL PORTFOLIO - DAY 1
-- Topic: SQL Fundamentals
-- Dataset: Employee Analysis
-- =====================================================


-- 1. Display employee names and salaries
SELECT name, salary
FROM Employees;


-- 2. Find employees working in the IT department
SELECT *
FROM Employees
WHERE department = 'IT';


-- 3. Find employees earning more than 50,000
SELECT name, salary
FROM Employees
WHERE salary > 50000;


-- 4. Find unique cities
SELECT DISTINCT city
FROM Employees;


-- 5. Sort employees by salary from highest to lowest
SELECT name, salary
FROM Employees
ORDER BY salary DESC;


-- 6. Find the top 3 highest-paid employees
SELECT name, salary
FROM Employees
ORDER BY salary DESC
LIMIT 3;


-- 7. Find IT employees earning more than 60,000
SELECT *
FROM Employees
WHERE department = 'IT'
  AND salary > 60000;


-- 8. Find employees from Delhi, Mumbai or Pune
SELECT name, city
FROM Employees
WHERE city IN ('Delhi', 'Mumbai', 'Pune');


-- 9. Find employees earning between 45,000 and 60,000
SELECT name, salary
FROM Employees
WHERE salary BETWEEN 45000 AND 60000;


-- 10. Find employees whose names start with A
SELECT name, department
FROM Employees
WHERE name LIKE 'A%';


-- 11. Find employees with missing email addresses
SELECT *
FROM Employees
WHERE email IS NULL;


-- 12. Find IT or Sales employees earning at least 50,000
SELECT name, department, city, salary
FROM Employees
WHERE department IN ('IT', 'Sales')
  AND salary >= 50000
ORDER BY salary DESC;
