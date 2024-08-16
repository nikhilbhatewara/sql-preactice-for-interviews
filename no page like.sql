SELECT a.page_id
FROM pages a  
left join page_likes b 
on a.page_id = b.page_id
where b.page_id is null 
group by 1
order by 1
