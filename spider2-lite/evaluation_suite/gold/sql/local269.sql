WITH RECURSIVE recursive_pr (root_id, packaging_id, contains_id, qty, lvl) AS (
    SELECT
        pr.packaging_id AS root_id,
        pr.packaging_id,
        pr.contains_id,
        pr.qty,
        1 AS lvl
    FROM packaging_relations pr
    WHERE pr.packaging_id NOT IN (
        SELECT c.contains_id FROM packaging_relations c
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
ranked_recursive_pr AS (
    SELECT
        rpr.*,
        ROW_NUMBER() OVER (PARTITION BY rpr.root_id ORDER BY rpr.lvl) AS rpr_order
    FROM recursive_pr rpr
),
leaf AS (
    SELECT
        rrp.*,
        CASE
            WHEN COALESCE(
                (SELECT MIN(lvl) FROM ranked_recursive_pr WHERE root_id = rrp.root_id AND lvl > rrp.lvl),
                0
            ) > rrp.lvl THEN 0
            ELSE 1
        END AS is_leaf
    FROM ranked_recursive_pr rrp
),
packaging_combination_quantities AS (
    SELECT
        p.id AS packaging_id,
        c.id AS contained_item_id,
        SUM(leaf.qty) AS total_qty
    FROM leaf
    JOIN packaging p ON p.id = leaf.root_id
    JOIN packaging c ON c.id = leaf.contains_id
    WHERE leaf.is_leaf = 1
    GROUP BY p.id, c.id
)
SELECT
    ROUND(AVG(total_qty), 2) AS avg_qty
FROM packaging_combination_quantities;