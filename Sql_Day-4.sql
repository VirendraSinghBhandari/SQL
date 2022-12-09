select * from moviesdb.movies;

select * from moviesdb.actors;

select * from moviesdb.financials;


select year(curdate());
select *, (revenue - budget) as Profit from moviesdb.financials;

/*USD to INR conversion ratio = 77*/

select *,
if(currency="USD", revenue*77, revenue) as revenue_INR from moviesdb.financials;


select distinct unit from moviesdb.financials;

/*Billions ---> revenue*1000
Thousands--->revenue/1000*/

select *, 
Case 
	when unit="Thousands" then revenue/1000
    when unit ="Billions" then revenue*1000
    Else
    revenue
end    
as revenue_Mln from moviesdb.financials;




select * from moviesdb.actors;

select *, year(curdate())- birth_year as Age from moviesdb.actors;


select * from moviesdb.movies;

select * distinct imdb_rating  from moviesdb.movies;


select format(stddev(imdb_rating),2) as std_dev from moviesdb.movies;