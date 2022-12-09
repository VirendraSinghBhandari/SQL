use  moviesdb;

select * from movies;
select * from actors;
select * from languages;
select * from financials;


/*1. Show all the movies with their language names*/

select
movies.language_id, Title, name from movies
join languages
on movies.language_id = languages.language_id;

select
movies.language_id, Title, name from movies
join languages
using(language_id);

/*2. Show all Telugu movie names (assuming you don't know the language
id for Telugu)*/

select title from movies join languages using(language_id) where name = "Telugu";

/*3. Show the language and number of movies released in that language*/

select name, count(language_id) as Movie_count from languages
left join movies
using(language_id) group by language_id
order by Movie_count Desc;


/*1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
Print movie name, revenue, currency, and unit */

select Title, reveune, currency, unit from movies
case
 When unit = "Billions" then round(revenue*1000,2)
 when unit = "Thousand" then round(revenue/1000,2)
 else
 revenue
end
as revenue_mln
join financials
using(movie_id)
order by revenue Desc;

/******Practice purpose*********/

select * from moviesdb.movies;

select * from financials;




select * from movies;


select * from moviesdb.languages;


select movies.title, name from movies
join languages 
on movies.language_id = languages.language_id;

select movies.title, name from movies
join languages
on movies.language_id = languages.language_id
where name = "Telugu";

select name, count(language_id) as movie_count from languages
left join movies
using(language_id)group by language_id
order by movie_count desc;


select name, count(language_id) as Movie_count from languages l
left join movies m
using(language_id)
group by language_id
order by movie_count desc;

