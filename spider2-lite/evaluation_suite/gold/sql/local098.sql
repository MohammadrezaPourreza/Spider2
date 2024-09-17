WITH
    NUM_OF_MOV_FOR_AN_ACTR_BY_YR AS (
        SELECT
            TRIM(MC.PID) AS PID,
            CAST(SUBSTR(year, -4) AS UNSIGNED) AS YEAR,
            COUNT(DISTINCT TRIM(M.MID)) AS NUM_OF_MOV
        FROM
            M_Cast MC
            JOIN Movie M ON TRIM(MC.MID) = TRIM(M.MID)
        GROUP BY
            TRIM(MC.PID),
            CAST(SUBSTR(year, -4) AS UNSIGNED)
        ORDER BY
            NUM_OF_MOV DESC
    ),
    ACTRS_FOR_MORE_THAN_ONE_YR AS (
        SELECT
            PID,
            COUNT(YEAR) AS NUM_OF_YEARS,
            MIN(YEAR) AS MIN_YEAR,
            MAX(YEAR) AS MAX_YEAR
        FROM
            NUM_OF_MOV_FOR_AN_ACTR_BY_YR
        GROUP BY
            PID
    ),
    NUM_OF_FOR_ACTR_W_MRE_THN_1_YR AS (
        SELECT
            NM.PID,
            NM.YEAR,
            NM.YEAR + 4 AS YEAR_PLUS_4,
            NM.NUM_OF_MOV,
            AY.MIN_YEAR,
            AY.MAX_YEAR
        FROM
            NUM_OF_MOV_FOR_AN_ACTR_BY_YR NM
            JOIN ACTRS_FOR_MORE_THAN_ONE_YR AY ON NM.PID = AY.PID
    ),
    NUM_OF_MOV_TILL_DATE_BY_ACTOR AS (
        SELECT
            NA.PID,
            NY.YEAR,
            SUM(NA.NUM_OF_MOV) AS NUM_OF_MOV_TILL_THAT_YEAR
        FROM
            NUM_OF_FOR_ACTR_W_MRE_THN_1_YR NA
            JOIN NUM_OF_FOR_ACTR_W_MRE_THN_1_YR NY ON NA.PID = NY.PID
        WHERE
            NA.YEAR BETWEEN NY.MIN_YEAR AND NY.YEAR
        GROUP BY
            NA.PID,
            NY.YEAR
    ),
    NUM_OF_MV_BY_ACTR_BY_YR_PLS_4 AS (
        SELECT
            NA.PID,
            NY.YEAR,
            SUM(NA.NUM_OF_MOV) AS NUM_OF_MOV_TILL_AS_OF_YR_PLS_4
        FROM
            NUM_OF_FOR_ACTR_W_MRE_THN_1_YR NA
            JOIN NUM_OF_FOR_ACTR_W_MRE_THN_1_YR NY ON NA.PID = NY.PID
        WHERE
            NA.YEAR BETWEEN NY.MIN_YEAR AND NY.YEAR_PLUS_4
            AND NY.YEAR_PLUS_4 <= NY.MAX_YEAR
        GROUP BY
            NA.PID,
            NY.YEAR
    )
SELECT
    COUNT(DISTINCT TRIM(P.Name)) AS NUM_OF_ACTORS_NEVER_UNEMPLOYED_FOR_MORE_THAN_3_YRS
FROM
    Person P
WHERE
    TRIM(P.PID) NOT IN (
        SELECT DISTINCT
            NMT.PID
        FROM
            NUM_OF_MOV_TILL_DATE_BY_ACTOR NMT
            JOIN NUM_OF_MV_BY_ACTR_BY_YR_PLS_4 NMP ON NMT.PID = NMP.PID AND NMT.YEAR = NMP.YEAR
        WHERE
            NMT.NUM_OF_MOV_TILL_THAT_YEAR = NMP.NUM_OF_MOV_TILL_AS_OF_YR_PLS_4
    );
