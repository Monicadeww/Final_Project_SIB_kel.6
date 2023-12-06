#returns the count of orders per day for each status
SELECT
    DATE(created_at) AS order_date,
    status,
    COUNT(*) AS order_count
FROM
    orders
GROUP BY
    order_date, status
ORDER BY
    order_date, status;