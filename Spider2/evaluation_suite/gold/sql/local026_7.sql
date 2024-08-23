WITH runs_scored AS (
    SELECT 
        bb.striker AS player_id,
        SUM(bs.runs_scored) AS runs
    FROM 
        ball_by_ball AS bb
    JOIN 
        batsman_scored AS bs ON bb.match_id = bs.match_id 
            AND bb.over_id = bs.over_id 
            AND bb.ball_id = bs.ball_id 
            AND bb.innings_no = bs.innings_no
    WHERE 
        bb.match_id IN (SELECT match_id FROM match WHERE season_id = 4)
    GROUP BY 
        bb.striker
),
batting_averages AS (
    SELECT 
        player_id, 
        SUM(runs) AS total_runs, 
        COUNT(*) AS num_matches,
        ROUND(SUM(runs) / CAST(COUNT(*) AS FLOAT), 3) AS batting_avg
    FROM 
        runs_scored 
    GROUP BY 
        player_id 
    ORDER BY 
        batting_avg DESC 
    LIMIT 1
)
SELECT 
    p.player_name
FROM 
    player AS p
JOIN 
    batting_averages AS b ON p.player_id = b.player_id;