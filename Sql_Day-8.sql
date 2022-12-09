/****ERD--Join multiple tables ****/

use moviesdb;

select * from movies;
select * from financials;
select * from actors;
select * from movie_actor;

select m.title, group_concat(a.name) as Actor from movies m
join movie_actor ma on  ma.movie_id = m.movie_id
join actors a on a.actor_id = ma.actor_id
group by m.movie_id;


select a.name, group_concat(m.title) as Movies, 
count(m.title) as Movie_Count
from actors a 
join movie_actor ma on ma.actor_id = a.actor_id
join movies m on m.movie_id = ma.movie_id
group by a.actor_id
order by Movie_Count desc;

