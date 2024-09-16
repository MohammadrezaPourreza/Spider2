WITH top_industry AS
(
    SELECT i.industry
    FROM industries AS i
    INNER JOIN dates AS d
        ON i.company_id = d.company_id
    WHERE strftime('%Y', d.date_joined) IN ('2019', '2020', '2021')
    GROUP BY i.industry
    ORDER BY COUNT(*) DESC
    LIMIT 1
),

average_valuation_2021 AS 
(
    SELECT AVG(f.valuation) AS average_valuation
    FROM industries AS i
    INNER JOIN dates AS d
        ON i.company_id = d.company_id
    INNER JOIN funding AS f
        ON d.company_id = f.company_id
    WHERE strftime('%Y', d.date_joined) = '2021'
      AND i.industry = (SELECT industry FROM top_industry)
)

SELECT ROUND(average_valuation / 1000000000, 2) AS average_valuation_billions
FROM average_valuation_2021;