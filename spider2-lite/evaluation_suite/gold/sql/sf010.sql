SELECT
    ts.date,
    SUM(ts.value) AS pct_near_default
FROM
    US_REAL_ESTATE.CYBERSYN.fhfa_mortgage_performance_timeseries AS ts
    JOIN US_REAL_ESTATE.CYBERSYN.fhfa_mortgage_performance_attributes AS att ON (ts.variable = att.variable)
    JOIN US_REAL_ESTATE.CYBERSYN.geography_index AS geo ON (geo.geo_id = ts.geo_id)
WHERE
    att.variable_group IN (
        'Percent 90 to 180 Days Past Due Date',
        'Percent in Forbearance',
        'Percent in the Process of Foreclosure, Bankruptcy, or Deed in Lieu'
    )
    AND att.market = 'All Mortgages'
    AND geo.geo_name = 'California'
    AND YEAR(ts.date) = 2023
GROUP BY
    ts.date
ORDER BY
    ts.date;