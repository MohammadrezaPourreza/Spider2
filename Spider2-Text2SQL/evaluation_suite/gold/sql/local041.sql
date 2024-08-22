WITH Borough_Health_Tree_Counts AS (
    SELECT
        t.health,
        COUNT(*) AS tree_count
    FROM trees t
    WHERE t.boroname = 'Bronx' AND t.health IS NOT NULL AND t.health != ''
    GROUP BY t.health
),
Borough_Health_Total_Trees AS (
    SELECT
        COUNT(*) AS total_trees
    FROM trees t
    WHERE t.boroname = 'Bronx'
)

SELECT
    ROUND(
        (
            SELECT tree_count 
            FROM Borough_Health_Tree_Counts
            WHERE health = 'Good'
        ) * 100.0 / 
        (
            SELECT total_trees 
            FROM Borough_Health_Total_Trees
        ), 2
    ) AS Percentage
;
