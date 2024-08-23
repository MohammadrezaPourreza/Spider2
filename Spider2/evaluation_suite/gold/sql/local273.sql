WITH olines AS (
    SELECT
        ol.order_id AS o_id,
        ol.product_id AS p_id,
        ol.qty,
        COALESCE(SUM(ol.qty) OVER (
            PARTITION BY ol.product_id
            ORDER BY ol.order_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
        ), 0) + 1 AS from_q,
        COALESCE(SUM(ol.qty) OVER (
            PARTITION BY ol.product_id
            ORDER BY ol.order_id
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
        ), 0) + ol.qty AS to_q
    FROM orderlines ol
    WHERE ol.order_id IN (422, 423)
),
orderbatch AS (
    SELECT
        ol.p_id,
        SUM(ol.qty) AS qty
    FROM olines ol
    GROUP BY ol.p_id
),
fifo AS (
    SELECT
        wh, ai, pos, p_id, loc_q,
        MIN(loc_q, ord_q - acc_prv_q) AS pick_q,
        acc_prv_q + 1 AS from_q,
        MIN(acc_prv_q + loc_q, ord_q) AS to_q
    FROM (
        SELECT
            i.product_id AS p_id,
            ob.qty AS ord_q,
            i.qty AS loc_q,
            COALESCE(SUM(i.qty) OVER (
                PARTITION BY i.product_id
                ORDER BY i.purchased, i.qty
                ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
            ), 0) AS acc_prv_q,
            i.purchased,
            i.warehouse AS wh,
            i.aisle AS ai,
            i.position AS pos
        FROM orderbatch ob
        JOIN inventory_with_dims i ON i.product_id = ob.p_id
    )
    WHERE acc_prv_q < ord_q
),
picked_data AS (
    SELECT
        f.wh, f.ai, f.pos, f.p_id,
        f.pick_q, o.o_id,
        MIN(
            f.loc_q,
            MIN(o.to_q, f.to_q) - MAX(o.from_q, f.from_q) + 1
        ) AS q_f_o,
        -- Calculate percentage of quantity picked
        ROUND(
            (MIN(
                f.loc_q,
                MIN(o.to_q, f.to_q) - MAX(o.from_q, f.from_q) + 1
            ) * 100.0 / f.pick_q), 2
        ) AS pick_percentage
    FROM fifo f
    JOIN olines o
        ON o.p_id = f.p_id
        AND o.to_q >= f.from_q
        AND o.from_q <= f.to_q
)
SELECT
    p.name AS product_name,
    AVG(pd.pick_percentage) AS avg_pick_percentage
FROM picked_data pd
JOIN products p ON p.id = pd.p_id
GROUP BY p.name
ORDER BY p.name;