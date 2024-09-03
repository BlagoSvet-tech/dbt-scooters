select id,
	user_id,
	scooter_hw_id,
	started_at,
	finished_at,
	start_lat,
	start_lon,
	finish_lat,
	finish_lon,
	distance as distance_m,
	cast(price as decimal(20, 2)) / 100 as price_rub,
	extract(epoch from finished_at - started_at) as duration_s,
	case when price = 0 and finished_at != started_at then true
	else false
	end is_free,
	started_at::date as "date"
from {{ source("scooters_raw", "trips")}}
