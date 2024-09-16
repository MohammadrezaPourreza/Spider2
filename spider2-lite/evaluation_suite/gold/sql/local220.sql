WITH match_view AS (
    SELECT M.id,
           L.name AS league,
           M.season,
           M.match_api_id,
           T.team_long_name AS home_team,
           TM.team_long_name AS away_team,
           M.home_team_goal,
           M.away_team_goal,
           P1.player_name AS home_gk,
           P2.player_name AS home_center_back_1,
           P3.player_name AS home_center_back_2,
           P4.player_name AS home_right_back,
           P5.player_name AS home_left_back,
           P6.player_name AS home_midfield_1,
           P7.player_name AS home_midfield_2,
           P8.player_name AS home_midfield_3,
           P9.player_name AS home_midfield_4,
           P10.player_name AS home_second_forward,
           P11.player_name AS home_center_forward,
           P12.player_name AS away_gk,
           P13.player_name AS away_center_back_1,
           P14.player_name AS away_center_back_2,
           P15.player_name AS away_right_back,
           P16.player_name AS away_left_back,
           P17.player_name AS away_midfield_1,
           P18.player_name AS away_midfield_2,
           P19.player_name AS away_midfield_3,
           P20.player_name AS away_midfield_4,
           P21.player_name AS away_second_forward,
           P22.player_name AS away_center_forward,
           M.goal,
           M.card
      FROM match M
           LEFT JOIN
           league L ON M.league_id = L.id
           LEFT JOIN
           team T ON M.home_team_api_id = T.team_api_id
           LEFT JOIN
           team TM ON M.away_team_api_id = TM.team_api_id
           LEFT JOIN
           player P1 ON M.home_player_1 = P1.player_api_id
           LEFT JOIN
           player P2 ON M.home_player_2 = P2.player_api_id
           LEFT JOIN
           player P3 ON M.home_player_3 = P3.player_api_id
           LEFT JOIN
           player P4 ON M.home_player_4 = P4.player_api_id
           LEFT JOIN
           player P5 ON M.home_player_5 = P5.player_api_id
           LEFT JOIN
           player P6 ON M.home_player_6 = P6.player_api_id
           LEFT JOIN
           player P7 ON M.home_player_7 = P7.player_api_id
           LEFT JOIN
           player P8 ON M.home_player_8 = P8.player_api_id
           LEFT JOIN
           player P9 ON M.home_player_9 = P9.player_api_id
           LEFT JOIN
           player P10 ON M.home_player_10 = P10.player_api_id
           LEFT JOIN
           player P11 ON M.home_player_11 = P11.player_api_id
           LEFT JOIN
           player P12 ON M.away_player_1 = P12.player_api_id
           LEFT JOIN
           player P13 ON M.away_player_2 = P13.player_api_id
           LEFT JOIN
           player P14 ON M.away_player_3 = P14.player_api_id
           LEFT JOIN
           player P15 ON M.away_player_4 = P15.player_api_id
           LEFT JOIN
           player P16 ON M.away_player_5 = P16.player_api_id
           LEFT JOIN
           player P17 ON M.away_player_6 = P17.player_api_id
           LEFT JOIN
           player P18 ON M.away_player_7 = P18.player_api_id
           LEFT JOIN
           player P19 ON M.away_player_8 = P19.player_api_id
           LEFT JOIN
           player P20 ON M.away_player_9 = P20.player_api_id
           LEFT JOIN
           player P21 ON M.away_player_10 = P21.player_api_id
           LEFT JOIN
           player P22 ON M.away_player_11 = P22.player_api_id
),
players AS (
    SELECT home_gk AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_center_back_1 AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_center_back_2 AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_right_back AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_left_back AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_midfield_1 AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_midfield_2 AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_midfield_3 AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_midfield_4 AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_second_forward AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT home_center_forward AS player 
    FROM match_view 
    WHERE home_team_goal > away_team_goal
    
    UNION ALL
    
    SELECT away_gk AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_center_back_1 AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_center_back_2 AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_right_back AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_left_back AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_midfield_1 AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_midfield_2 AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_midfield_3 AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_midfield_4 AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_second_forward AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
    
    UNION ALL
    
    SELECT away_center_forward AS player 
    FROM match_view 
    WHERE away_team_goal > home_team_goal
)

-- Now, select from the CTE and create a temporary result
SELECT
    player
FROM
    players
GROUP BY
    player
HAVING
    player IS NOT NULL
ORDER BY
    COUNT(*) DESC
LIMIT 1;