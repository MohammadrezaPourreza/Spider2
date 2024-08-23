with player_career_span as (
    select 
        b.player_name,
        b.debut,
        b.final_game,
        round(b.year, 2) + round(round(b.month, 2) / round(12, 2), 2) + round(round(b.day, 2) / round(365, 2), 2) as career_span
    from (
        select
            a.player_name,
            a.debut,
            a.final_game,
            case when a.year > 0 then a.year else -a.year end as year,
            case when a.month > 0 then a.month else -a.month end as month,
            case when a.days > 0 then a.days else -a.days end as day
        from (
            select 
                name_given as player_name,
                debut,
                final_game,
                (strftime('%Y', final_game) - strftime('%Y', debut)) as year,
                (strftime('%m', final_game) - strftime('%m', debut)) as month,
                (strftime('%d', final_game) - strftime('%d', debut)) as days
            from player
        ) a
    ) b
)

select 
    avg(career_span) as average_career_span
from 
    player_career_span;