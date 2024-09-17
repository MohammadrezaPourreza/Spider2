WITH RECURSIVE mths AS (
    SELECT
        date('2016-01-01') AS mth,
        1 AS ts
    UNION ALL
    SELECT
        date(mth, '+1 month'),
        ts + 1
    FROM mths
    WHERE ts < 48
), s1 AS (
    SELECT
        ms.product_id,
        mths.mth,
        mths.ts,
        strftime('%Y', mths.mth) AS yr,
        strftime('%m', mths.mth) AS mthno,
        COALESCE(ms.qty, 0) AS qty
    FROM mths
    LEFT JOIN monthly_sales ms ON ms.mth = mths.mth AND ms.product_id IN (4160, 7790)
), s2 AS (
    SELECT
        product_id,
        mth,
        ts,
        yr,
        mthno,
        qty,
        CASE
            WHEN ts BETWEEN 7 AND 30 THEN (
                COALESCE(AVG(qty) OVER (
                    PARTITION BY product_id
                    ORDER BY ts
                    ROWS BETWEEN 5 PRECEDING AND 6 FOLLOWING
                ), 0) + COALESCE(AVG(qty) OVER (
                    PARTITION BY product_id
                    ORDER BY ts
                    ROWS BETWEEN 6 PRECEDING AND 5 FOLLOWING
                ), 0)) / 2
            ELSE NULL
        END AS cma
    FROM s1
), s3 AS (
    SELECT
        product_id,
        mth,
        ts,
        yr,
        mthno,
        qty,
        cma,
        COALESCE(AVG(CASE
            WHEN qty = 0 THEN 0.0001
            ELSE qty
        END / NULLIF(cma, 0)) OVER (
            PARTITION BY product_id, mthno
        ), 0) AS s
    FROM s2
), s4 AS (
    SELECT
        product_id,
        mth,
        ts,
        yr,
        mthno,
        qty,
        cma,
        s,
        CASE
            WHEN ts <= 36 THEN COALESCE(CASE
                WHEN qty = 0 THEN 0.0001
                ELSE qty
            END / NULLIF(s, 0), 0)
        END AS des
    FROM s3
), s5 AS (
    SELECT
        product_id,
        mth,
        ts,
        yr,
        mthno,
        qty,
        cma,
        s,
        des,
        (AVG(des * ts) OVER (PARTITION BY product_id) - 
        AVG(des) OVER (PARTITION BY product_id) * AVG(ts) OVER (PARTITION BY product_id)) /
        (AVG(ts * ts) OVER (PARTITION BY product_id) - 
        AVG(ts) OVER (PARTITION BY product_id) * AVG(ts) OVER (PARTITION BY product_id)) AS slope,
        AVG(des) OVER (PARTITION BY product_id) - 
        (AVG(des * ts) OVER (PARTITION BY product_id) - 
        AVG(des) OVER (PARTITION BY product_id) * AVG(ts) OVER (PARTITION BY product_id)) /
        (AVG(ts * ts) OVER (PARTITION BY product_id) - 
        AVG(ts) OVER (PARTITION BY product_id) * AVG(ts) OVER (PARTITION BY product_id)) * AVG(ts) OVER (PARTITION BY product_id) AS intercept
    FROM s4
)
SELECT
    ROUND(AVG((intercept + ts * slope) * s), 2) AS avg_forecasted_annual_sales
FROM s5
WHERE yr = '2018';