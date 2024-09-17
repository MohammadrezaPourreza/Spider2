WITH CustomerQuarterlyData AS (
    SELECT 
           CUS.CustomerName,
           COALESCE(INVL.unitprice * INVL.quantity, 0) AS InvoicesTotalValue,
           CASE
               WHEN EXTRACT(QUARTER FROM CAST(INV.invoicedate AS TIMESTAMP)) = 1 THEN 'Q1'
               WHEN EXTRACT(QUARTER FROM CAST(INV.invoicedate AS TIMESTAMP)) = 2 THEN 'Q2'
               WHEN EXTRACT(QUARTER FROM CAST(INV.invoicedate AS TIMESTAMP)) = 3 THEN 'Q3'
               WHEN EXTRACT(QUARTER FROM CAST(INV.invoicedate AS TIMESTAMP)) = 4 THEN 'Q4'
           END AS QuarterInvoiceDate
    FROM 
         `spider2-public-data.wide_world_importers.sales_InvoiceLines` AS INVL
    INNER JOIN `spider2-public-data.wide_world_importers.sales_Invoices` AS INV
            ON INVL.InvoiceID = INV.InvoiceID
    INNER JOIN `spider2-public-data.wide_world_importers.sales_Customers` AS CUS
            ON CUS.CustomerID = INV.CustomerID
    WHERE EXTRACT(YEAR FROM CAST(INV.invoicedate AS TIMESTAMP)) = 2013
),
QuarterlyAverages AS (
    SELECT 
           QuarterInvoiceDate,
           AVG(InvoicesTotalValue) AS AvgInvoiceValue
    FROM 
         CustomerQuarterlyData
    GROUP BY QuarterInvoiceDate
),
MaxMinAverages AS (
    SELECT 
           MAX(AvgInvoiceValue) AS MaxAvgValue,
           MIN(AvgInvoiceValue) AS MinAvgValue
    FROM 
         QuarterlyAverages
)
SELECT 
     MaxAvgValue - MinAvgValue AS DifferenceBetweenMaxAndMinAvg
FROM MaxMinAverages;