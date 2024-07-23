-- More JOIN operations

1. SELECT id, title
 FROM movie
 WHERE yr=1962

2.  SELECT yr FROM movie WHERE title='Citizen Kane'

3. SELECT id, title, yr FROM movie WHERE title LIKE 'Star Trek%' ORDER BY yr

4. SELECT id FROM actor WHERE name= 'Glenn Close'

5. SELECT id FROM movie WHERE title=  'Casablanca' 

6. SELECT name  FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE movie.id IN (SELECT id FROM movie WHERE title=  'Casablanca')

7.SELECT name  FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE movie.title = 'Alien'

8. SELECT title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'

9. SELECT title FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford' AND ord != 1

10. SELECT title,name FROM movie
JOIN casting
ON movie.id = casting.movieid
JOIN actor
ON casting.actorid = actor.id
WHERE  yr = 1962 AND ord = 1

11. SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

12. SELECT movie.title, actor.name 
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1 
AND movie.id IN (
    SELECT movie.id 
    FROM movie
    JOIN casting ON movie.id = casting.movieid
    JOIN actor ON casting.actorid = actor.id
    WHERE actor.name = 'Julie Andrews'
)

13. SELECT name
FROM casting 
JOIN actor ON casting.actorid = actor.id
WHERE ord = 1
GROUP BY name
HAVING count(name) > 14
ORDER BY name

14. SELECT title, COUNT(title) AS count FROM movie
JOIN casting 
ON movie.id = casting.movieid
WHERE yr = 1978
GROUP BY title
ORDER BY count DESC, title

15. SELECT DISTINCT actor.name 
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movieid IN (SELECT movieid
FROM casting 
JOIN actor ON casting.actorid = actor.id
WHERE name = 'Art Garfunkel') AND name != 'Art Garfunkel'

/* Quiz

1.SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
 WHERE gross < budget

2.SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

3.SELECT name, COUNT(movieid)
  FROM casting JOIN actor ON actorid=actor.id
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY 2 DESC

4."Crocodile" Dundee
Crocodile Dundee in Los Angeles
Flipper
Lightning Jack

5.SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

6.  link the director column in movies with the primary key in actor
    connect the primary keys of movie and actor via the casting table


7.A Bronx Tale	1993
Bang the Drum Slowly	1973
Limitless	2011

*/