-- Measure the conversion rate of orders with and without coupons
SELECT
    COUNT(DISTINCT CASE WHEN oi.coupon_id IS NOT NULL THEN oi.order_id END) AS orders_with_coupons,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(DISTINCT CASE WHEN oi.coupon_id IS NOT NULL THEN oi.order_id END) * 1.0 / COUNT(DISTINCT oi.order_id) AS conversion_rate
FROM
    order_items oi;

-- Total revenue in 2023
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

-- Total revenue impact and usage count for each coupon.
SELECT
    c.id AS coupon_id,
    c.discount_percent,
    SUM(CASE WHEN oi.coupon_id = c.id THEN oi.amount * p.price * (1 - c.discount_percent) ELSE oi.amount * p.price END) AS total_revenue_with_coupons,
    COUNT(oi.id) AS coupon_usage_count
FROM
    coupons c
LEFT JOIN
    order_items oi ON c.id = oi.coupon_id
LEFT JOIN
    products p ON oi.product_id = p.id
GROUP BY
    c.id, c.discount_percent
ORDER BY
    total_revenue_with_coupons DESC;