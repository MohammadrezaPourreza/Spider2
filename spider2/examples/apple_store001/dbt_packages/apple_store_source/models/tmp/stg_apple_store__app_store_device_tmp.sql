{{
    fivetran_utils.union_data(
        table_identifier='app_store_source_type_device_report', 
        database_variable='apple_store_database', 
        schema_variable='apple_store_schema', 
        default_database=target.database,
        default_schema='apple_store',
        default_variable='app_store_device',
        union_schema_variable='apple_store_union_schemas',
        union_database_variable='apple_store_union_databases'
    )
}}