/*
========================================================
DAY 5 - SUBQUERIES & CTEs
Author: Bishakha Biswal
Portfolio: SQL Data Analysis
========================================================

Topics Covered:
- Scalar Subqueries
- Aggregate Subqueries
- Correlated Subqueries
- IN Subqueries
- Common Table Expressions (CTEs)
- Multiple CTEs
- ROW_NUMBER() Preview
- Top-N Analysis
========================================================
*/


-- =====================================================
-- Q1. Employees earning above the overall company average
-- =====================================================

SELECT
    name,
    department,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


-- =====================================================
-- Q2. Employee(s) with the highest salary
-- =====================================================

SELECT
    name,
    department,
    salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
);


-- =====================================================
-- Q3. Employees earning above their department average
-- =====================================================

SELECT
    name,
    department,
    salary
FROM Employees AS e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees AS e2
    WHERE e2.department = e.department
);


-- =====================================================
-- Q4. Employees working in departments
--     where average salary is above 60,000
-- =====================================================

SELECT
    name,
    department,
    salary
FROM Employees
WHERE department IN (
    SELECT department
    FROM Employees
    GROUP BY department
    HAVING AVG(salary) > 60000
);


-- =====================================================
-- Q5. Department with the highest average salary
-- =====================================================

WITH department_salary AS (
    SELECT
        department,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department
)

SELECT
    department,
    average_salary
FROM department_salary
ORDER BY average_salary DESC
LIMIT 1;


-- =====================================================
-- Q6. Employees earning above company average using CTE
-- =====================================================

WITH company_average AS (
    SELECT
        AVG(salary) AS average_salary
    FROM Employees
)

SELECT
    e.name,
    e.department,
    e.salary
FROM Employees AS e
CROSS JOIN company_average AS ca
WHERE e.salary > ca.average_salary;


-- =====================================================
-- Q7. Department with the highest total salary expense
-- =====================================================

WITH department_salary AS (
    SELECT
        department,
        SUM(salary) AS total_salary
    FROM Employees
    GROUP BY department
)

SELECT
    department,
    total_salary
FROM department_salary
ORDER BY total_salary DESC
LIMIT 1;


-- =====================================================
-- Q8. Second-highest salary
-- =====================================================

WITH salaries AS (
    SELECT DISTINCT
        salary
    FROM Employees
)

SELECT
    MAX(salary) AS second_highest_salary
FROM salaries
WHERE salary < (
    SELECT MAX(salary)
    FROM salaries
);


-- =====================================================
-- Q8B. Employee(s) earning the second-highest salary
-- =====================================================

WITH salaries AS (
    SELECT DISTINCT
        salary
    FROM Employees
),
second_highest AS (
    SELECT
        MAX(salary) AS salary
    FROM salaries
    WHERE salary < (
        SELECT MAX(salary)
        FROM salaries
    )
)

SELECT
    e.name,
    e.department,
    e.salary
FROM Employees AS e
JOIN second_highest AS s
    ON e.salary = s.salary;


-- =====================================================
-- Q9. Top 3 salaries in each department
--     Using CTE + ROW_NUMBER()
-- =====================================================

WITH ranked_employees AS (
    SELECT
        name,
        department,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employees
)

SELECT
    name,
    department,
    salary,
    salary_rank
FROM ranked_employees
WHERE salary_rank <= 3
ORDER BY department, salary_rank;


-- =====================================================
-- Q10. Department salary analysis
--      Average salary > 60,000
-- =====================================================

WITH department_stats AS (
    SELECT
        department,
        COUNT(*) AS employee_count,
        SUM(salary) AS total_salary,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department
)

SELECT
    department,
    employee_count,
    total_salary,
    average_salary
FROM department_stats
WHERE average_salary > 60000
ORDER BY average_salary DESC;


/*
========================================================
KEY LEARNINGS

1. Subqueries allow one query to use the result of another.
2. Correlated subqueries compare rows with their own groups.
3. CTEs make complex SQL easier to read and maintain.
4. ROW_NUMBER() can rank records within groups.
5. Top-N analysis is a common business analytics requirement.
========================================================
*/
