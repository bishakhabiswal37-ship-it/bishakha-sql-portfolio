-- ============================================
-- DAY 4: CASE WHEN & DATA TRANSFORMATION
-- Author: Bishakha Biswal
-- ============================================


-- Q1. Classify employees based on salary
-- High: >= 70000
-- Medium: >= 50000
-- Low: < 50000

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employees;


-- Q2. Find employees with High salary

SELECT
    name,
    salary,
    'High' AS salary_category
FROM Employees
WHERE salary >= 70000;


-- Q3. Count employees by salary category

SELECT
    salary_category,
    COUNT(*) AS employee_count
FROM (
    SELECT
        CASE
            WHEN salary >= 70000 THEN 'High'
            WHEN salary >= 50000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_category
    FROM Employees
) AS categorized_employees
GROUP BY salary_category;


-- Q4. Total salary expense by salary category

SELECT
    salary_category,
    SUM(salary) AS total_salary
FROM (
    SELECT
        salary,
        CASE
            WHEN salary >= 70000 THEN 'High'
            WHEN salary >= 50000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_category
    FROM Employees
) AS categorized_employees
GROUP BY salary_category
ORDER BY total_salary DESC;


-- Q5. Salary category and salary action
-- High: Maintain
-- Medium: Review
-- Low: Increase

SELECT
    name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,
    CASE
        WHEN salary >= 70000 THEN 'Maintain'
        WHEN salary >= 50000 THEN 'Review'
        ELSE 'Increase'
    END AS salary_action
FROM Employees;


-- Q6. Average salary by salary category

SELECT
    salary_category,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM (
    SELECT
        salary,
        CASE
            WHEN salary >= 70000 THEN 'High'
            WHEN salary >= 50000 THEN 'Medium'
            ELSE 'Low'
        END AS salary_category
    FROM Employees
) AS categorized_employees
GROUP BY salary_category
ORDER BY average_salary DESC;


-- Q7. Find employees whose names have more than 5 characters

SELECT
    name,
    department,
    LENGTH(name) AS name_length
FROM Employees
WHERE LENGTH(name) > 5;


-- Q8. Classify employees based on name length

SELECT
    name,
    LENGTH(name) AS name_length,
    CASE
        WHEN LENGTH(name) > 5 THEN 'Long Name'
        ELSE 'Short Name'
    END AS name_type
FROM Employees;


-- Q9. Find employees with missing salary

SELECT
    name,
    department,
    salary
FROM Employees
WHERE salary IS NULL;


-- Q10. Replace missing salary with 0

SELECT
    name,
    department,
    COALESCE(salary, 0) AS salary
FROM Employees
WHERE salary IS NULL;
