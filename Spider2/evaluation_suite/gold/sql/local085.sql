WITH late_orders AS (
  SELECT
    o.employeeid,
    COUNT(o.employeeid) AS total
  FROM
    orders o
  WHERE
    o.requireddate <= o.shippeddate
  GROUP BY
    o.employeeid
), 
orders_summary AS (
   SELECT
    o.employeeid,
    COUNT(o.employeeid) AS total
  FROM
    orders o
  GROUP BY
    o.employeeid
)
SELECT
  os.employeeid
FROM
  orders_summary os
LEFT JOIN
  late_orders lo 
  ON os.employeeid = lo.employeeid
ORDER BY
  ABS(os.total - COALESCE(lo.total, 0)) DESC
LIMIT 1;