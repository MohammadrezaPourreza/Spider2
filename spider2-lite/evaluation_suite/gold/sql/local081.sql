WITH orders_1998 AS (
    SELECT
        o.customerid,
        COALESCE(SUM(od.unitprice * od.quantity), 0) AS total
    FROM
        orders o
    INNER JOIN
        order_details od ON o.orderid = od.orderid
    WHERE
        CAST(STRFTIME('%Y', o.orderdate) AS INTEGER) = 1998
    GROUP BY
        o.customerid
), customer_groups AS (
    SELECT
        cgt.groupname AS `group`
    FROM
        orders_1998 o
    INNER JOIN
        customergroupthreshold cgt ON o.total BETWEEN cgt.rangebottom AND cgt.rangetop
), groups_count AS (
    SELECT
        cg.`group`,
        COUNT(cg.`group`) AS group_total
    FROM
        customer_groups cg
    GROUP BY
        cg.`group`
)
SELECT
    gc.`group`,
    gc.group_total AS total_customer,
    ROUND((100.0 * gc.group_total / (SELECT SUM(group_total) FROM groups_count)), 2) || '%' AS percentage
FROM
    groups_count gc
ORDER BY
    gc.group_total DESC;
