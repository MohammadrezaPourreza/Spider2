WITH EntertainerStrengths AS (
    SELECT e.EntertainerID,
           e.EntStageName,
           MAX(CASE WHEN es.StyleStrength = 1 THEN es.StyleID END) AS FirstStyle,
           MAX(CASE WHEN es.StyleStrength = 2 THEN es.StyleID END) AS SecondStyle,
           MAX(CASE WHEN es.StyleStrength = 3 THEN es.StyleID END) AS ThirdStyle
    FROM Entertainers e
    LEFT JOIN Entertainer_Styles es ON e.EntertainerID = es.EntertainerID
    GROUP BY e.EntertainerID, e.EntStageName
),
CustomerPreferences AS (
    SELECT c.CustomerID,
           c.CustLastName,
           MAX(CASE WHEN mp.PreferenceSeq = 1 THEN mp.StyleID END) AS FirstStyle,
           MAX(CASE WHEN mp.PreferenceSeq = 2 THEN mp.StyleID END) AS SecondStyle,
           MAX(CASE WHEN mp.PreferenceSeq = 3 THEN mp.StyleID END) AS ThirdStyle
    FROM Customers c
    LEFT JOIN Musical_Preferences mp ON c.CustomerID = mp.CustomerID
    GROUP BY c.CustomerID, c.CustLastName
)
SELECT e.EntStageName AS StageName,
       c.CustLastName AS LastName
FROM EntertainerStrengths e
JOIN CustomerPreferences c ON e.FirstStyle = c.FirstStyle AND e.SecondStyle = c.SecondStyle
UNION
SELECT e.EntStageName,
       c.CustLastName 
FROM EntertainerStrengths e
JOIN CustomerPreferences c ON e.FirstStyle = c.SecondStyle AND e.SecondStyle = c.FirstStyle
ORDER BY e.EntStageName, c.CustLastName;