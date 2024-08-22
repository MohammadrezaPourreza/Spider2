WITH cte_dollar_cost_average AS (
  SELECT
    strftime('%Y', substr(transactions.txn_date, 7, 4) || '-' || substr(transactions.txn_date, 4, 2) || '-' || substr(transactions.txn_date, 1, 2)) AS year_start,
    members.region,
    SUM(transactions.quantity * prices.price) / SUM(transactions.quantity) AS btc_dca
  FROM transactions
  INNER JOIN prices
    ON transactions.ticker = prices.ticker
    AND transactions.txn_date = prices.market_date
  INNER JOIN members
    ON transactions.member_id = members.member_id
  WHERE transactions.ticker = 'BTC'
    AND transactions.txn_type = 'BUY'
  GROUP BY year_start, members.region
),

cte_window_functions AS (
  SELECT
    year_start,
    region,
    btc_dca,
    (SELECT COUNT(*) 
     FROM cte_dollar_cost_average AS sub
     WHERE sub.year_start = cte_dollar_cost_average.year_start 
       AND sub.btc_dca <= cte_dollar_cost_average.btc_dca) AS dca_ranking,
    (SELECT btc_dca 
     FROM cte_dollar_cost_average AS sub
     WHERE sub.region = cte_dollar_cost_average.region 
       AND sub.year_start < cte_dollar_cost_average.year_start
     ORDER BY sub.year_start DESC
     LIMIT 1) AS previous_btc_dca
  FROM cte_dollar_cost_average
)

SELECT
  year_start,
  region,
  ROUND(btc_dca, 2) AS btc_dca,
  dca_ranking,
  ROUND(
    100.0 * (btc_dca - previous_btc_dca) / previous_btc_dca,
    2
  ) AS dca_percentage_change
FROM cte_window_functions
ORDER BY region, year_start;
