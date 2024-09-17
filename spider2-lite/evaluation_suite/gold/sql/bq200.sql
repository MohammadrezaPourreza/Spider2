SELECT 
    _pitcher
FROM (
    -- #rank of the player by his speed (ignoring ties)
    SELECT _team
        ,_pitcher
        ,_speed
        ,row_number() OVER (
            PARTITION BY _team ORDER BY _speed DESC
            ) _rnk
    FROM (
        -- #finalizing the table with player-team link
        SELECT _team
            ,_pitcher
            ,max(_speed) _speed
        FROM (
            -- #glueing tables with players and teams
            SELECT _pitcher
                ,coalesce(_home_team, _away_team) _team
                ,_speed
            FROM (
                -- #setting up the table with players
                SELECT venueId
                    ,pitcherId
                    ,pitcherFirstName || '  ' || pitcherLastName _pitcher
                    ,max(pitchSpeed) _speed
                FROM (
                    -- #full table comprising all seasons
                    SELECT venueId
                        ,pitcherId
                        ,pitcherFirstName
                        ,pitcherLastName
                        ,pitchSpeed
                    FROM `bigquery-public-data.baseball.games_wide`
                    
                    UNION ALL
                    
                    SELECT venueId
                        ,pitcherId
                        ,pitcherFirstName
                        ,pitcherLastName
                        ,pitchSpeed
                    FROM `bigquery-public-data.baseball.games_post_wide`
                    ) _all
                WHERE pitchSpeed != 0
                GROUP BY venueId
                    ,pitcherId
                    ,pitcherFirstName || '  ' || pitcherLastName
                ) _grp
            -- #joining table with player-team links
            LEFT JOIN (
                SELECT pitcherId
                    ,venueId
                    -- we need to check here if the pitcher is in the list of the homing team
                    ,CASE 
                        WHEN pitcherId IN unnest(
                                                [homeFielder1		
                                                ,homeFielder2			
                                                ,homeFielder3			
                                                ,homeFielder4			
                                                ,homeFielder5			
                                                ,homeFielder6			
                                                ,homeFielder7			
                                                ,homeFielder8			
                                                ,homeFielder9			
                                                ,homeFielder10			
                                                ,homeFielder11			
                                                ,homeFielder12			
                                                ,homeBatter1			
                                                ,homeBatter2			
                                                ,homeBatter3			
                                                ,homeBatter4			
                                                ,homeBatter5			
                                                ,homeBatter6			
                                                ,homeBatter7			
                                                ,homeBatter8			
                                                ,homeBatter9]
                            )
                            THEN homeTeamName
                        ELSE NULL
                        END _home_team
                    -- we need to check here if the pitcher is in the list of the guest team
                    ,CASE 
                        WHEN pitcherId IN unnest(
                                                [awayFielder1		
                                                ,awayFielder2		
                                                ,awayFielder3		
                                                ,awayFielder4		
                                                ,awayFielder5		
                                                ,awayFielder6		
                                                ,awayFielder7		
                                                ,awayFielder8		
                                                ,awayFielder9		
                                                ,awayFielder10		
                                                ,awayFielder11		
                                                ,awayFielder12		
                                                ,awayBatter1		
                                                ,awayBatter2		
                                                ,awayBatter3		
                                                ,awayBatter4		
                                                ,awayBatter5		
                                                ,awayBatter6		
                                                ,awayBatter7		
                                                ,awayBatter8		
                                                ,awayBatter9]
                            )
                            THEN awayTeamName
                        ELSE NULL
                        END _away_team
                FROM (
                    SELECT *
                    FROM `bigquery-public-data.baseball.games_wide`
                    
                    UNION ALL
                    
                    SELECT *
                    FROM `bigquery-public-data.baseball.games_post_wide`
                    ) t
                ) _team ON _team.pitcherId = _grp.pitcherId
                AND _team.venueId = _grp.venueId
            ) _total
        GROUP BY _team
            ,_pitcher
        ) _filter
    WHERE 1 = 1
        AND _team IS NOT NULL
        AND _pitcher IS NOT NULL
        AND _pitcher != ''
        AND _speed != 0
    ) _rank
WHERE 1 = 1
    AND _rnk = 1
ORDER BY _speed DESC