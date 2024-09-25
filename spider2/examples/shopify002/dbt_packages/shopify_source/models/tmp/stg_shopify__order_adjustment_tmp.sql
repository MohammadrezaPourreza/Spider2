-- this model will be all NULL until you have made an order adjustment in Shopify

{{
    fivetran_utils.union_data(
        table_identifier='order_adjustment', 
        database_variable='shopify_database', 
        schema_variable='shopify_schema', 
        default_database=target.database,
        default_schema='shopify',
        default_variable='order_adjustment_source',
        union_schema_variable='shopify_union_schemas',
        union_database_variable='shopify_union_databases'
    )
}}