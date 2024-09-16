WITH DailySalesPerCategory AS (
    SELECT
        DATE(order_purchase_timestamp) AS date,
        -- Days since 2017-01-01
        CAST(JULIANDAY(order_purchase_timestamp) - JULIANDAY('2017-01-01') AS INTEGER) AS day,
        product_category_name_english AS category,
        SUM(price) AS sales
    FROM
        orders
        JOIN order_items USING (order_id)
        JOIN products USING (product_id)
        JOIN product_category_name_translation USING (product_category_name)
    WHERE
        order_purchase_timestamp BETWEEN '2017-01-01' AND '2018-08-29'
        AND category = 'toys'
    GROUP BY
        day,
        product_category_name_english
),
LmPerCategory AS (
    SELECT
        category,
        -- Slope
        (COUNT(*) * SUM(day * sales) - SUM(day) * SUM(sales)) / 
            (COUNT(*) * SUM(day * day) - SUM(day) * SUM(day))
            AS slope,
        -- Intercept
        (SUM(sales) -
            ((COUNT(*) * SUM(day * sales) - SUM(day) * SUM(sales)) / 
            (COUNT(*) * SUM(day * day) - SUM(day) * SUM(day))) *
            SUM(day)) / COUNT(*)
            AS intercept
    FROM
        DailySalesPerCategory
    GROUP BY
        category
),
ForecastedSales AS (
    SELECT
        DATE(date, '+1 year') AS date,
        category,
        -- Increase in predicted sales * sales 1 year ago
        (intercept + slope * (day + CAST(JULIANDAY('2018-12-31') - JULIANDAY('2017-12-31') AS INTEGER)))
            / (intercept + slope * day) * sales
            AS forecasted_sales
    FROM DailySalesPerCategory
        JOIN LmPerCategory USING (category)
    -- Filter for days of December 2018
    WHERE day + CAST(JULIANDAY('2018-12-31') - JULIANDAY('2017-12-31') AS INTEGER)
        BETWEEN CAST(JULIANDAY('2018-12-01') - JULIANDAY('2017-01-01') AS INTEGER)
        AND CAST(JULIANDAY('2018-12-31') - JULIANDAY('2017-01-01') AS INTEGER)
),
AVGForecastedSales AS (
  SELECT
    -- 5-day moving average
    AVG(forecasted_sales)
      OVER (PARTITION BY category ORDER BY date ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS moving_avg_sales,
    date
  FROM ForecastedSales
  WHERE date IN ('2018-12-05', '2018-12-06', '2018-12-07')
)

SELECT SUM(moving_avg_sales) AS total_sales
FROM AVGForecastedSales
