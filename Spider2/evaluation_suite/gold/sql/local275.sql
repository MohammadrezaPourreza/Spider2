WITH RECURSIVE date_series AS (
    SELECT date('2016-01-01') AS mth, 1 AS ts
    UNION ALL
    SELECT date(mth, '+1 month'), ts + 1
    FROM date_series
    WHERE ts < 48
), s1 AS (
    SELECT
        ms.product_id,
        mths.mth,
        mths.ts,
        strftime('%Y', mths.mth) AS yr,
        strftime('%m', mths.mth) AS mthno,
        ms.qty
    FROM date_series mths
    LEFT JOIN (
        SELECT product_id, mth, qty
        FROM monthly_sales
        WHERE product_id IN (4160, 7790)
    ) ms
    ON ms.mth = mths.mth
), s2 AS (
    SELECT
        product_id,
        mth,
        ts,
        yr,
        mthno,
        qty,
        CASE
            WHEN ts BETWEEN 7 AND 30 THEN
                (ifnull(AVG(qty) OVER (
                    PARTITION BY product_id
                    ORDER BY ts
                    ROWS BETWEEN 5 PRECEDING AND 6 FOLLOWING
                ), 0) + ifnull(AVG(qty) OVER (
                    PARTITION BY product_id
                    ORDER BY ts
                    ROWS BETWEEN 6 PRECEDING AND 5 FOLLOWING
                ), 0)) / 2
            ELSE
                NULL
        END AS cma
    FROM s1
), s3 AS (
    SELECT
        s2.product_id,
        s2.mth,
        s2.ts,
        s2.yr,
        s2.mthno,
        s2.qty,
        s2.cma,
        ifnull(AVG(
            CASE WHEN s2.qty = 0 THEN 0.0001 ELSE s2.qty END / NULLIF(s2.cma, 0)
        ) OVER (
            PARTITION BY s2.product_id, s2.mthno
        ), 0) AS s
    FROM s2
)
SELECT DISTINCT
    p.name AS product_name
FROM s3
JOIN products p ON p.id = s3.product_id
WHERE s3.s > 1
    AND strftime('%Y', s3.mth) = '2017'
ORDER BY p.name, s3.mth;