WITH
-- List of users who installed in Sept
sept_cohort AS (
    SELECT DISTINCT 
        user_pseudo_id,
        FORMAT_DATE('%Y-%m-%d', PARSE_DATE('%Y%m%d', event_date)) AS date_first_open
    FROM 
        `firebase-public-project.analytics_153293282.events_*`
    WHERE 
        event_name = 'first_open'
        AND _TABLE_SUFFIX BETWEEN '20180901' AND '20180930'
),
-- Get the list of users who uninstalled
uninstallers AS (
    SELECT DISTINCT 
        user_pseudo_id,
        FORMAT_DATE('%Y-%m-%d', PARSE_DATE('%Y%m%d', event_date)) AS date_app_remove
    FROM 
        `firebase-public-project.analytics_153293282.events_*`
    WHERE 
        event_name = 'app_remove'
        AND _TABLE_SUFFIX BETWEEN '20180901' AND '20181007'
),
-- Get the list of users who experienced crashes
users_crashes AS (
    SELECT DISTINCT 
        user_pseudo_id,
        FORMAT_DATE('%Y-%m-%d', PARSE_DATE('%Y%m%d', event_date)) AS date_crash
    FROM 
        `firebase-public-project.analytics_153293282.events_*`,
        UNNEST(event_params) e
    WHERE 
        event_name = 'app_exception'
        AND _TABLE_SUFFIX BETWEEN '20180901' AND '20181007'
),
-- Join the 3 tables
joined AS (
    SELECT 
        a.user_pseudo_id,
        a.date_first_open,
        b.date_app_remove,
        DATE_DIFF(DATE(b.date_app_remove), DATE(a.date_first_open), DAY) AS days_to_uninstall,
        c.date_crash
    FROM 
        sept_cohort a
    LEFT JOIN 
        uninstallers b ON a.user_pseudo_id = b.user_pseudo_id
    LEFT JOIN 
        users_crashes c ON a.user_pseudo_id = c.user_pseudo_id
)
-- Compute the percentage
SELECT
    COUNT(DISTINCT CASE WHEN days_to_uninstall <= 7 AND date_crash IS NOT NULL THEN user_pseudo_id END) / 
    COUNT(DISTINCT CASE WHEN days_to_uninstall <= 7 THEN user_pseudo_id END) AS percent_users_crashes
FROM 
    joined;