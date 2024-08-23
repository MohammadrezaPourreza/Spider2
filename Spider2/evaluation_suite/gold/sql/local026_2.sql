WITH derived AS (
    SELECT 
        bbb.match_id, 
        bbb.over_id, 
        bbb.ball_id, 
        bbb.innings_no, 
        bbb.striker, 
        bs.runs_scored AS runs 
    FROM 
        ball_by_ball bbb
    JOIN 
        batsman_scored bs
    ON 
        bbb.match_id = bs.match_id 
        AND bbb.over_id = bs.over_id 
        AND bbb.ball_id = bs.ball_id 
        AND bbb.innings_no = bs.innings_no
),
fifty_plus_scorers AS (
    SELECT 
        striker AS player_id 
    FROM 
        derived 
    GROUP BY 
        match_id, striker 
    HAVING 
        SUM(runs) > 50
),
total_runs AS (
    SELECT 
        striker AS player_id, 
        SUM(runs) AS total_runs 
    FROM 
        derived 
    GROUP BY 
        striker
),
qualified_scorers AS (
    SELECT 
        tr.player_id, 
        tr.total_runs 
    FROM 
        total_runs tr
    JOIN 
        fifty_plus_scorers fps
    ON 
        tr.player_id = fps.player_id
)
SELECT 
    AVG(total_runs) AS average_runs 
FROM 
    qualified_scorers;