-- =====================================================
-- SQL PORTFOLIO - DAY 2
-- Topic: Aggregate Functions, GROUP BY & HAVING
-- Dataset: Employee Analysis
-- =====================================================


-- 1. Count the total number of employees
SELECT COUNT(*) AS total_employees
FROM Employees;


-- 2. Calculate the total salary expense
SELECT SUM(salary) AS total_salary
FROM Employees;


-- 3. Calculate the average salary
SELECT AVG(salary) AS average_salary
FROM Employees;


-- 4. Find the minimum and maximum salary
SELECT
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM Employees;


-- 5. Count employees in each department
SELECT
    department,
    COUNT(*) AS total_employees
FROM Employees
GROUP BY department;


-- 6. Calculate total salary expense by department
SELECT
    department,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY department;


-- 7. Calculate average salary by department
SELECT
    department,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department;


-- 8. Find minimum and maximum salary by department
SELECT
    department,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM Employees
GROUP BY department;


-- 9. Find departments with total salary expense
--    greater than 100,000
SELECT
    department,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 100000;


-- 10. Find departments with at least 3 employees
--     and average salary greater than 50,000
SELECT
    department,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department
HAVING COUNT(*) >= 3
   AND AVG(salary) > 50000
ORDER BY average_salary DESC;


-- 11. Find cities with at least 2 employees
--     and total salary greater than 90,000
SELECT
    city,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY city
HAVING COUNT(*) >= 2
   AND SUM(salary) > 90000
ORDER BY total_salary DESC;
