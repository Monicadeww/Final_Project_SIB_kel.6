-- Total customer by gender
SELECT
  gender,
  COUNT(Id) AS customer_count
FROM
  customer
GROUP BY
  gender;
  
-- Aggregate total spending per customer 
-- Categorize customers into segments (e.g., high spenders, frequent shoppers, one-time buyers)

SELECT
    customer_segment,
    COUNT(*) AS customer_count
FROM (
    SELECT
        CASE
            WHEN total_spending >= 500000 THEN 'High Spender'
            WHEN total_spending >= 100000 AND total_spending < 500000 THEN 'Moderate Spender'
            WHEN total_spending >= 1000 AND total_spending < 100000 THEN 'Low Spender'
            ELSE 'One-Time Buyer'
        END AS customer_segment
    FROM (
        SELECT
            c.id AS customer_id,
            c.first_name,
            c.last_name,
            SUM(p.price * oi.amount) AS total_spending
        FROM
            customer c
        JOIN
            orders o ON c.id = o.customer_id
        JOIN
            order_items oi ON o.id = oi.order_id
        JOIN
            products p ON oi.product_id = p.id
        GROUP BY
            c.id, c.first_name, c.last_name
    ) AS customer_spending
) AS segments
GROUP BY
    customer_segment;