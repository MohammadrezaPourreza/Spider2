WITH ScoreCounts AS (
  SELECT 
    Musical_Styles.StyleName,
    (COUNT(RankedPreferences.FirstStyle) * 3 + 
     COUNT(RankedPreferences.SecondStyle) * 2 + 
     COUNT(RankedPreferences.ThirdStyle) * 1) AS WeightedScore
  FROM 
    Musical_Styles
  LEFT JOIN 
    (SELECT 
       (CASE WHEN Musical_Preferences.PreferenceSeq = 1 
            THEN Musical_Preferences.StyleID END) AS FirstStyle,
       (CASE WHEN Musical_Preferences.PreferenceSeq = 2 
            THEN Musical_Preferences.StyleID END) AS SecondStyle,
       (CASE WHEN Musical_Preferences.PreferenceSeq = 3 
            THEN Musical_Preferences.StyleID END) AS ThirdStyle
     FROM 
       Musical_Preferences) AS RankedPreferences
  ON 
    Musical_Styles.StyleID = RankedPreferences.FirstStyle
    OR Musical_Styles.StyleID = RankedPreferences.SecondStyle
    OR Musical_Styles.StyleID = RankedPreferences.ThirdStyle
  GROUP BY 
    Musical_Styles.StyleID, Musical_Styles.StyleName
  HAVING 
    COUNT(RankedPreferences.FirstStyle) > 0 
    OR COUNT(RankedPreferences.SecondStyle) > 0 
    OR COUNT(RankedPreferences.ThirdStyle) > 0
),
RankedScores AS (
  SELECT 
    WeightedScore,
    ROW_NUMBER() OVER (ORDER BY WeightedScore) AS RowAsc,
    COUNT(*) OVER () AS TotalCount
  FROM 
    ScoreCounts
)
SELECT 
  AVG(WeightedScore) AS MedianScore
FROM 
  RankedScores
WHERE 
  RowAsc IN (FLOOR((TotalCount + 1) / 2), CEIL((TotalCount + 1) / 2));