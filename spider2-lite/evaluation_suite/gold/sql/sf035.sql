WITH session_joins AS (
    SELECT
        ss.app_group_id,
        ss.time AS ss_time,
        ss.user_id
    FROM
        BRAZE_USER_EVENT_DEMO_DATASET.PUBLIC.users_behaviors_app_sessionstart_view ss
        JOIN BRAZE_USER_EVENT_DEMO_DATASET.PUBLIC.users_behaviors_app_firstsession_view fs
        ON ss.user_id = fs.user_id
        AND ss.app_group_id = fs.app_group_id
    WHERE
        ss.time >= DATEDIFF(s, '1970-01-01', '2023-06-01') AND
        ss.time < DATEDIFF(s, '1970-01-01', '2023-06-08')
)
SELECT
    app_group_id,
    DATE_TRUNC('day', DATEADD(s, ss_time, '1970-01-01')) AS session_start_day,
    COUNT(
        DISTINCT user_id
    ) AS count_distinct_users
FROM
    session_joins
GROUP BY
    1, 2
ORDER BY
    session_start_day;