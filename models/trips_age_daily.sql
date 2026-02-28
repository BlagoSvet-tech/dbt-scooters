select extract(year from t.started_at) - extract(year from u.birth_date) as ages,
		   t.started_at::date as started_date,
		   count(distinct t.id) as cnt_trips,
           sum(price_rub) as revenue_rub
from {{source("scooters_raw", "users")}} u 
join {{ref("trips_prep")}} t on u.id = t.user_id 
group by extract(year from t.started_at) - extract(year from u.birth_date),
		t.started_at::date