#Categorize customers into segments (e.g., high spenders, frequent shoppers, one-time buyers)
SELECT
    id,
    first_name,
    last_name,
    total_spending,
    CASE
        WHEN total_spending >= 500000 THEN 'High Spender'
        WHEN total_spending >= 100000 AND total_spending < 500000 THEN 'Moderate Spender'
        WHEN total_spending >= 1000 AND total_spending < 100000 THEN 'Low Spender'
        ELSE 'One-Time Buyer'
    END AS customer_segment
FROM (
    SELECT
        c.id,
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
) AS customer_spending;