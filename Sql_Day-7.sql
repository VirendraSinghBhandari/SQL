/****Convert revenue into other unit***/

use moviesdb;

select m.movie_id, title, budget, revenue, currency, unit, 
(revenue - budget) as profit
from movies m
join financials f 
on m.movie_id = f.movie_id;

select m.movie_id, title, budget, revenue, currency, unit, 
(revenue - budget) as profit
from movies m
join financials f 
on m.movie_id = f.movie_id
where industry = "Bollywood"
order by profit desc;


 
select m.movie_id, title, budget, revenue, currency, unit,
Case
When unit = "Thousand" then round((revenue - budget)/1000,2)
When unit = "Billions" then round((revenue - budget)*1000,2)
else round((revenue - budget),0)
end as profit_mln
 from movies m
join financials f on m.movie_id = f.movie_id
where industry = "Bollywood"
order by profit_mln desc;
 