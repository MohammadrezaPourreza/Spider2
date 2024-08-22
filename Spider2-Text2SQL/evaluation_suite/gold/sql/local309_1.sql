with year_points as (
    select 
        races.year,
        drivers.forename || ' ' || drivers.surname as driver,
        constructors.name as constructor,
        sum(results.points) as points
    from 
        results
    left join races on results.race_id = races.race_id  -- Ensure these columns exist in your schema
    left join drivers on results.driver_id = drivers.driver_id  -- Ensure these columns exist in your schema
    left join constructors on results.constructor_id = constructors.constructor_id  -- Ensure these columns exist in your schema
    group by 
        races.year, 
        driver
    union
    select 
        races.year,
        null as driver,
        constructors.name as constructor,
        sum(results.points) as points
    from 
        results
    left join races on results.race_id = races.race_id  -- Ensure these columns exist in your schema
    left join drivers on results.driver_id = drivers.driver_id  -- Ensure these columns exist in your schema
    left join constructors on results.constructor_id = constructors.constructor_id  -- Ensure these columns exist in your schema
    group by 
        races.year, 
        constructor
),
max_points as (
    select 
        year,
        max(case when driver is not null then points else null end) as max_driver_points,
        max(case when constructor is not null then points else null end) as max_constructor_points
    from 
        year_points
    group by 
        year
)
select 
    avg(max_driver_points + max_constructor_points) AS average
from 
    max_points;