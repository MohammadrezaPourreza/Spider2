WITH 
    SHAHRUKH_0 AS (
        SELECT 
            TRIM(P.PID) AS PID
        FROM 
            Person P
        WHERE 
            TRIM(P.Name) LIKE '%Shahrukh%'
    ),
    SHAHRUKH_1_MOVIES AS (
        SELECT 
            DISTINCT TRIM(MC.MID) AS MID, 
            S0.PID
        FROM 
            M_Cast MC
        JOIN 
            SHAHRUKH_0 S0 ON TRIM(MC.PID) = S0.PID
    ),
    SHAHRUKH_1_ACTORS AS (
        SELECT 
            DISTINCT TRIM(MC.PID) AS PID
        FROM 
            M_Cast MC
        JOIN 
            SHAHRUKH_1_MOVIES S1M ON TRIM(MC.MID) = S1M.MID
        WHERE 
            TRIM(MC.PID) <> S1M.PID
    ),
    SHAHRUKH_2_MOVIES AS (
        SELECT 
            DISTINCT TRIM(MC.MID) AS MID, 
            S1A.PID
        FROM 
            M_Cast MC
        JOIN 
            SHAHRUKH_1_ACTORS S1A ON TRIM(MC.PID) = S1A.PID
    )
SELECT 
    COUNT(DISTINCT TRIM(MC.PID)) AS 'Number of actor'
FROM 
    Person P
JOIN 
    M_Cast MC ON TRIM(MC.PID) = TRIM(P.PID)
JOIN 
    SHAHRUKH_2_MOVIES S2M ON TRIM(MC.MID) = S2M.MID
WHERE 
    TRIM(MC.PID) <> S2M.PID;
