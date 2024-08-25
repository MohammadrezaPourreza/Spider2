DECLARE
    Sys STRING DEFAULT 'NPM';

WITH HighestReleases AS (
    SELECT
        Name,
        Version
    FROM (
        SELECT
            Name,
            Version,
            ROW_NUMBER() OVER (
                PARTITION BY Name
                ORDER BY VersionInfo.Ordinal DESC
            ) AS RowNumber
        FROM
            `spider2-public-data.deps_dev_v1.PackageVersions`
        WHERE
            System = Sys
            AND VersionInfo.IsRelease
    )
    WHERE RowNumber = 1
),
PVP AS (
    SELECT
        Name, Version, ProjectType, ProjectName
    FROM
        `spider2-public-data.deps_dev_v1.PackageVersionToProject`
    JOIN
        HighestReleases AS HR
    USING (Name, Version)
    WHERE
        System = Sys
        AND ProjectType = 'GITHUB'
)
SELECT PVP.Name, PVP.Version
FROM
    PVP
JOIN
    `spider2-public-data.deps_dev_v1.Projects` AS P
ON
    PVP.ProjectType = P.Type AND PVP.ProjectName = P.Name
ORDER BY P.StarsCount DESC LIMIT 3;