CREATE OR REPLACE VIEW ecommerce_bi.gold.fact_transactions_denorm AS (
SELECT i.*,
c.year,
c.month_name,
c.day_name,
c.isWeekend,
c.quarter,
c.week,
p.sku, 
p.category_code,
p.category_name,
p.brand_code,
p.brand_name,
p.color,
p.size,
p.rating_count,
extract(HOUR FROM transaction_ts) as hour_of_day
FROM ecommerce_bi.gold.gld_fact_order_items i JOIN ecommerce_bi.gold.gld_date c ON i.date_id = c.date_id
JOIN ecommerce_bi.gold.gld_products p ON i.product_id = p.product_id
);