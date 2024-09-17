WITH runs_and_wickets AS (
    SELECT 
        bowler,
        SUM(CASE WHEN wt.match_id IS NOT NULL THEN 1 ELSE 0 END) AS wickets_taken,
        SUM(COALESCE(er.extra_runs, 0) + COALESCE(bs.runs_scored, 0)) AS total_runs_given
    FROM 
        ball_by_ball bb
    LEFT JOIN 
        wicket_taken wt ON bb.match_id = wt.match_id 
            AND bb.over_id = wt.over_id 
            AND bb.ball_id = wt.ball_id 
            AND bb.innings_no = wt.innings_no
    LEFT JOIN 
        extra_runs er ON bb.match_id = er.match_id 
            AND bb.over_id = er.over_id 
            AND bb.ball_id = er.ball_id 
            AND bb.innings_no = er.innings_no
    LEFT JOIN 
        batsman_scored bs ON bb.match_id = bs.match_id 
            AND bb.over_id = bs.over_id 
            AND bb.ball_id = bs.ball_id 
            AND bb.innings_no = bs.innings_no
    GROUP BY 
        bowler
),
bowling_averages AS (
    SELECT 
        bowler AS player_id, 
        ROUND(total_runs_given / NULLIF(wickets_taken, 0), 3) AS bowling_avg,
        ROW_NUMBER() OVER (ORDER BY total_runs_given / NULLIF(wickets_taken, 0)) AS rn
    FROM 
        runs_and_wickets
    WHERE 
        wickets_taken > 0
)
SELECT 
    p.player_name 
FROM 
    player p
JOIN 
    bowling_averages ba ON p.player_id = ba.player_id 
WHERE 
    ba.rn = 1
ORDER BY 
    p.player_name;