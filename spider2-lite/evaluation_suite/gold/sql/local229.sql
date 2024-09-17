WITH ball_extend AS (
    SELECT 
        b.*,
        CASE 
            WHEN b.striker < b.non_striker THEN b.striker 
            ELSE b.non_striker 
        END AS u1,
        CASE 
            WHEN b.striker > b.non_striker THEN b.striker 
            ELSE b.non_striker 
        END AS u2
    FROM 
        ball_by_ball b
),
match_part AS (
    SELECT 
        be.match_id, 
        be.u1, 
        be.u2, 
        SUM(bs.runs_scored) AS runs,
        RANK() OVER(PARTITION BY be.match_id ORDER BY SUM(bs.runs_scored) DESC) AS prank
    FROM 
        ball_extend be
    JOIN 
        batsman_scored bs ON be.match_id = bs.match_id 
        AND be.over_id = bs.over_id 
        AND be.ball_id = bs.ball_id 
        AND be.innings_no = bs.innings_no
    GROUP BY 
        be.match_id, be.u1, be.u2
    ORDER BY 
        be.match_id, SUM(bs.runs_scored) DESC
),
match_part2 AS (
    SELECT 
        b.match_id, 
        mp.u1, 
        mp.u2, 
        mp.runs, 
        mp.prank,
        SUM(bs.runs_scored) AS u1_runs,
        (mp.runs - SUM(bs.runs_scored)) AS u2_runs
    FROM 
        match_part mp
    JOIN 
        ball_by_ball b ON mp.match_id = b.match_id 
    JOIN 
        batsman_scored bs ON b.match_id = bs.match_id 
        AND b.over_id = bs.over_id 
        AND b.ball_id = bs.ball_id 
        AND b.innings_no = bs.innings_no
    WHERE 
        mp.u1 = b.striker 
        AND mp.u2 = b.non_striker
    GROUP BY 
        b.match_id, mp.u1, mp.u2, mp.runs, mp.prank
),
match_part3 AS (
    SELECT 
        match_id,
        CASE 
            WHEN u1_runs > u2_runs THEN u1 
            WHEN u1_runs = u2_runs THEN (CASE WHEN u1 > u2 THEN u1 ELSE u2 END)
            ELSE u2 
        END AS player1_id,
        CASE 
            WHEN u1_runs < u2_runs THEN u1 
            WHEN u1_runs = u2_runs THEN (CASE WHEN u1 > u2 THEN u2 ELSE u1 END)
            ELSE u2 
        END AS player2_id,
        CASE 
            WHEN u1_runs >= u2_runs THEN u1_runs 
            ELSE u2_runs 
        END AS runs1,
        CASE 
            WHEN u1_runs <= u2_runs THEN u1_runs 
            ELSE u2_runs 
        END AS runs2,
        runs, prank
    FROM 
        match_part2
)
SELECT 
    match_id, 
    player1_id, 
    player2_id, 
    runs1, 
    runs2, 
    runs AS pship_runs 
FROM 
    match_part3
WHERE 
    prank <= 1
ORDER BY 
    pship_runs DESC, match_id ASC;
