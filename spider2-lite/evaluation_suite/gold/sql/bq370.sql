WITH CustomerOrderData AS (
    SELECT OrderID,
           InvoiceID,
           CustomerID,
           COUNT(CustomerOrderCost) AS TotalNbOrders,
           SUM(CustomerOrderCost) AS OrdersTotalValue,
           COUNT(CustomerOrderInvoice) AS TotalNbInvoices,
           SUM(CustomerOrderInvoice) AS InvoicesTotalValue
    FROM (
           SELECT Orders.*,
                  Invoices.CustomerOrderInvoice
           FROM (
                  SELECT o.OrderID,
                         Inv.InvoiceID,
                         ol.StockItemID,
                         cu.CustomerID,
                         ol.Quantity * ol.UnitPrice AS CustomerOrderCost
                  FROM `spider2-public-data.wide_world_importers.sales_Customers` cu
                  INNER JOIN `spider2-public-data.wide_world_importers.sales_Orders` o 
                          ON cu.CustomerID = o.CustomerID
                  INNER JOIN `spider2-public-data.wide_world_importers.sales_OrderLines` ol 
                          ON o.OrderID = ol.OrderID
                  INNER JOIN `spider2-public-data.wide_world_importers.sales_Invoices` Inv 
                          ON ol.OrderID = Inv.OrderID
                ) Orders
           INNER JOIN (
                  SELECT Inv.OrderID,
                         Invl.InvoiceID,
                         Invl.StockItemID,
                         Quantity * UnitPrice AS CustomerOrderInvoice
                  FROM `spider2-public-data.wide_world_importers.sales_InvoiceLines` Invl
                  INNER JOIN `spider2-public-data.wide_world_importers.sales_Invoices` Inv 
                          ON Invl.InvoiceID = Inv.InvoiceID
                ) Invoices 
           ON Orders.OrderID = Invoices.OrderID 
           AND Orders.InvoiceID = Invoices.InvoiceID 
           AND Orders.StockItemID = Invoices.StockItemID
         ) A
    GROUP BY OrderID,
             InvoiceID,
             CustomerID
),
CustomerSummary AS (
    SELECT CustomerID,
           COUNT(TotalNbOrders) AS TotalNbOrders,
           COUNT(TotalNbInvoices) AS TotalNbInvoices,
           SUM(OrdersTotalValue) AS OrdersTotalValue,
           SUM(InvoicesTotalValue) AS InvoicesTotalValue,
           (SUM(OrdersTotalValue) - SUM(InvoicesTotalValue)) AS AbsoluteValueDifference
    FROM CustomerOrderData
    GROUP BY CustomerID
)
SELECT COUNT(*) AS NumberOfCustomersWithNoDifference
FROM CustomerSummary
WHERE TotalNbOrders = TotalNbInvoices
  AND OrdersTotalValue = InvoicesTotalValue;