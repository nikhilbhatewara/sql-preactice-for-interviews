select age_bucket,
round((100.0*sum(case when activity_type = 'send' then time_spent end)/sum(time_spent)),2) as send_perc,
round((100.0*sum( case when activity_type = 'open' then time_spent end)/sum(time_spent)),2) as open_perc
from 
(
SELECT b.age_bucket,a.user_id,a.activity_type,sum(time_spent) as time_spent
FROM activities a 
left join age_breakdown b 
on a.user_id = b.user_id
group by 1,2,3
) a
where  activity_type in ('open','send')
group by 1
