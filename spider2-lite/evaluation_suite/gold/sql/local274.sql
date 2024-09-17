WITH olines AS (
    SELECT
        ol.order_id AS o_id,
        ol.product_id AS p_id,
        ol.qty,
        IFNULL((
            SELECT SUM(ol2.qty)
            FROM orderlines ol2
            WHERE ol2.product_id = ol.product_id
              AND ol2.order_id < ol.order_id
        ), 0) + 1 AS from_q,
        IFNULL((
            SELECT SUM(ol2.qty)
            FROM orderlines ol2
            WHERE ol2.product_id = ol.product_id
              AND ol2.order_id < ol.order_id
        ), 0) + ol.qty AS to_q
    FROM orderlines ol
    WHERE ol.order_id = 421
), orderbatch AS (
    SELECT
        ol.p_id,
        SUM(ol.qty) AS qty
    FROM olines ol
    GROUP BY ol.p_id
), fifo AS (
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
            IFNULL((
                SELECT SUM(i2.qty)
                FROM inventory_with_dims i2
                WHERE i2.product_id = i.product_id
                  AND (i2.purchased < i.purchased OR (i2.purchased = i.purchased AND i2.qty < i.qty))
            ), 0) AS acc_prv_q,
            i.purchased,
            i.warehouse AS wh,
            i.aisle AS ai,
            i.position AS pos
        FROM orderbatch ob
        JOIN inventory_with_dims i
          ON i.product_id = ob.p_id
    ) sub
    WHERE acc_prv_q < ord_q
), pick AS (
    SELECT
        f.wh, f.ai,
        DENSE_RANK() OVER (
            ORDER BY wh, ai
        ) AS ai_rank,
        f.pos, f.p_id,
        f.pick_q, o.o_id,
        MIN(
            f.loc_q,
            MIN(o.to_q, f.to_q) - MAX(o.from_q, f.from_q) + 1
        ) AS q_f_o
    FROM fifo f
    JOIN olines o
      ON o.p_id = f.p_id
     AND o.to_q >= f.from_q
     AND o.from_q <= f.to_q
)
SELECT
    pr.name AS product_name,
    AVG(p.pick_q) AS avg_units_picked
FROM pick p
JOIN products pr ON pr.id = p.p_id
GROUP BY p.p_id, pr.name
ORDER BY p.p_id;