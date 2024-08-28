WITH state_counts AS (
        SELECT 
            DISTINCT state_name,
            COUNT(1) AS count_institutions
        FROM
            `bigquery-public-data.fdic_banks.institutions`
        GROUP BY
            state_name
        ),

        detailed_info AS (
            SELECT
                DISTINCT state_name AS state,
                SUM(total_assets) AS sum_assets,
            FROM
                `bigquery-public-data.fdic_banks.institutions`
            WHERE
                established_date BETWEEN '1900-01-01' AND '2000-12-31'
            AND 
                (institution_name LIKE 'Bank%')
            GROUP BY
                state_name
        )
SELECT
    s.count_institutions AS count_institutions_in_state
FROM
    detailed_info d
JOIN
    state_counts s 
ON 
    d.state = s.state_name
ORDER BY
    d.sum_assets DESC
LIMIT 1;