with orderlines_cte as (
    select
        ol.order_id,
        ol.product_id,
        ol.qty,
        ifnull(
            sum(ol.qty) over (
                partition by ol.product_id
                order by ol.order_id
                rows between unbounded preceding and 1 preceding
            ), 0
        ) + 1 as from_q,
        ifnull(
            sum(ol.qty) over (
                partition by ol.product_id
                order by ol.order_id
                rows between unbounded preceding and 1 preceding
            ), 0
        ) + ol.qty as to_q
    from orderlines ol
    where ol.order_id = 423
),
inventory_cte as (
    select
        i.product_id,
        i.qty,
        ifnull(
            sum(i.qty) over (
                partition by i.product_id
                order by i.purchased, i.qty
                rows between unbounded preceding and 1 preceding
            ), 0
        ) as acc_prv_q,
        i.purchased,
        i.warehouse,
        i.aisle,
        i.position
    from inventory_with_dims i
)
select
    i.product_id as product_id,
    i.aisle as aisle,
    i.position as position,
    case
        when i.qty < ob.qty - i.acc_prv_q then i.qty
        else ob.qty - i.acc_prv_q
    end as quantity_to_be_picked
from orderlines_cte ol
join (
    select
        product_id,
        sum(qty) as qty
    from orderlines_cte
    group by product_id
) ob on ol.product_id = ob.product_id
join inventory_cte i on i.product_id = ob.product_id
where i.acc_prv_q < ob.qty
  and ol.to_q >= i.acc_prv_q + 1
  and ol.from_q <= case
        when i.acc_prv_q + i.qty < ob.qty then i.acc_prv_q + i.qty
        else ob.qty
    end
  and i.warehouse = 1
order by quantity_to_be_picked desc;