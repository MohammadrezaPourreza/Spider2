WITH RECURSIVE recursive_pr AS (
   SELECT
      pr.packaging_id AS root_id,
      pr.packaging_id,
      pr.contains_id,
      pr.qty,
      1 AS lvl
   FROM packaging_relations pr
   WHERE pr.packaging_id NOT IN (
      SELECT contains_id FROM packaging_relations
   )
   UNION ALL
   SELECT
      rpr.root_id,
      pr.packaging_id,
      pr.contains_id,
      rpr.qty * pr.qty AS qty,
      rpr.lvl + 1 AS lvl
   FROM recursive_pr rpr
   JOIN packaging_relations pr ON pr.packaging_id = rpr.contains_id
),
leaf AS (
   SELECT
      root_id,
      contains_id,
      SUM(qty) AS qty
   FROM (
      SELECT
         rpr.*,
         CASE
            WHEN COALESCE(LEAD(rpr.lvl) OVER (ORDER BY rpr.contains_id), 0) > rpr.lvl
            THEN 0
            ELSE 1
         END AS is_leaf
      FROM recursive_pr rpr
   )
   WHERE is_leaf = 1
   GROUP BY root_id, contains_id
)
SELECT
   p.name AS p_name,
   c.name AS c_name
FROM leaf
JOIN packaging p ON p.id = leaf.root_id
JOIN packaging c ON c.id = leaf.contains_id
WHERE leaf.qty > 500
ORDER BY p.id, c.id;