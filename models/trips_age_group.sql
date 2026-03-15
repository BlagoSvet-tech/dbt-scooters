select 
	ag.group as age_group,
    count(distinct id) as trips,
    sum(price_rub) as revenue_rub   
from {{ref("trips_users")}} tu 
left join {{ref("age_groups")}} ag on tu.age >= ag.age_start and tu.age <= ag.age_end 
group by ag.group