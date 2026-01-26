select started_at::date, 
	   count(distinct id) as trips,
	   max(price) / 100 as max_price_rub,
	   avg(distance) / 1000 as avg_distance_km 
from scooters_raw.trips
group by started_at::date