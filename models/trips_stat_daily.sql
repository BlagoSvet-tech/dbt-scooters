select 
	started_at::date as date,
	count(*) as trips,
	max(price) as max_price_rub,
	avg(distance) / 1000 as avg_distance_km 
from scooters_raw.trips t 
group by started_at::date