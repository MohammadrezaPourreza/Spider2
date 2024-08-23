WITH EntertainerStrengths AS (
    SELECT Entertainers.EntertainerID,
           Entertainers.EntStageName,
           MAX(RankedStrengths.FirstStyle) AS FirstStyle,
           MAX(RankedStrengths.SecondStyle) AS SecondStyle,
           MAX(RankedStrengths.ThirdStyle) AS ThirdStyle
    FROM Entertainers
    LEFT JOIN (
        SELECT Entertainer_Styles.EntertainerID,
               CASE WHEN Entertainer_Styles.StyleStrength = 1 THEN Entertainer_Styles.StyleID ELSE NULL END AS FirstStyle,
               CASE WHEN Entertainer_Styles.StyleStrength = 2 THEN Entertainer_Styles.StyleID ELSE NULL END AS SecondStyle,
               CASE WHEN Entertainer_Styles.StyleStrength = 3 THEN Entertainer_Styles.StyleID ELSE NULL END AS ThirdStyle
        FROM Entertainer_Styles
    ) AS RankedStrengths ON Entertainers.EntertainerID = RankedStrengths.EntertainerID
    GROUP BY Entertainers.EntertainerID, Entertainers.EntStageName
),
CustomerPreferences AS (
    SELECT Customers.CustomerID,
           Customers.CustFirstName,
           Customers.CustLastName,
           MAX(RankedPreferences.FirstStyle) AS FirstStyle,
           MAX(RankedPreferences.SecondStyle) AS SecondStyle,
           MAX(RankedPreferences.ThirdStyle) AS ThirdStyle
    FROM Customers
    LEFT JOIN (
        SELECT Musical_Preferences.CustomerID,
               CASE WHEN Musical_Preferences.PreferenceSeq = 1 THEN Musical_Preferences.StyleID ELSE NULL END AS FirstStyle,
               CASE WHEN Musical_Preferences.PreferenceSeq = 2 THEN Musical_Preferences.StyleID ELSE NULL END AS SecondStyle,
               CASE WHEN Musical_Preferences.PreferenceSeq = 3 THEN Musical_Preferences.StyleID ELSE NULL END AS ThirdStyle
        FROM Musical_Preferences
    ) AS RankedPreferences ON Customers.CustomerID = RankedPreferences.CustomerID
    GROUP BY Customers.CustomerID, Customers.CustFirstName, Customers.CustLastName
)
SELECT COUNT(ES.EntertainerID)
FROM EntertainerStrengths AS ES
JOIN CustomerPreferences AS CS ON ES.FirstStyle = CS.FirstStyle AND ES.SecondStyle = CS.SecondStyle
