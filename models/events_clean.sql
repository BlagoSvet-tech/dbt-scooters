select distinct user_id,
    "timestamp", 
    type_id,
    {{ updated_at() }}
from {{source("scooters_raw", "events")}}
{% if is_incremental() %}
    where "timestamp" > (select max("timestamp") from {{ this }})
    order by "timestamp" 
{% else %}
    where "timestamp" < '2023-08-01'::date 
{% endif %}
