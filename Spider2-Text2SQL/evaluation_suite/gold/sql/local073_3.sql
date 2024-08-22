WITH id_customer_orders AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY order_id) AS row_id,
        order_id,
        customer_id,
        pizza_id,
        exclusions,
        extras,
        order_time
    FROM
        clean_customer_orders
),
get_exlusions_and_extras AS (
    SELECT
        t2.row_id,
        t2.order_id,
        t2.customer_id,
        t2.order_time,
        t1.pizza_name,
        CASE
            WHEN t2.exclusions IS NULL AND t2.extras IS NULL THEN NULL
            ELSE (
                SELECT
                    STRING_AGG((SELECT topping_name FROM pizza_toppings WHERE topping_id = get_exc.exclusions), ', ')
                FROM
                    get_exclusions AS get_exc
                WHERE
                    order_id = t2.order_id
            )
        END AS all_exclusions,
        CASE
            WHEN t2.exclusions IS NULL AND t2.extras IS NULL THEN NULL
            ELSE (
                SELECT
                    STRING_AGG((SELECT topping_name FROM pizza_toppings WHERE topping_id = get_ext.extras), ', ')
                FROM
                    get_extras AS get_ext
                WHERE
                    order_id = t2.order_id
            )
        END AS all_extras
    FROM
        pizza_names AS t1
    JOIN
        id_customer_orders AS t2
    ON
        t2.pizza_id = t1.pizza_id
    LEFT JOIN
        get_exclusions AS t3
    ON
        t3.order_id = t2.order_id AND t2.exclusions IS NOT NULL
    LEFT JOIN
        get_extras AS t4
    ON
        t4.order_id = t2.order_id AND t2.extras IS NOT NULL
    GROUP BY
        t2.row_id,
        t2.order_id,
        t2.customer_id,
        t2.order_time,
        t1.pizza_name,
        t2.exclusions,
        t2.extras
    ORDER BY
        t2.row_id
)
SELECT
    order_id,
    customer_id,
    CASE
        WHEN pizza_name = 'Meatlovers' THEN 1
        ELSE 2
    END AS pizza_id,
    order_time,
    CASE
        WHEN all_exclusions IS NOT NULL AND all_extras IS NULL THEN CONCAT(pizza_name, ' - ', 'Exclude: ', all_exclusions)
        WHEN all_exclusions IS NULL AND all_extras IS NOT NULL THEN CONCAT(pizza_name, ' - ', 'Extra: ', all_extras)
        WHEN all_exclusions IS NOT NULL AND all_extras IS NOT NULL THEN CONCAT(pizza_name, ' - ', 'Exclude: ', all_exclusions, ' - ', 'Extra: ', all_extras)
        ELSE pizza_name
    END AS order_item
FROM
    get_exlusions_and_extras;