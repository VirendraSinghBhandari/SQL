/***1. Select all the movies with minimum and maximum release_year.
 Note that there can be more than one movie in min and
 a max year hence output rows can be more than 2***/
 
 use moviesdb;

#Pattern 1:
#step 1: fetch min release year
select min(release_year) from movies;
#Step 2: fetch max release year
select max(release_year) from movies;
# Write main query:

select title, release_year from movies where release_year in(1946,2022);

#Pattern 2: Wrtie sub query  
 select title, release_year from movies
 where release_year in ((select min(release_year) from movies),
(select max(release_year) from movies));

/****Select all the rows from the movies table
whose imdb_rating is higher than the average rating***/

select * from movies where imdb_rating > (select avg(imdb_rating) from movies);

#comman table expression (CTE)

#get all the actors who ages is begween 70 and 85

use moviesdb;

#comman table expression (CTE)

#get all the actors who ages is begween 70 and 85
select actor_name, age from 
 (select name as actor_name, year(curdate()) - birth_year as age from actors)
as actor_age
where age > 70 and age < 85;

#query: #get all the actors who ages is begween 70 and 85
#with CTE expresiion:
with actor_age as (
  select 
	name as actor_name, 
	year(curdate()) - birth_year as age 
  from actors
  )
select actor_name, age
from  actor_age
where age > 70 and age < 85;


#Problem stattement: Movies that produce 500% or more profit and their rating was less than avg rating for all movies
#1 Movies that produce 500% or more profit
select *, 
 (revenue -budget)*100/budget as pct_profit
from financials where (revenue -budget)*100/budget > 500;

#2find out the movies which imdb rating is less than avg

select * from movies
where imdb_rating < (select avg(imdb_rating) from movies);

#executint with subquery:
select x.movie_id, x.pct_profit, y.title, y.imdb_rating from (
select *, 
 (revenue -budget)*100/budget as pct_profit
from financials) x
join (
select * from movies
where imdb_rating < (select avg(imdb_rating) from movies)
) y
on x.movie_id = y.movie_id
where pct_profit > 500;

#CTE:
with 
	x as (
select *, 
 (revenue -budget)*100/budget as pct_profit
from financials),
    y as (select * from movies
where imdb_rating < (select avg(imdb_rating) from movies)
)
select 
x.movie_id, x.pct_profit, 
y.title, y.imdb_rating 
from x
join y
on x.movie_id = y.movie_id
where pct_profit > 500;

#Benifits
#simple queries for Query readability
#Same resultset can be reference multiple time
#Visibility for creating data views
