#standardsql
SELECT
  IFNULL(a.upper_latin, b.upper_latin) as upper_latin,
  IFNULL(count_2015, 0) as count_2015,
  IFNULL(count_1995, 0) as count_1995,
  (IFNULL(count_2015, 0)-IFNULL(count_1995, 0)) AS count_growth,
  (IFNULL(alive_2015, 0)-IFNULL(alive_1995, 0)) as alive_growth,
  (IFNULL(dead_2015, 0)-IFNULL(dead_1995, 0)) as dead_growth
FROM (
  SELECT
    UPPER(spc_latin) AS upper_latin,
    spc_common,
    COUNT(*) AS count_2015,
    COUNTIF(status="Alive") AS alive_2015,
    COUNTIF(status="Dead") AS dead_2015
  FROM
    `bigquery-public-data.new_york.tree_census_2015`
  WHERE spc_latin != ""
  GROUP BY
    spc_latin,
    spc_common)a
FULL OUTER JOIN (
  SELECT
    UPPER(spc_latin) AS upper_latin,
    COUNT(*) AS count_1995,
    COUNTIF(status!="Dead") AS alive_1995,
    COUNTIF(status="Dead") AS dead_1995
  FROM
    `bigquery-public-data.new_york.tree_census_1995`
  GROUP BY
    spc_latin)b
ON
  a.upper_latin=b.upper_latin
ORDER BY
  count_growth DESC
LIMIT 10