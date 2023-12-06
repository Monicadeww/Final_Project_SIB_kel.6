-- Sales by Product
SELECT
  p.price AS product_price,
  SUM(oi.amount) AS Total_Amount_Sold
FROM
  products p
JOIN
  order_items oi ON p.id = oi.product_id
GROUP BY
  product_price;

-- Sales by Product Category
SELECT
  pc.name AS ProductCategory,
  SUM(oi.amount * p.price) AS TotalSales
FROM
  order_items oi
JOIN
  products p ON oi.product_id = p.id
JOIN
  product_categories pc ON p.category_id = pc.id
GROUP BY
  pc.name;

-- Total Revenue in The Last Year
SELECT
  SUM(oi.amount * p.price) AS total_revenue
FROM
  order_items oi
JOIN
  products p ON oi.product_id = p.id
JOIN
  orders o ON oi.order_id = o.id
WHERE
  o.created_at >= CURRENT_DATE - INTERVAL '1 year';  