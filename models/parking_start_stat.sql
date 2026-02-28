select
    public.st_transform(hex.geom, 4326) as geom,
    count(*) as trips
from
    {{ref("trips_geom")}} as t
cross join
    public.st_hexagongrid(500, public.st_transform(t.start_point, 3857)) as hex
where
    public.st_intersects(public.st_transform(t.start_point, 3857), hex.geom)
group by
    1