WITH QualifiedBowlers AS (
    SELECT 
        BowlerID
    FROM 
        Bowler_Scores bs
    JOIN 
        Tourney_Matches tm ON bs.MatchID = tm.MatchID
    JOIN 
        Tournaments t ON tm.TourneyID = t.TourneyID
    WHERE 
        bs.HandiCapScore <= 190
        AND bs.WonGame = 1
        AND t.TourneyLocation IN ('Thunderbird Lanes', 'Totem Lanes', 'Bolero Lanes')
    GROUP BY 
        BowlerID
    HAVING 
        COUNT(DISTINCT t.TourneyLocation) = 3
)
SELECT 
    Bowlers.BowlerID, 
    Bowlers.BowlerFirstName, 
    Bowlers.BowlerLastName, 
    Bowler_Scores.MatchID,
    Bowler_Scores.GameNumber,
    Bowler_Scores.HandiCapScore,
    Tournaments.TourneyDate,
    Tournaments.TourneyLocation
FROM 
    Bowlers
JOIN 
    Bowler_Scores ON Bowlers.BowlerID = Bowler_Scores.BowlerID
JOIN 
    Tourney_Matches ON Bowler_Scores.MatchID = Tourney_Matches.MatchID
JOIN 
    Tournaments ON Tournaments.TourneyID = Tourney_Matches.TourneyID
JOIN 
    QualifiedBowlers qb ON Bowlers.BowlerID = qb.BowlerID
WHERE 
    Bowler_Scores.HandiCapScore <= 190
    AND Bowler_Scores.WonGame = 1
    AND Tournaments.TourneyLocation IN ('Thunderbird Lanes', 'Totem Lanes', 'Bolero Lanes');
