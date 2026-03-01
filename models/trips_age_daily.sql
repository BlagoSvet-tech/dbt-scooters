select age,
	   date,
	   count(distinct id) as cnt_trips,
       sum(price_rub) as revenue_rub
from {{ref("trips_users")}}
group by age,
		 date