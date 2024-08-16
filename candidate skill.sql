SELECT candidate_id
FROM candidates
where skill in ('Python','Tableau' , 'PostgreSQL')
group by 1
having count(distinct skill) = 3
order by 1 


Since the table has 1 row for each candidate id and skill we cannot use AND condition 
