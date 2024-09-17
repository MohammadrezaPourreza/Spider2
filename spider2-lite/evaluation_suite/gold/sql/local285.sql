WITH item_2020 AS (
    SELECT
        strftime('%Y', v.[txn_date]) AS 'yr',
        c.category_code,
        c.category_name,
        ROUND(AVG(`whsle_px_rmb-kg`), 2) AS avg_whole_sale,
        ROUND(MAX(`whsle_px_rmb-kg`), 2) AS max_whole_sale,
        ROUND(MIN(`whsle_px_rmb-kg`), 2) AS min_whole_sale,
        ROUND(ROUND(MAX(`whsle_px_rmb-kg`), 2) - ROUND(MIN(`whsle_px_rmb-kg`), 2), 2) AS whole_sale_diff,
        ROUND(SUM((v.`qty_sold(kg)`) * (w.`whsle_px_rmb-kg`)), 2) AS whole_sale_price,
        ROUND(SUM((v.`unit_selling_px_rmb/kg`) * (v.`qty_sold(kg)`)), 2) AS selling_price,
        ROUND(AVG(alr.`loss_rate_%`), 2) AS 'avg_loss_rate_%'
    FROM veg_txn_df v
    LEFT JOIN veg_whsle_df w ON v.txn_date = w.whsle_date AND v.item_code = w.item_code
    LEFT JOIN veg_cat c ON v.item_code = c.item_code
    LEFT JOIN loss_rate_df alr ON alr.item_code = v.item_code
    WHERE v.`qty_sold(kg)` > 0 AND yr = '2020'
    GROUP BY strftime('%Y', v.[txn_date]), c.category_code, c.category_name
),
item_2021 AS (
    SELECT
        strftime('%Y', v.[txn_date]) AS 'yr',
        c.category_code,
        c.category_name,
        ROUND(AVG(`whsle_px_rmb-kg`), 2) AS avg_whole_sale,
        ROUND(MAX(`whsle_px_rmb-kg`), 2) AS max_whole_sale,
        ROUND(MIN(`whsle_px_rmb-kg`), 2) AS min_whole_sale,
        ROUND(ROUND(MAX(`whsle_px_rmb-kg`), 2) - ROUND(MIN(`whsle_px_rmb-kg`), 2), 2) AS whole_sale_diff,
        ROUND(SUM((v.`qty_sold(kg)`) * (w.`whsle_px_rmb-kg`)), 2) AS whole_sale_price,
        ROUND(SUM((v.`unit_selling_px_rmb/kg`) * (v.`qty_sold(kg)`)), 2) AS selling_price,
        ROUND(AVG(alr.`loss_rate_%`), 2) AS 'avg_loss_rate_%'
    FROM veg_txn_df v
    LEFT JOIN veg_whsle_df w ON v.txn_date = w.whsle_date AND v.item_code = w.item_code
    LEFT JOIN veg_cat c ON v.item_code = c.item_code
    LEFT JOIN loss_rate_df alr ON alr.item_code = v.item_code
    WHERE v.`qty_sold(kg)` > 0 AND yr = '2021'
    GROUP BY strftime('%Y', v.[txn_date]), c.category_code, c.category_name
),
item_2022 AS (
    SELECT
        strftime('%Y', v.[txn_date]) AS 'yr',
        c.category_code,
        c.category_name,
        ROUND(AVG(`whsle_px_rmb-kg`), 2) AS avg_whole_sale,
        ROUND(MAX(`whsle_px_rmb-kg`), 2) AS max_whole_sale,
        ROUND(MIN(`whsle_px_rmb-kg`), 2) AS min_whole_sale,
        ROUND(ROUND(MAX(`whsle_px_rmb-kg`), 2) - ROUND(MIN(`whsle_px_rmb-kg`), 2), 2) AS whole_sale_diff,
        ROUND(SUM((v.`qty_sold(kg)`) * (w.`whsle_px_rmb-kg`)), 2) AS whole_sale_price,
        ROUND(SUM((v.`unit_selling_px_rmb/kg`) * (v.`qty_sold(kg)`)), 2) AS selling_price,
        ROUND(AVG(alr.`loss_rate_%`), 2) AS 'avg_loss_rate_%'
    FROM veg_txn_df v
    LEFT JOIN veg_whsle_df w ON v.txn_date = w.whsle_date AND v.item_code = w.item_code
    LEFT JOIN veg_cat c ON v.item_code = c.item_code
    LEFT JOIN loss_rate_df alr ON alr.item_code = v.item_code
    WHERE v.`qty_sold(kg)` > 0 AND yr = '2022'
    GROUP BY strftime('%Y', v.[txn_date]), c.category_code, c.category_name
),
item_2023 AS (
    SELECT
        strftime('%Y', v.[txn_date]) AS 'yr',
        c.category_code,
        c.category_name,
        ROUND(AVG(`whsle_px_rmb-kg`), 2) AS avg_whole_sale,
        ROUND(MAX(`whsle_px_rmb-kg`), 2) AS max_whole_sale,
        ROUND(MIN(`whsle_px_rmb-kg`), 2) AS min_whole_sale,
        ROUND(MAX(`whsle_px_rmb-kg`), 2) - ROUND(MIN(`whsle_px_rmb-kg`), 2) AS whole_sale_diff,
        ROUND(SUM((v.`qty_sold(kg)`) * (w.`whsle_px_rmb-kg`)), 2) AS whole_sale_price,
        ROUND(SUM((v.`unit_selling_px_rmb/kg`) * (v.`qty_sold(kg)`)), 2) AS selling_price,
        ROUND(AVG(alr.`loss_rate_%`), 2) AS 'avg_loss_rate_%'
    FROM veg_txn_df v
    LEFT JOIN veg_whsle_df w ON v.txn_date = w.whsle_date AND v.item_code = w.item_code
    LEFT JOIN veg_cat c ON v.item_code = c.item_code
    LEFT JOIN loss_rate_df alr ON alr.item_code = v.item_code
    WHERE v.`qty_sold(kg)` > 0 AND yr = '2023'
    GROUP BY strftime('%Y', v.[txn_date]), c.category_code, c.category_name
),
final_item AS (
    SELECT * FROM item_2020
    UNION
    SELECT * FROM item_2021
    UNION
    SELECT * FROM item_2022
    UNION
    SELECT * FROM item_2023
)

SELECT *,
    ROUND(((`avg_loss_rate_%` * whole_sale_price) / 100.00), 2) AS total_loss,
    ROUND(((selling_price - whole_sale_price) - (`avg_loss_rate_%` * whole_sale_price) / 100.00), 2) AS profit
FROM final_item;
