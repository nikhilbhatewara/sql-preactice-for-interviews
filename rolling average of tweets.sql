SELECT user_id, tweet_date , round(avg(tweet_count) over(PARTITION BY user_id order by tweet_date asc rows BETWEEN  2  preceding   and current row),2) as rolloing_avg
FROM tweets
