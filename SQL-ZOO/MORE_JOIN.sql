SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr
FROM movie
WHERE title='Citizen Kane'

SELECT id,title,yr FROM movie
WHERE title LIKE 'Star Trek%'

SELECT id from actor
WHERE name='Glenn Close'

SELECT id from movie
WHERE title = 'Casablanca'

SELECT name FROM casting
          JOIN movie ON casting.movieid=movie.id
          JOIN actor ON actorid=actor.id
  WHERE movieid=11768

SELECT name FROM casting
          JOIN movie ON casting.movieid=movie.id
          JOIN actor ON actorid=actor.id
  WHERE movie.title = 'Alien'

SELECT title FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
  WHERE actor.name='Harrison Ford'

SELECT title FROM movie 
         JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
  WHERE actor.name='Harrison Ford' AND ord!=1

SELECT title,name FROM movie 
         JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
  WHERE ord=1 AND yr=1962

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT title, name FROM movie
        JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
  WHERE ord=1
    AND movieid IN
    (SELECT movieid FROM casting, actor
     WHERE actorid=actor.id
     AND name='Julie Andrews')

SELECT name
    FROM casting JOIN actor
      ON  actorid = actor.id
    WHERE ord=1
    GROUP BY name
    HAVING COUNT(movieid)>=30

SELECT title,COUNT(actorid) FROM movie
  JOIN casting ON movieid=movie.id
  WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC, title

15. SELECT name FROM actor JOIN casting ON actor.id = actorid
WHERE movieid IN
  (SELECT id FROM movie WHERE title IN
    (SELECT title FROM movie JOIN casting ON movie.id = movieid WHERE actorid IN
      (SELECT id FROM actor WHERE name = 'Art Garfunkel')))
  AND name != 'Art Garfunkel'