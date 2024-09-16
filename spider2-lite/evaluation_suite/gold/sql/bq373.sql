WITH MonthlyAverageSpending AS (
    SELECT 
        AVG(Jan + Feb + Mar + Apr + May + Jun + Jul + Aug + Sep + Oct + Nov + Dec) AS AvgMonthlySpending
    FROM (
        SELECT 
            CustomerName,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Jan' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Jan,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Feb' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Feb,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Mar' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Mar,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Apr' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Apr,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'May' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS May,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Jun' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Jun,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Jul' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Jul,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Aug' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Aug,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Sep' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Sep,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Oct' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Oct,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Nov' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Nov,
            IFNULL(SUM(CASE WHEN MonthInvoiceDate = 'Dec' THEN InvoicesTotalValue ELSE 0.00 END), 0.00) AS Dec
        FROM (
            SELECT 
                cu.CustomerName,
                COALESCE(invl.UnitPrice * invl.Quantity, 0) AS InvoicesTotalValue,
                FORMAT_DATE('%b', DATE(inv.InvoiceDate)) AS MonthInvoiceDate
            FROM 
                `spider2-public-data.wide_world_importers.sales_InvoiceLines` invl
            INNER JOIN 
                `spider2-public-data.wide_world_importers.sales_Invoices` inv
                ON invl.InvoiceID = inv.InvoiceID
            INNER JOIN 
                `spider2-public-data.wide_world_importers.sales_Customers` cu
                ON cu.CustomerID = inv.CustomerID
            WHERE 
                EXTRACT(YEAR FROM CAST(INV.invoicedate AS TIMESTAMP)) = 2014
        ) AS SourceTable
        GROUP BY 
            CustomerName
    ) AS MonthlySpend
    GROUP BY 
        CustomerName
),
MedianSpending AS (
    SELECT 
        PERCENTILE_CONT(AvgMonthlySpending, 0.5) OVER() AS MedianOfAvgMonthlySpending
    FROM 
        MonthlyAverageSpending
)
-- Final output of the median spending
SELECT DISTINCT MedianOfAvgMonthlySpending
FROM MedianSpending;