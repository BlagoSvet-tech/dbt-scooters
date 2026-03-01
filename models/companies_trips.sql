select s.company,
       c.scooters,
       count(distinct tp.id) as trips,
       count(distinct tp.id) / c.scooters::decimal as trips_per_scooter
from {{ref("trips_prep")}} tp 
left join {{ref("scooters")}} s on tp.scooter_hw_id = s.hardware_id 
left join {{ref("companies")}} c on s.company = c.company 
group by 1, 2