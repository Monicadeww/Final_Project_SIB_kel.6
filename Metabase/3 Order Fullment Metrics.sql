-- Orders by Gender
SELECT
  c.gender,
  pc.Name AS Product_Category,
  AVG(oi.amount * p.price) AS AverageSpending
FROM
  customer c
JOIN
  orders o ON c.id = o.customer_id
JOIN
  order_items oi ON o.id = oi.order_id
JOIN
  products p ON oi.product_id = p.id
JOIN
  product_categories pc ON p.category_id = pc.id
GROUP BY
  c.gender, Product_Category
ORDER BY
  c.gender, Product_Category;

-- The Count of Orders Per Day for Each Status.
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