-- Day 6: Window Functions
-- SQL Portfolio
-- Author: Bishakha Biswal

-- Q1. Rank all employees by salary
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        ORDER BY salary DESC
    ) AS salary_rank
FROM Employees
ORDER BY salary_rank;


-- Q2. Rank employees within each department
SELECT
    name,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY salary DESC
    ) AS department_salary_rank
FROM Employees
ORDER BY department, department_salary_rank;


-- Q3. Compare ROW_NUMBER, RANK and DENSE_RANK
SELECT
    name,
    department,
    salary,

    ROW_NUMBER() OVER (
        ORDER BY salary DESC
    ) AS row_number_rank,

    RANK() OVER (
        ORDER BY salary DESC
    ) AS rank_value,

    DENSE_RANK() OVER (
        ORDER BY salary DESC
    ) AS dense_rank_value

FROM Employees
ORDER BY salary DESC;


-- Q4. Find top 2 salary levels in each department
SELECT
    name,
    department,
    salary,
    salary_rank
FROM (
    SELECT
        name,
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employees
) AS ranked_employees
WHERE salary_rank <= 2
ORDER BY department, salary_rank;


-- Q5. Compare employee salary with department average
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        PARTITION BY department
    ) AS department_avg_salary,
    salary - AVG(salary) OVER (
        PARTITION BY department
    ) AS salary_difference
FROM Employees
ORDER BY department, salary DESC;


-- Q6. Calculate running total of salaries
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_salary
FROM Employees
ORDER BY salary DESC;


-- Q7. Calculate running total within each department
SELECT
    name,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY salary DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS department_running_total
FROM Employees
ORDER BY department, salary DESC;


-- Q8. Calculate 3-employee moving average
SELECT
    name,
    department,
    salary,
    AVG(salary) OVER (
        ORDER BY salary DESC
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_average_salary
FROM Employees
ORDER BY salary DESC;


-- Q9. Compare salary with previous employee using LAG
SELECT
    name,
    department,
    salary,
    LAG(salary) OVER (
        ORDER BY salary DESC
    ) AS previous_salary,
    salary - LAG(salary) OVER (
        ORDER BY salary DESC
    ) AS salary_difference
FROM Employees
ORDER BY salary DESC;


-- Q10. Compare salary with next employee using LEAD
SELECT
    name,
    department,
    salary,
    LEAD(salary) OVER (
        ORDER BY salary DESC
    ) AS next_salary,
    salary - LEAD(salary) OVER (
        ORDER BY salary DESC
    ) AS salary_difference
FROM Employees
ORDER BY salary DESC;
