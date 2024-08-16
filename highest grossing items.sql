/*
1. get total spend for year 2022 for each product within each category
2. if we use dense_rank function and there is a tie at first spot we will still get 2 products 
*/

select category, product, round(total_spend,2) as total_spend
from 
(
select category, product, total_spend,
dense_rank() over(PARTITION BY category order by total_spend desc) as spend_rank
from 
(
SELECT category, product,sum(spend) as total_spend
FROM product_spend
where EXTRACT(YEAR from transaction_date) = '2022'
group by 1,2
) a
) b
where spend_rank < 3
