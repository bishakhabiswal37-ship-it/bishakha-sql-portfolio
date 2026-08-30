# Day 3 — SQL JOINs

## 📌 Topics Covered

- INNER JOIN
- LEFT JOIN
- Primary Keys
- Foreign Keys
- Table Aliases
- JOIN + WHERE
- JOIN + GROUP BY
- Multi-table JOINs
- NULL handling
- COALESCE()

## 🎯 Business Questions

1. Display customer information along with their orders.
2. Find orders above ₹2,500.
3. Calculate total spending by each customer.
4. Show all customers, including customers without orders.
5. Identify customers who have never placed an order.
6. Calculate customer spending including customers with zero orders.
7. Combine customer, order and product information.
8. Analyze Electronics product orders.
9. Identify products generating the highest revenue.
10. Rank customers based on total spending.

## 🛠️ SQL Concepts Used

- SELECT
- INNER JOIN
- LEFT JOIN
- ON
- WHERE
- GROUP BY
- ORDER BY
- SUM()
- COALESCE()
- IS NULL
- Aliases

## 💡 Key Learning

INNER JOIN returns records that have matching values in both tables.

LEFT JOIN keeps every record from the left table, even when there is no matching record in the right table.

COALESCE() can be used to replace NULL values with a specified value such as 0.

## 📊 Business Insight

Using SQL JOINs allows analysts to combine customer, order and product data to answer business questions such as customer spending, product revenue and inactive customers.

## 📁 Dataset

The practice database contains:

- Customers
- Orders
- Products

The tables are connected using customer_id and product_id.
