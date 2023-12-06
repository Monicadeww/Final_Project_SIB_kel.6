#Measure the conversion rate of orders with and without coupons
SELECT
    COUNT(DISTINCT CASE WHEN oi.coupon_id IS NOT NULL THEN oi.order_id END) AS orders_with_coupons,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(DISTINCT CASE WHEN oi.coupon_id IS NOT NULL THEN oi.order_id END) * 1.0 / COUNT(DISTINCT oi.order_id) AS conversion_rate
FROM
    order_items oi;