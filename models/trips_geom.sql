select
    id,
    public.st_setsrid(public.st_makepoint(start_lon, start_lat), 4326) as start_point,
    public.st_setsrid(public.st_makepoint(finish_lon, finish_lat), 4326) as finish_point
from {{source("scooters_raw",  "trips")}}