select 
	count(*) as trips,
	count(distinct t.user_id) as users,
	avg(extract(epoch from finished_at - started_at )) / 60 as avg_duration_m,
	sum(price) / 100 as revenue_rub,
	count(*) filter (where price = 0 or price is null) * 100 / count(*)::decimal as free_trips_pct
from scooters_raw.trips t 