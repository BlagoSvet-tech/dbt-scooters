select 
	count(*) as trips,
	count(distinct user_id) as users,
	avg(duration_s) / 60 as avg_duration_m,
    sum(distance_m) / 1000 as sum_distance_km,
	sum(price_rub) / 100 as revenue_rub,
	count(is_free or null) * 100 / count(*)::decimal as free_trips_pct
from {{ ref("trips_prep")}}