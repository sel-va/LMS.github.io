select monday,tuesday,wednesday,thursday,friday,saturday,sunday from (
select to_char(day,'iw') as week,
  max(case when to_char(day,'d')=1 then to_char(day,'dd') else null end) as monday,
  max(case when to_char(day,'d')=2 then to_char(day,'dd') else null end) as tuesday,
  max(case when to_char(day,'d')=3 then to_char(day,'dd') else null end) as wednesday,
  max(case when to_char(day,'d')=4 then to_char(day,'dd') else null end) as thursday,
  max(case when to_char(day,'d')=5 then to_char(day,'dd') else null end) as friday,
  max(case when to_char(day,'d')=6 then to_char(day,'dd') else null end) as saturday,
  max(case when to_char(day,'d')=7 then to_char(day,'dd') else null end) as sunday
from (select to_date('01-MAR-' || to_char(sysdate,'YYYY'),'DD-MON-YYYY') + (rownum-1) as day
      from all_objects
      where rownum <365) dates
where to_char(day,'MM')=4 -- :month_number
group by to_char(day,'iw')) t
order by to_number(week);
