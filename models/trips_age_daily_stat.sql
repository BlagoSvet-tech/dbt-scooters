select ages, 
       sum(cnt_trips) / count(distinct started_date) as avg_trips,
       avg(revenue_rub) as avg_revenue_rub 
from {{ref("trips_age_daily")}}
group by ages