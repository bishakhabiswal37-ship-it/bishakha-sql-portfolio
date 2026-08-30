-- =====================================================
-- SQL PORTFOLIO - DAY 3
-- Topic: SQL JOINs
-- =====================================================

-- 1. Display customer name, city, order ID and amount
SELECT
    c.customer_name,
    c.city,
    o.order_id,
    o.amount
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- 2. Find orders worth more than ₹2,500
SELECT
    c.customer_name,
    o.order_id,
    o.amount
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.amount > 2500;


-- 3. Calculate total spending by customer
SELECT
    c.customer_name,
    SUM(o.amount) AS total_spent
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- 4. Show all customers including those without orders
SELECT
    c.customer_name,
    o.order_id
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id;


-- 5. Find customers with no orders
SELECT
    c.customer_name
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


-- 6. Show all customers and their total spending
--    Customers without orders should show 0
SELECT
    c.customer_name,
    COALESCE(SUM(o.amount), 0) AS total_spent
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- 7. Customer + product + order amount
SELECT
    c.customer_name,
    p.product_name,
    o.amount
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN Products AS p
    ON o.product_id = p.product_id;


-- 8. Electronics orders
SELECT
    c.customer_name,
    p.product_name,
    p.category,
    o.amount
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
INNER JOIN Products AS p
    ON o.product_id = p.product_id
WHERE p.category = 'Electronics';


-- 9. Revenue by product
SELECT
    p.product_name,
    SUM(o.amount) AS total_sales
FROM Orders AS o
INNER JOIN Products AS p
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC;


-- 10. Customer revenue ranking
SELECT
    c.customer_name,
    SUM(o.amount) AS total_spent
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_spent DESC;
