SELECT
  SUM(QuickSummary.revenue) / 1e9 AS revenue_per_state_in_billions
FROM (
  SELECT
    submission_number,
    MAX(value) AS revenue
  FROM `bigquery-public-data.sec_quarterly_financials.quick_summary`
  WHERE
    measure_tag IN ('Revenues', 'SalesRevenueNet',
                    'SalesRevenueGoodsNet')
    AND fiscal_year = 2016
    AND fiscal_period_focus = 'FY'
    AND number_of_quarters = 4
  GROUP BY
    submission_number) QuickSummary
 INNER JOIN (
   SELECT
     submission_number,
     MAX(stprba) AS state
   FROM
     `bigquery-public-data.sec_quarterly_financials.submission`
   WHERE
     stprba IS NOT NULL
     AND stprba != ''
     AND countryba = 'US'
   GROUP BY
     submission_number) Submission
 ON
   QuickSummary.submission_number = Submission.submission_number
GROUP BY
  state
ORDER BY
  revenue_per_state_in_billions DESC
LIMIT 1;