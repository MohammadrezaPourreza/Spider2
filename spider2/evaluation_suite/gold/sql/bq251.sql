WITH PyPiData AS (
    SELECT
        name AS pypi_name,
        version AS pypi_version,
        home_page,
        download_url,
        project_urls,
        requires,
        upload_time
    FROM
        `spider2-public-data.pypi.distribution_metadata`
),

GitHubURLs AS (
    SELECT
        pypi_name,
        pypi_version,
        REGEXP_REPLACE(REGEXP_EXTRACT(url, r'(https?://github\.com/[^/]+/[^/?#]+)'), r'(/issues.*)|(blob/.*)|(/pull/.*)|(tree/.*)', '') AS github_url,
        upload_time
    FROM
        PyPiData,
        UNNEST(project_urls) AS url
    WHERE
        url LIKE '%github.com%'
        AND (url LIKE '%https://github.com/%' OR url LIKE '%http://github.com/%')
),

MostRecentVersions AS (
    SELECT
        pypi_name,
        pypi_version,
        github_url
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (PARTITION BY pypi_name ORDER BY upload_time DESC) AS rn
        FROM GitHubURLs
    )
    WHERE rn = 1
),

DownloadMetrics AS (
    SELECT
        project,
        COUNT(*) AS pypi_downloads
    FROM
        `spider2-public-data.pypi.file_downloads`
    GROUP BY
        project
)

SELECT
    mv.github_url
FROM
    MostRecentVersions mv
LEFT JOIN
    DownloadMetrics dm ON mv.pypi_name = dm.project
WHERE
    mv.github_url IS NOT NULL 
    AND dm.pypi_downloads IS NOT NULL
ORDER BY dm.pypi_downloads DESC
LIMIT 1;
