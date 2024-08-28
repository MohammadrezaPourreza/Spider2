WITH customer_payments AS (
    SELECT
        strftime('%m', pm.payment_date) AS pay_month,
        pm.customer_id,
        SUM(pm.amount) AS total_payment
    FROM
        payment AS pm
    WHERE
        pm.customer_id IN (
            SELECT customer_id FROM customer WHERE first_name || ' ' || last_name = 'MARY SMITH'
            UNION
            SELECT customer_id FROM customer WHERE first_name || ' ' || last_name = 'LINDA WILLIAMS'
        )
    GROUP BY
        1, 2
),
customer_a_payments AS (
    SELECT
        pay_month,
        total_payment AS customer_a_payment
    FROM
        customer_payments
    WHERE
        customer_id = (SELECT customer_id FROM customer WHERE first_name || ' ' || last_name = 'MARY SMITH')
),
customer_b_payments AS (
    SELECT
        pay_month,
        total_payment AS customer_b_payment
    FROM
        customer_payments
    WHERE
        customer_id = (SELECT customer_id FROM customer WHERE first_name || ' ' || last_name = 'LINDA WILLIAMS')
),
payment_differences AS (
    SELECT
        a.pay_month,
        ABS(a.customer_a_payment - b.customer_b_payment) AS payment_difference
    FROM
        customer_a_payments AS a
    JOIN customer_b_payments AS b ON a.pay_month = b.pay_month
)
SELECT
    pay_month AS month
FROM
    payment_differences
ORDER BY
    payment_difference DESC
LIMIT 1;