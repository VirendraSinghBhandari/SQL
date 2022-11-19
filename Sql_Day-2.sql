select * from moviesdb.movies;

/*Print all movies in the order of their release year (latest first)*/

select * from moviesdb.movies order by release_year desc;

/*All movies released in the year 2022*/

select * from moviesdb.movies where release_year like 2022;

select * from moviesdb.movies where release_year = 2022;

/*Now all the movies released after 2020*/

select * from moviesdb.movies where release_year > 2020;

/*All movies after the year 2020 that have more than 8 rating*/

select * from moviesdb.movies where release_year > 2020 and imdb_rating > 8;

/*Select all movies that are by Marvel studios and Hombale Films*/

select * from moviesdb.movies where studio in("Marvel studios","Hombale Films");

/*Select all THOR movies by their release year*/

select title, release_year from moviesdb.movies
 where 
title like "%Thor%" 
order by release_year;


/*Select all movies that are not from Marvel Studios*/

select * from moviesdb.movies where studio <> "Marvel Studios";
select * from moviesdb.movies where studio != "Marvel Studios";

