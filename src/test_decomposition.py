from src.database_utils.sql_decomposer import create_sub_queries, get_selects_in_preorder

# complex_sql = """
#     WITH
# cohortExpr AS (
#   SELECT
#     "sample_barcode",
#     LOG(10, "normalized_count") AS "expr"
#   FROM
#     "TCGA_HG19_DATA_V0"."TCGA_HG19_DATA_V0"."RNASEQ_GENE_EXPRESSION_UNC_RSEM"
#   WHERE
#     "project_short_name" = 'TCGA-BRCA'
#     AND "HGNC_gene_symbol" = 'TP53'
#     AND "normalized_count" IS NOT NULL
#     AND "normalized_count" > 0
# ),
# cohortVar AS (
#   SELECT
#     "Variant_Type",
#     "sample_barcode_tumor" AS "sample_barcode"
#   FROM
#     "TCGA_HG19_DATA_V0"."TCGA_HG19_DATA_V0"."SOMATIC_MUTATION_MC3"
#   WHERE
#     "SYMBOL" = 'TP53'
# ),
# cohort AS (
#   SELECT
#     e."sample_barcode" AS "sample_barcode",
#     v."Variant_Type" AS "group_name",
#     e."expr"
#   FROM
#     cohortExpr e
#   JOIN
#     cohortVar v
#   ON
#     e."sample_barcode" = v."sample_barcode"
# ),
# grandMeanTable AS (
#   SELECT
#     AVG("expr") AS "grand_mean"
#   FROM
#     cohort
# ),
# groupMeansTable AS (
#   SELECT
#     AVG("expr") AS "group_mean",
#     "group_name",
#     COUNT("sample_barcode") AS "n"
#   FROM
#     cohort
#   GROUP BY
#     "group_name"
# ),
# ssBetween AS (
#   SELECT
#     g."group_name",
#     g."group_mean",
#     gm."grand_mean",
#     g."n",
#     g."n" * POW(g."group_mean" - gm."grand_mean", 2) AS "n_diff_sq"
#   FROM
#     groupMeansTable g
#   CROSS JOIN
#     grandMeanTable gm
# ),
# ssWithin AS (
#   SELECT
#     c."group_name" AS "group_name",
#     c."expr",
#     b."group_mean",
#     b."n" AS "n",
#     POW(c."expr" - b."group_mean", 2) AS "s2"
#   FROM
#     cohort c
#   JOIN
#     ssBetween b
#   ON
#     c."group_name" = b."group_name"
# ),
# numerator AS (
#   SELECT
#     SUM("n_diff_sq") / (COUNT("group_name") - 1) AS "mean_sq_between"
#   FROM
#     ssBetween
# ),
# denominator AS (
#   SELECT
#     COUNT(DISTINCT "group_name") AS "k",
#     COUNT("group_name") AS "n",
#     SUM("s2") / (COUNT("group_name") - COUNT(DISTINCT "group_name")) AS "mean_sq_within"
#   FROM
#     ssWithin
# )

# SELECT
#   "n",
#   "k",
#   "mean_sq_between",
#   "mean_sq_within",
#   "mean_sq_between" / "mean_sq_within" AS "F"
# FROM
#   numerator,
#   denominator;
#     """

complex_sql = """
WITH HighestReleases AS (
        SELECT
            HR."Name",
            HR."Version"
        FROM (
            SELECT
                "Name",
                "Version",
                ROW_NUMBER() OVER (
                    PARTITION BY "Name"
                    ORDER BY TO_NUMBER(PARSE_JSON("VersionInfo"):"Ordinal") DESC
                ) AS RowNumber
            FROM
                DEPS_DEV_V1.DEPS_DEV_V1.PACKAGEVERSIONS
            WHERE
                "System" = 'NPM'
                AND TO_BOOLEAN(PARSE_JSON("VersionInfo"):"IsRelease") = TRUE
        ) AS HR
        WHERE HR.RowNumber = 1
    ),
    PVP AS (
        SELECT
            PVP."Name",
            PVP."Version",
            PVP."ProjectType",
            PVP."ProjectName"
        FROM
            DEPS_DEV_V1.DEPS_DEV_V1.PACKAGEVERSIONTOPROJECT AS PVP
        JOIN
            HighestReleases AS HR
        ON
            PVP."Name" = HR."Name"
            AND PVP."Version" = HR."Version"
        WHERE
            PVP."System" = 'NPM'
            AND PVP."ProjectType" = 'GITHUB'
    )
    SELECT DISTINCT
        PVP."Name",
        PVP."Version"
    FROM
        PVP
    JOIN
        DEPS_DEV_V1.DEPS_DEV_V1.PROJECTS AS P
    ON
        PVP."ProjectType" = P."Type"
        AND PVP."ProjectName" = P."Name"
    ORDER BY
        P."StarsCount" DESC
    LIMIT 8
    OFFSET 2
"""

sub_queries = [sql_dict for sql_dict in create_sub_queries(complex_sql)]
for sql_dict in sub_queries:
    # print(f"ID: {sql_dict['id']}, Alias: {sql_dict['alias']}")
    # print(sql_dict['sql_query'])
    for key, value in sql_dict.items():
        print(f"{key}: {value}")
    print("=====================================")

# import sqlglot

# selects = list(get_selects_in_preorder(sqlglot.parse_one(complex_sql, read="snowflake")))
# for select in selects:
#     print(select.sql())
#     print("=====================================")
