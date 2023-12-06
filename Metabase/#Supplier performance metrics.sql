#Supplier performance metrics
SELECT
    s.id AS supplier_id,
    s.name AS supplier_name,
    COUNT(o.id) AS total_orders,
    COUNT(CASE WHEN o.status = 'returned' THEN o.id END) AS returned_orders,
    COALESCE(COUNT(CASE WHEN o.status = 'returned' THEN o.id END) * 1.0 / NULLIF(COUNT(o.id), 0), 0) AS return_rate
FROM
    suppliers s
LEFT JOIN
    products p ON s.id = p.supplier_id
LEFT JOIN
    order_items oi ON p.id = oi.product_id
LEFT JOIN
    orders o ON oi.order_id = o.id
GROUP BY
    s.id, s.name
ORDER BY
    return_rate DESC;
