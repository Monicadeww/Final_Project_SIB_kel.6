#Total revenue
SELECT
  EXTRACT(YEAR FROM o.created_at) AS order_year,
  SUM(oi.amount * p.price) AS total_revenue
FROM
  order_items oi
JOIN
  products p ON oi.product_id = p.id
JOIN
  orders o ON oi.order_id = o.id
GROUP BY
  order_year
ORDER BY
  order_year;