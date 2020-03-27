set search_path to stackoverflow_filtered;

--How many cities appeared more than twice in your results table?
select c.city from 
(select city, count(1)
from results
group by city) c
where c.count > 2;

--How many unique ​created_at ​ dates(not datetime) are in the result table?
select count( distinct date(users_created_at)) from results;

--If you were to give an award to one user, who will it be? And why?
select display_name, answers_score from results
order by answers_score desc
limit 1;

--i will give it to Bhuvanesh BS because he had he had the highest score