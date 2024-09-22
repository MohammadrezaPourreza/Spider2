with datetimes_ as ( --Grabbing standardized datetime data to which all data will be joined.
        select *
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.iso_market_times_sample
        where iso = 'ERCOT'
            and datetime = '2022-10-01' -- Setting date specifically for October 1st, 2022.
),
    prices_ as (
        select *
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.dart_prices_sample
        where iso = 'E' --ISO code (E = ERCOT).
            and objectid = 10000697078 --Price node unique numeric id.
),
    load_forc_ as ( --Load forecast data. To find datatypes, use the v_data_catalog_basic view to get the datatypeid and storage table in which the data is located.
        select *
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ts_forecast_sample
        where datatypeid = 19060
            and objectid = 10000712973
),
    load_ as ( --Real time load data.
        select *
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.dart_loads_sample
        where objectid = 10000712973
),
    wind_gen_forc_ as ( --Wind generation forecast data.
        select *
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ts_forecast_sample
        where datatypeid = 9285
           and objectid = 10000712973
),
    wind_gen_ as ( --Real time wind data.
        select trunc(dateadd('second', 3599, datetime), 'hour') datetime --Converts the hourly rollup of 5 min data to hour ending (the 5 min are already interval ending themselves; just needs to be done for Snowflake).
              ,avg(value) wind_gen --Raw real time wind generation data is reported at the 5 min granularity.
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ts_gen_sample
        where datatypeid = 16
            and objectid = 10000712973
        group by all
),
    solar_gen_forc_ as ( --Solar generation forecast data.
        select *
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ts_forecast_sample
        where datatypeid = 662
            and objectid = 10000712973
),
    solar_gen_ as ( --Real time solar generation data.
        select trunc(dateadd('second', 3599, datetime), 'hour') datetime --Converts the hourly rollup of 5 min data to hour ending (the 5 min are already interval ending themselves; just needs to be done for Snowflake).
              ,avg(value) solar_gen --Raw real time solar generation data is reported at the 5 min granularity.
        from YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ts_gen_sample
        where datatypeid = 650
            and objectid = 10000712973
        group by all
),
    combined_wide_data_ as ( --Combining the datatypes from above and grabbing only a subset of the columns. You can grab / "preserve" more columns such as the datatypeids from above by updating the code.
        select mt.iso --Datetime attributes.
              ,mt.datetime
              ,mt.timezone              
              ,mt.datetime_utc
              ,mt.onpeak
              ,mt.offpeak
              ,mt.wepeak
              ,mt.wdpeak
              ,mt.marketday
              ,ob1.objectname price_node_name --Object for the price data.
              ,pr.objectid price_node_id
              ,pr.dalmp
              ,pr.rtlmp
              ,ob2.objectname load_zone_name --Object for the ISO-wide load and generation data. You can also associate this object explicitly with each of the subsequent datatypes by updating the code.
              ,lf.objectid load_zone_id
              ,lf.value load_forecast
              ,lf.publishdate load_forecast_publish_date            
              ,ld.rtload
              ,wf.value wind_gen_forecast
              ,wf.publishdate wind_gen_forecast_publish_date
              ,wg.wind_gen
              ,sf.value solar_gen_forecast
              ,sf.publishdate solar_gen_forecast_publish_date
              ,sg.solar_gen
              ,load_forecast - wind_gen_forecast - solar_gen_forecast net_load_forecast --Easily calculate additional columns / features such as net load (load minus renewable generation).
              ,ld.rtload - wg.wind_gen - sg.solar_gen net_load_real_time --Second calculated feature for real time net load.
        from datetimes_ mt
        inner join prices_ pr
            on (mt.datetime = pr.datetime)
        inner join load_forc_ lf
            on (mt.datetime = lf.datetime)
        inner join load_ ld
            on (mt.datetime = ld.datetime)    
        inner join wind_gen_forc_ wf
            on (mt.datetime = wf.datetime)
        inner join wind_gen_ wg
            on (mt.datetime = wg.datetime)    
        inner join solar_gen_forc_ sf
            on (mt.datetime = sf.datetime)
        inner join solar_gen_ sg
            on (mt.datetime = sg.datetime)
        inner join YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ds_object_list_sample ob1
            on (pr.objectid = ob1.objectid)
        inner join YES_ENERGY__SAMPLE_DATA.YES_ENERGY_SAMPLE.ds_object_list_sample ob2
            on (lf.objectid = ob2.objectid)             
)
select *
from combined_wide_data_
order by datetime asc;
