WITH consolidated_runs AS (
    SELECT
        match_id,
        over_id,
        innings_no,
        runs_scored AS runs
    FROM
        batsman_scored
    UNION ALL
    SELECT
        match_id,
        over_id,
        innings_no,
        extra_runs AS runs
    FROM
        extra_runs
),
summarized_runs AS (
    SELECT
        match_id,
        innings_no,
        over_id,
        SUM(runs) AS total_runs
    FROM
        consolidated_runs
    GROUP BY
        match_id, innings_no, over_id
),
max_runs_per_match AS (
    SELECT
        match_id,
        MAX(total_runs) AS max_runs
    FROM
        summarized_runs
    GROUP BY
        match_id
),
over_details AS (
    SELECT
        sr.match_id,
        sr.innings_no,
        sr.over_id,
        sr.total_runs,
        bb.bowler
    FROM
        summarized_runs sr
    JOIN
        max_runs_per_match mr ON sr.match_id = mr.match_id AND sr.total_runs = mr.max_runs
    JOIN
        ball_by_ball bb ON sr.match_id = bb.match_id AND sr.innings_no = bb.innings_no AND sr.over_id = bb.over_id
    GROUP BY
        sr.match_id, sr.innings_no, sr.over_id, sr.total_runs, bb.bowler
),
final_result AS (
    SELECT
        od.match_id,
        od.total_runs AS maximum_runs,
        p.player_name
    FROM
        over_details od
    JOIN
        player p ON od.bowler = p.player_id
    ORDER BY
        od.match_id,
        od.over_id,
        p.player_name
)
SELECT
    AVG(maximum_runs) AS average_maximum_runs
FROM
    final_result;
