WITH bottom_five_cities AS (
    SELECT 
        c.customer_city,
        SUM(p.payment_value) AS Total_Payment_By_Customers,
        COUNT(o.order_id) AS Total_Number_Of_Orders
    FROM olist_customers c
    JOIN olist_orders o ON c.customer_id = o.customer_id
    JOIN olist_order_payments p ON o.order_id = p.order_id
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_city
    ORDER BY Total_Payment_By_Customers ASC
    LIMIT 5
)
SELECT 
    AVG(Total_Payment_By_Customers) AS Average_Total_Payment,
    AVG(Total_Number_Of_Orders) AS Average_Total_Orders
FROM bottom_five_cities;