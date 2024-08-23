WITH numbered_reviews AS (
  SELECT 
    o.customer_id,
    o.order_id,
    r.review_id,
    r.review_score,
    (SELECT COUNT(*) 
     FROM olist_order_reviews r2 
     WHERE r2.order_id = o.order_id AND r2.review_id <= r.review_id) AS review_rank
  FROM olist_orders o
  JOIN olist_order_reviews r ON o.order_id = r.order_id
  WHERE o.order_delivered_customer_date BETWEEN '2018-01-01' AND '2018-01-31'
)
SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN review_score = 5 AND review_rank = 1 THEN 1 ELSE 0 END) /
    SUM(CASE WHEN review_score < 6 THEN 1 ELSE 0 END),
    2
  ) AS Percentage
FROM numbered_reviews
