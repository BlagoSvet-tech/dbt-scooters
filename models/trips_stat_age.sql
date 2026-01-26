with cnt_trips_per_day as (
	select extract(year from t.started_at) - extract(year from u.birth_date) as ages,
		   t.started_at::date as started_date,
		   count(distinct t.id) as cnt_trips
	from scooters_raw.users u 
	join scooters_raw.trips t on u.id = t.user_id 
	group by extract(year from t.started_at) - extract(year from u.birth_date),
			 t.started_at::date
)
select ages, sum(cnt_trips) / count(distinct started_date) as avg_trips
from cnt_trips_per_day
group by ages