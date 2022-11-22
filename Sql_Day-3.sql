/* How many movies were released between 2015 and 2022 */

select * from moviesdb.movies;

select count(*) from moviesdb.movies where release_year between 2015 and 2022;

/* Print the max and min movie release year*/

select max(release_year) as max, min(release_year) as min from moviesdb.movies;

/*Print a year and how many movies were released in that year starting with the latest year*/

select release_year as Year, count(*) as movies_count
from moviesdb.movies 
Group by release_year 
order by release_year Desc; 
