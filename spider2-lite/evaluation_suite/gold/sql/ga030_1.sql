WITH dates AS (
    SELECT 
        DATE('2018-07-09') AS start_date,
        DATE('2018-10-02') AS end_date,
        DATE_ADD(DATE_TRUNC(DATE('2018-10-02'), WEEK(MONDAY)), INTERVAL -2 WEEK) AS min_date
),

date_table AS (
    SELECT DISTINCT 
        PARSE_DATE('%Y%m%d', `event_date`) AS event_date,
        user_pseudo_id,
        CASE 
            WHEN DATE_DIFF(PARSE_DATE('%Y%m%d', `event_date`), DATE(TIMESTAMP_MICROS(user_first_touch_timestamp)), DAY) = 0 
            THEN 1 
            ELSE 0 
        END AS is_new_user
    FROM `firebase-public-project.analytics_153293282.events_*` 
    WHERE event_name = 'session_start'
    AND PARSE_DATE('%Y%m%d', `event_date`) >= DATE('2018-07-09')
),

new_user_list AS (
    SELECT DISTINCT 
        user_pseudo_id,
        event_date
    FROM date_table
    WHERE is_new_user = 1
),

days_since_start_table AS (
    SELECT DISTINCT 
        is_new_user,
        nu.event_date AS date_cohort,
        dt.user_pseudo_id,
        dt.event_date,
        DATE_DIFF(dt.event_date, nu.event_date, DAY) AS days_since_start
    FROM date_table dt
    JOIN new_user_list nu ON dt.user_pseudo_id = nu.user_pseudo_id
),

weeks_retention AS (
    SELECT 
        date_cohort,
        DATE_TRUNC(date_cohort, WEEK(MONDAY)) AS week_cohort,
        user_pseudo_id,
        days_since_start,
        CASE 
            WHEN days_since_start = 0 THEN 0 
            ELSE CEIL(days_since_start / 7) 
        END AS weeks_since_start
    FROM days_since_start_table
),

retention_counts AS (
    SELECT 
        week_cohort,
        weeks_since_start,
        COUNT(DISTINCT user_pseudo_id) AS retained_users
    FROM weeks_retention
    WHERE week_cohort >= DATE('2018-07-09') AND week_cohort <= (SELECT min_date FROM dates) 
    GROUP BY 
        week_cohort,
        weeks_since_start
)

SELECT 
    initial.week_cohort,
    IFNULL(four_week.retained_users / initial.retained_users, 0) AS retention_rate
FROM 
    retention_counts AS initial
LEFT JOIN 
    retention_counts AS four_week ON initial.week_cohort = four_week.week_cohort AND four_week.weeks_since_start = 2
WHERE 
    initial.weeks_since_start = 0
ORDER BY
week_cohort