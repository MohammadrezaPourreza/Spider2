WITH Counts AS (
    SELECT
        System,
        License,
        COUNT(DISTINCT Name) AS NPackages
    FROM
        `spider2-public-data.deps_dev_v1.PackageVersions`
    CROSS JOIN
        UNNEST(Licenses) AS License
    GROUP BY
        System,
        License
),
Ranked AS (
    SELECT
        System,
        License,
        NPackages,
        ROW_NUMBER() OVER (PARTITION BY System ORDER BY NPackages DESC) AS LicenseRank
    FROM Counts
)
SELECT
    System,
    License
FROM
    Ranked
WHERE
    LicenseRank <= 1
ORDER BY
    System,
    LicenseRank;