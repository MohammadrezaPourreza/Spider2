select 
    v.Age, v.Total as Vehicle_Total, v.Black as Vehicle_Black,
    g.Total as Gun_Total, g.Black as Gun_Black
from (
  select 
      Age, count(*) as Total, sum(Race = 2) as Black
  from DeathRecords d,
     (
     select 
       distinct e.DeathRecordId as id 
       from 
         EntityAxisConditions e,
         (
            select * 
            from Icd10Code where Description like ('%vehicle%')
         ) as c 
        where e.Icd10Code = c.code
     ) as f
    where d.id = f.id and AgeType = 1 and Age between 12 and 18
    group by Age
) as v, -- Vehicle

(
  select 
      Age, count(*) as Total, sum(Race = 2) as Black
  from DeathRecords d,
      (select 
           distinct e.DeathRecordId as id 
           from 
              EntityAxisConditions e,
              (
                -- Every Firearm discharge, except Legal intervention
                select 
                   Code, Description 
                   from Icd10Code
                   where Description like '%discharge%' 
                     and Description not in ('Urethral discharge',
                                             'Discharge of firework',
                                             'Legal intervention involving firearm discharge')
              ) as c 
          where e.Icd10Code = c.code
      ) as f
  where d.id = f.id and AgeType = 1 and Age between 12 and 18
  group by Age
) as g
where g.Age = v.Age;