# Day 5 - Subqueries & CTEs

## 📌 Objective

Learn how to use subqueries and Common Table Expressions (CTEs) to solve more advanced SQL analysis problems.

This day focuses on transforming intermediate results into meaningful business insights.

---

## 🛠️ SQL Concepts Covered

- Scalar Subqueries
- Aggregate Subqueries
- Correlated Subqueries
- `IN` Subqueries
- Common Table Expressions (`WITH`)
- Multiple CTEs
- `ROW_NUMBER()`
- Ranking
- Top-N Analysis
- Nested Queries
- `GROUP BY`
- `HAVING`
- `ORDER BY`

---

## 📊 Business Problems Solved

### 1. Above-Average Employees
Identified employees earning more than the overall company average salary.

### 2. Highest-Paid Employees
Found employees receiving the maximum salary in the company.

### 3. Above Department Average
Identified employees whose salary is higher than the average salary of their own department.

### 4. High-Paying Departments
Found employees working in departments where the average salary exceeds ₹60,000.

### 5. Highest Average Salary
Identified the department with the highest average salary.

### 6. CTE-Based Salary Analysis
Used a CTE to calculate the company-wide average salary and identify employees earning above it.

### 7. Highest Salary Expense
Identified the department with the highest total salary expense.

### 8. Second-Highest Salary
Found the second-highest distinct salary and the employee(s) receiving it.

### 9. Top 3 Employees by Department
Used `ROW_NUMBER()` with `PARTITION BY` to identify the top 3 salaries within each department.

### 10. Department Salary Analysis
Calculated employee count, total salary expense, and average salary for departments with an average salary above ₹60,000.

---

## 🧠 Key Learning

### Subquery

A subquery is a query inside another query.

```sql
SELECT *
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
