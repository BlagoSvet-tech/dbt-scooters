select "date", 
       sum(price_rub) as revenue_rub,
       now() at time zone 'utc' as update_at
from {{ref("trips_prep")}}
{% if is_incremental() %}
    date "date" >= (select max("date") - interval '2' day from {{ this }})
{% endif %}
group by date, now() at time zone 'utc'