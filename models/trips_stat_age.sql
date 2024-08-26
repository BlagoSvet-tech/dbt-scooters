select user_old, avg(cnt)
from
    (
        select user_old, started_at::date, count(*) as cnt
        from
            (
                select
                    t.id,
                    t.user_id,
                    t.started_at,
                    u.birth_date,
                    date_part('year', t.started_at)
                    - date_part('year', u.birth_date) as user_old
                from scooters_raw.trips t
                join scooters_raw.users u on t.user_id = u.id
            ) tt
        group by user_old, started_at::date
    ) dt
group by user_old
order by 1
