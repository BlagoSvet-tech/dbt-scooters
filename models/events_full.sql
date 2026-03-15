select
    user_id, 
    "timestamp", 
    type_id,
    type
from {{ref('events_clean')}} ec 
left join {{ref('event_types')}} et using(type_id)