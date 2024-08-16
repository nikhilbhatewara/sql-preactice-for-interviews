with base_table as 
(
SELECT extract(month from event_date) as month,
user_id, count(distinct event_id) as num_actions
FROM user_actions
where event_type in ('sign-in', 'like', 'comment')
and extract(year from event_date) = 2022
group by 1,2
)


select a.month, count(distinct a.user_id) as monthly_active_users
from base_table a 
left join base_table b  
on a.user_id = b.user_id
and a.month - b.month = 1
where coalesce(b.num_actions) > 0
and coalesce(a.num_actions) > 0
and a.month = 7
group by 1
