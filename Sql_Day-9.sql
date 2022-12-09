/****Join Excercise****/
/***Generate a report of all Hindi movies sorted by their revenue amount in millions.
Print movie name, revenue, currency, and unit**/

use moviesdb;

select m.movie_id, title, 
revenue, currency, unit,
 case
when unit = "Thousands" then round((revenue)/1000,2)
when unit = "Billions" then round((revenue)*1000,2)
else round(revenue,2)
end as revenue_mln
 from movies m
join financials f
on m.movie_id = f.movie_id
join languages l on m.language_id = l.language_id
where industry = "Bollywood"
order by revenue_mln desc;
