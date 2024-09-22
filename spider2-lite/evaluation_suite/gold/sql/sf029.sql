select date
, asin
, max(sa.product_title)
, sum(sa.ordered_units) as ordered_units, sum(sa.ordered_revenue) as ordered_revenue
, sa.ordered_revenue/NULLIF(sa.ordered_units,0) as ASP
, sum(tr.glance_views) as glance_views
, CAST(sa.ordered_units as decimal(5,2))/NULLIF(tr.glance_views,0) as conversion_rate
, sum(sa.shipped_units) as shipped_units
, sum(sa.shipped_revenue) as shipped_revenue
, avg(net_ppm) as net_ppm
, avg(procurable_product_oos) as procurable_product_oos
, sum(sellable_on_hand_units) as sellable_on_hand_units
, sum(sellable_on_hand_inventory) as sellable_on_hand_value
, sum(net_received) as net_received_value
, sum(net_received_units) as net_received_units
, sum(open_purchase_order_quantity) as open_purchase_order_quantity
, sum(unfilled_customer_ordered_units) as unfilled_customer_ordered_units
, avg(vendor_confirmation_rate) as vendor_confirmation_rate
, avg(receive_fill_rate) as receive_fill_rate
, avg(sell_through_rate) as sell_through_rate
, avg(overall_vendor_lead_time_days) as vendor_lead_time_days

from AMAZON_VENDOR_ANALYTICS__SAMPLE_DATASET.PUBLIC.retail_analytics_sales sa
join AMAZON_VENDOR_ANALYTICS__SAMPLE_DATASET.PUBLIC.retail_analytics_traffic tr
using (date, asin, program, period, distributor_view)
join AMAZON_VENDOR_ANALYTICS__SAMPLE_DATASET.PUBLIC.retail_analytics_inventory inv
using (date, asin, program, period, distributor_view)
join AMAZON_VENDOR_ANALYTICS__SAMPLE_DATASET.PUBLIC.retail_analytics_net_ppm ppm
using (date, asin, program, period, distributor_view)

where date >= to_date('2022-02-06','YYYY-MM-DD') -30
and distributor_view = 'Manufacturing'
and period = 'DAILY' 

group by 1, 2, 6, 8
order by 1 desc
