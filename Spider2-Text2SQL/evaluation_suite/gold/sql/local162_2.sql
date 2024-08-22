WITH AvgSalaries AS (
    SELECT 
        facrank AS FacRank,
        AVG(facsalary) AS AvSalary
    FROM 
        faculty
    GROUP BY 
        facrank
),
SalaryDifferences AS (
    SELECT 
        faculty.facrank AS FacRank, 
        faculty.facfirstname AS FacFirstName, 
        faculty.faclastname AS FacLastName, 
        faculty.facsalary AS Salary, 
        ABS(faculty.facsalary - AvgSalaries.AvSalary) AS Diff
    FROM 
        faculty
    JOIN 
        AvgSalaries ON faculty.facrank = AvgSalaries.FacRank
),
MinDifferences AS (
    SELECT 
        FacRank, 
        MIN(Diff) AS MinDiff
    FROM 
        SalaryDifferences
    GROUP BY 
        FacRank
)
SELECT 
    s.FacRank, 
    s.FacFirstName, 
    s.FacLastName, 
    s.Salary
FROM 
    SalaryDifferences s
JOIN 
    MinDifferences m ON s.FacRank = m.FacRank AND s.Diff = m.MinDiff;
