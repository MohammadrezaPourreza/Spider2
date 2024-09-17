WITH late_orders AS (
    SELECT
        employeeid,
        COUNT(employeeid) AS total
    FROM
        orders
    WHERE
        requireddate <= shippeddate --late
    GROUP BY
        employeeid
), 
orders_summary AS (
    SELECT
        employeeid,
        COUNT(employeeid) AS total
    FROM
        orders
    GROUP BY
        employeeid
)
SELECT
    os.employeeid
FROM
    orders_summary os
INNER JOIN
    employees e ON os.employeeid = e.employeeid
LEFT JOIN
    late_orders lo ON os.employeeid = lo.employeeid
ORDER BY
    COALESCE(CAST(lo.total AS REAL) / os.total, 0) DESC
LIMIT 1;