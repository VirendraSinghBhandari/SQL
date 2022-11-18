select * from moviesdb.movies;

select count(*) from moviesdb.movies where industry = "bollywood";

select distinct industry from moviesdb.movies;

select * from moviesdb.movies where Title like "%THOR%";
select * from moviesdb.movies where Title like "%America%";
 
select Title, release_year from moviesdb.movies;

select * from moviesdb.movies where title like "%Avenger%";

select release_year from moviesdb.movies where title like "The Godfather";

select studio from moviesdb.movies where industry like "Bollywood";