WITH pre_covid AS (
    SELECT state_abbreviation,
           COUNT(*) AS pre_covid_count
    FROM FINANCE__ECONOMICS.CYBERSYN.financial_branch_entities
    WHERE start_date <= '2020-03-01'
      AND (end_date >= '2020-03-01' OR end_date IS NULL)
    GROUP BY state_abbreviation
)
SELECT cur.state_abbreviation,
       pre_covid_count,
       COUNT(*) AS current_count,
       (current_count / CAST(pre_covid_count AS FLOAT)) - 1 AS pct_change
FROM FINANCE__ECONOMICS.CYBERSYN.financial_branch_entities AS cur
INNER JOIN pre_covid ON (cur.state_abbreviation = pre_covid.state_abbreviation)
WHERE (end_date IS NULL OR end_date >= '2021-12-31')
GROUP BY cur.state_abbreviation, pre_covid_count
ORDER BY pct_change DESC;
