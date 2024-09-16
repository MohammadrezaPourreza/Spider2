WITH MaxLossPerCategory AS (
    -- Calculate the maximum loss for each category
    SELECT 
           CustomerCategoryName,
           MAX(OrderValueLost) AS MaxLoss
    FROM (
        SELECT 
               cc.CustomerCategoryName,
               SUM(ol.Quantity * ol.UnitPrice) AS OrderValueLost
        FROM 
               `spider2-public-data.wide_world_importers.sales_Customers` cu
        INNER JOIN `spider2-public-data.wide_world_importers.sales_Orders` o
            ON cu.CustomerID = o.CustomerID
        INNER JOIN `spider2-public-data.wide_world_importers.sales_CustomerCategories` cc
            ON cu.CustomerCategoryID = cc.CustomerCategoryID
        INNER JOIN `spider2-public-data.wide_world_importers.sales_OrderLines` ol
            ON o.OrderID = ol.OrderID
        WHERE o.OrderID NOT IN (
            SELECT 
                 I.OrderID
            FROM 
                 `spider2-public-data.wide_world_importers.sales_Invoices` I
        )
        GROUP BY cc.CustomerCategoryName, cu.CustomerID
    ) A
    GROUP BY A.CustomerCategoryName
),
AvgMaxLoss AS (
    -- Calculate the average of the maximum losses across all categories
    SELECT 
         AVG(MaxLoss) AS AvgLoss
    FROM 
         MaxLossPerCategory
),
ClosestToAvg AS (
    -- Find the category with the maximum loss closest to the average
    SELECT 
           ml.CustomerCategoryName,
           ABS(ml.MaxLoss - al.AvgLoss) AS DiffFromAvg
    FROM 
           MaxLossPerCategory ml
    CROSS JOIN AvgMaxLoss al
    ORDER BY DiffFromAvg ASC
    LIMIT 1
)
-- Final selection of the category name
SELECT 
     CustomerCategoryName
FROM 
     ClosestToAvg;