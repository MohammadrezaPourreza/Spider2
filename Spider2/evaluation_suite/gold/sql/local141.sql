WITH Sales_CTE AS (
    SELECT 
        SalesPersonID, 
        SUM(TotalDue) AS TotalSales, 
        strftime('%Y', OrderDate) AS SalesYear
    FROM 
        SalesOrderHeader
    WHERE 
        SalesPersonID <> ''
    GROUP BY 
        SalesPersonID, 
        strftime('%Y', OrderDate)
),
Sales_Quota_CTE AS (
    SELECT 
        BusinessEntityID, 
        SUM(SalesQuota) AS SalesQuota, 
        strftime('%Y', QuotaDate) AS SalesQuotaYear
    FROM 
        SalesPersonQuotaHistory
    GROUP BY 
        BusinessEntityID, 
        strftime('%Y', QuotaDate)
)
SELECT 
    Sales_CTE.SalesPersonID,
    Sales_CTE.SalesYear,
    CAST(Sales_CTE.TotalSales AS TEXT) AS TotalSales,
    Sales_Quota_CTE.SalesQuotaYear,
    CAST(Sales_Quota_CTE.SalesQuota AS TEXT) AS SalesQuota,
    CAST(Sales_CTE.TotalSales - Sales_Quota_CTE.SalesQuota AS TEXT) AS Amt_Above_or_Below_Quota
FROM 
    Sales_CTE
JOIN 
    Sales_Quota_CTE 
    ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID
    AND Sales_CTE.SalesYear = Sales_Quota_CTE.SalesQuotaYear
ORDER BY 
    Sales_CTE.SalesPersonID, 
    Sales_CTE.SalesYear;
