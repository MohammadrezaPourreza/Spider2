WITH RECURSIVE mb_recur AS (
   -- Initial data selection
   SELECT
      it.product_id,
      date('2018-12-01') AS mth,
      0 AS qty,
      0 AS inv_begin,
      NULL AS date_purch,
      0 AS p_qty,
      it.qty AS inv_end,
      pm.qty_minimum,
      pm.qty_purchase
   FROM inventory_totals it
   JOIN product_minimums pm ON pm.product_id = it.product_id

   UNION ALL

   -- Recursive step
   SELECT
      mb.product_id,
      date(mb.mth, '+1 month') AS mth,
      CASE
         WHEN mbr.inv_end - COALESCE(mb.qty, 0) > 0 THEN mbr.inv_end - COALESCE(mb.qty, 0)
         ELSE 0
      END AS qty,
      mbr.inv_end AS inv_begin,
      CASE
         WHEN mbr.inv_end - COALESCE(mb.qty, 0) < mbr.qty_minimum THEN
            date(mbr.mth, '+' || CAST(((strftime('%s', date(mb.mth, '+1 month')) - strftime('%s', mbr.mth)) * (mbr.inv_end - mbr.qty_minimum)) / mb.qty AS INTEGER) || ' month')
      END AS date_purch,
      CASE
         WHEN mbr.inv_end - COALESCE(mb.qty, 0) < mbr.qty_minimum THEN mbr.qty_purchase
      END AS p_qty,
      mbr.inv_end - COALESCE(mb.qty, 0) + CASE
         WHEN mbr.inv_end - COALESCE(mb.qty, 0) < mbr.qty_minimum THEN mbr.qty_purchase
         ELSE 0
      END AS inv_end,
      mbr.qty_minimum,
      mbr.qty_purchase
   FROM mb_recur mbr
   JOIN monthly_budget mb ON mb.product_id = mbr.product_id AND mb.mth = date(mbr.mth, '+1 month')
   LEFT JOIN monthly_orders mo ON mo.product_id = mb.product_id AND mo.mth = mb.mth
),
inventory_diff AS (
   SELECT
      m.product_id,
      m.mth,
      ABS(m.inv_end - m.qty_minimum) AS diff
   FROM mb_recur m
   WHERE m.mth >= date('2019-01-01')
     AND m.mth < date('2020-01-01')
),
min_diff AS (
   SELECT
      product_id,
      MIN(diff) AS min_diff
   FROM inventory_diff
   GROUP BY product_id
)
SELECT
   d.product_id,
   d.mth AS date,
   d.diff
FROM inventory_diff d
JOIN min_diff md ON d.product_id = md.product_id AND d.diff = md.min_diff
ORDER BY d.product_id, d.mth;