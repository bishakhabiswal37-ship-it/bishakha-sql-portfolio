# Day 6 – Window Functions

## Objective

Learn how to perform advanced row-level analysis using SQL window functions without collapsing the result into groups.

## Concepts Covered

- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- PARTITION BY
- Running totals
- Moving averages
- LAG()
- LEAD()
- Salary comparisons

## Business Problems Solved

1. Rank employees by salary.
2. Rank employees within each department.
3. Compare different ranking functions.
4. Identify top salary levels within departments.
5. Compare employee salary with department average.
6. Calculate cumulative salary.
7. Calculate department-level running totals.
8. Calculate moving salary averages.
9. Compare salary with the previous employee.
10. Compare salary with the next employee.

## Key Learning

Window functions allow analysts to perform calculations across related rows while keeping the original row-level data.

Important patterns:

```sql
RANK() OVER (...)
