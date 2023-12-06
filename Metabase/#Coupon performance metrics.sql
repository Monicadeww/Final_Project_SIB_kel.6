#Coupon performance metrics
SELECT
    c.id AS coupon_id,
    c.discount_percent,
    SUM(CASE WHEN oi.coupon_id = c.id THEN (oi.amount * p.price) - ((oi.amount * p.price) * c.discount_percent/100) ELSE oi.amount * p.price END) AS total_revenue_with_coupons,
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