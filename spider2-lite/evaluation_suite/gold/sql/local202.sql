WITH alien_aggression AS (
    SELECT
        state,
        SUM(CASE WHEN aggressive = 1 THEN 1 ELSE 0 END) AS n_hostile_aliens,
        SUM(CASE WHEN aggressive = 0 THEN 1 ELSE 0 END) AS n_friendly_aliens
    FROM alien_data
    GROUP BY state
),
alien_stats AS (
    SELECT
        alien_data.state,
        COUNT(*) AS alien_population_total,
        ROUND(AVG(age)) AS avg_alien_age,
        alien_aggression.n_friendly_aliens,
        alien_aggression.n_hostile_aliens
    FROM alien_data
    JOIN alien_aggression ON alien_data.state = alien_aggression.state
    GROUP BY alien_data.state, alien_aggression.n_friendly_aliens, alien_aggression.n_hostile_aliens
),
top_states AS (
    SELECT state
    FROM alien_stats
    ORDER BY alien_population_total DESC
    LIMIT 10
)
SELECT
    COUNT(*) AS number_of_states
FROM
    alien_stats
WHERE
    state IN (SELECT state FROM top_states)
    AND ROUND((CAST(n_friendly_aliens AS REAL) / CAST(alien_population_total AS REAL)) * 100, 2) >
    ROUND((CAST(n_hostile_aliens AS REAL) / CAST(alien_population_total AS REAL)) * 100, 2)
    AND avg_alien_age > 200;