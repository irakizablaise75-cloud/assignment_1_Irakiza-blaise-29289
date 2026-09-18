-- Sunrise Supermarket - PL/SQL Assignment One
-- File: 03_queries.sql
-- Database: Oracle Database

/* =========================================================
   Q1. List every order with customer's name, city and date.
   Technique: INNER JOIN
   ========================================================= */
SELECT
    o.order_id,
    c.customer_name,
    c.city,
    o.order_date
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_date, o.order_id;


/* =========================================================
   Q2. List every order item with product details and quantity.
   Technique: JOIN
   ========================================================= */
SELECT
    oi.order_item_id,
    oi.order_id,
    p.product_name,
    p.category,
    p.price,
    oi.quantity,
    oi.quantity * p.price AS line_total
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
ORDER BY oi.order_id, oi.order_item_id;


/* =========================================================
   Q3. List ALL customers and their orders, including
       customers who have never placed an order.
   Technique: LEFT JOIN
   ========================================================= */
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_id,
    o.order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id, o.order_date;


/* =========================================================
   Q4. Calculate each customer's total spending and return
       only customers above the average customer spend.
   Technique: CTE
   ========================================================= */
WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.customer_name,
        NVL(SUM(oi.quantity * p.price), 0) AS total_spent
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    LEFT JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
),
average_spend AS (
    SELECT AVG(total_spent) AS avg_customer_spend
    FROM customer_totals
)
SELECT
    ct.customer_id,
    ct.customer_name,
    ct.total_spent,
    ROUND(a.avg_customer_spend, 2) AS average_customer_spend
FROM customer_totals ct
CROSS JOIN average_spend a
WHERE ct.total_spent > a.avg_customer_spend
ORDER BY ct.total_spent DESC;


/* =========================================================
   Q5. Rank customers by total amount spent, highest first.
   Technique: Window Function - DENSE_RANK()
   ========================================================= */
WITH customer_totals AS (
    SELECT
        c.customer_id,
        c.customer_name,
        NVL(SUM(oi.quantity * p.price), 0) AS total_spent
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi
        ON o.order_id = oi.order_id
    LEFT JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_id,
    customer_name,
    total_spent,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spending_rank
FROM customer_totals
ORDER BY spending_rank, customer_name;


/* =========================================================
   Q6. Number each customer's orders in chronological order.
   Technique: Window Function - ROW_NUMBER()
   ========================================================= */
SELECT
    o.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    ROW_NUMBER() OVER (
        PARTITION BY o.customer_id
        ORDER BY o.order_date, o.order_id
    ) AS customer_order_number
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.customer_id, customer_order_number;


/* =========================================================
   Q7. Show a running total of revenue over time.
   Technique: Window Function - SUM() OVER()
   ========================================================= */
WITH order_revenue AS (
    SELECT
        o.order_id,
        o.order_date,
        SUM(oi.quantity * p.price) AS order_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    JOIN products p
        ON oi.product_id = p.product_id
    GROUP BY o.order_id, o.order_date
)
SELECT
    order_id,
    order_date,
    order_revenue,
    SUM(order_revenue) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_revenue
FROM order_revenue
ORDER BY order_date, order_id;


/* =========================================================
   Q8. For each customer with more than one order, show the
       number of days between the current and previous order.
   Technique: Window Function - LAG()
   ========================================================= */
WITH order_history AS (
    SELECT
        o.customer_id,
        c.customer_name,
        o.order_id,
        o.order_date,
        LAG(o.order_date) OVER (
            PARTITION BY o.customer_id
            ORDER BY o.order_date, o.order_id
        ) AS previous_order_date
    FROM orders o
    JOIN customers c
        ON o.customer_id = c.customer_id
)
SELECT
    customer_id,
    customer_name,
    order_id,
    order_date,
    previous_order_date,
    order_date - previous_order_date AS days_since_previous_order
FROM order_history
WHERE previous_order_date IS NOT NULL
ORDER BY customer_id, order_date;
