{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_sales_enabled','hubspot_deal_enabled'])) }}

select {{ dbt_utils.star(source('hubspot','deal')) }}
from {{ var('deal') }}
