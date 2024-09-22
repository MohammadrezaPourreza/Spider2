SELECT
  b.state_name,
  MAX(b.confirmed_cases - a.confirmed_cases) AS daily_confirmed_cases
FROM 
  (SELECT
    state_name AS state,
    state_fips_code,
    confirmed_cases,
    DATE_ADD(date, INTERVAL 1 DAY) AS date_shift
  FROM
    `bigquery-public-data.covid19_nyt.us_states`
  WHERE
    confirmed_cases + deaths > 0
  ) a
JOIN
  `bigquery-public-data.covid19_nyt.us_states` b 
    ON a.state_fips_code = b.state_fips_code 
    AND a.date_shift = b.date
WHERE
  b.date = '2023-03-23'
GROUP BY
  b.state_name, b.date
ORDER BY 
  daily_confirmed_cases DESC
LIMIT 3;
