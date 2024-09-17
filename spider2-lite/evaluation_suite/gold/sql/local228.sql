WITH season_bat AS (
    SELECT 
        m.season_id AS season_year, 
        p.player_id, 
        SUM(bs.runs_scored) AS runs, 
        ROW_NUMBER() OVER (PARTITION BY m.season_id ORDER BY SUM(bs.runs_scored) DESC, p.player_id ASC) AS runs_row
    FROM 
        match m
    JOIN 
        ball_by_ball b ON m.match_id = b.match_id
    JOIN 
        batsman_scored bs ON b.match_id = bs.match_id 
        AND b.over_id = bs.over_id 
        AND b.ball_id = bs.ball_id 
        AND b.innings_no = bs.innings_no
    JOIN 
        player p ON p.player_id = b.striker
    GROUP BY 
        m.season_id, p.player_id
),
season_bowl AS (
    SELECT 
        m.season_id AS season_year, 
        p.player_id, 
        COUNT(wt.player_out) AS wickets,
        ROW_NUMBER() OVER (PARTITION BY m.season_id ORDER BY COUNT(wt.player_out) DESC, p.player_id ASC) AS wickets_row
    FROM 
        match m
    JOIN 
        ball_by_ball b ON m.match_id = b.match_id
    JOIN 
        wicket_taken wt ON b.match_id = wt.match_id 
        AND b.over_id = wt.over_id 
        AND b.ball_id = wt.ball_id 
        AND b.innings_no = wt.innings_no
    JOIN 
        player p ON p.player_id = b.bowler
    WHERE 
        wt.kind_out NOT IN ('run out', 'hit wicket', 'retired hurt')
    GROUP BY 
        m.season_id, p.player_id
)
SELECT 
    sbat.season_year AS 'season id', 
    sbat.player_id AS batsman, 
    sbat.runs, 
    sbowl.player_id AS bowler, 
    sbowl.wickets
FROM 
    season_bat sbat
JOIN 
    season_bowl sbowl ON sbat.season_year = sbowl.season_year AND sbat.runs_row = sbowl.wickets_row
WHERE 
    sbat.runs_row <= 3 AND sbowl.wickets_row <= 3
ORDER BY 
    sbat.season_year, sbat.runs_row;
