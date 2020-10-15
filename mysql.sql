-- normal mode --
-- 1 --
SELECT *
FROM movies -- 2 --
SELECT title,
  id
FROM movies
LIMIT 10 -- 3 --
SELECT *
FROM movies
WHERE id = 485 -- 4 --
SELECT DISTINCT id
FROM movies
WHERE title = "Made in America (1993)" -- 5 --
SELECT *
FROM movies
ORDER BY title
LIMIT 10 -- 6 --
SELECT *
FROM movies
WHERE title LIKE "%2002%";
-- 7 --
SELECT *
FROM movies
WHERE title LIKE "%Godfather%" -- 8 --
SELECT *
FROM movies
WHERE genres LIKE "%comedy%" -- 9 --
SELECT *
FROM movies
WHERE genres LIKE "%comedy%"
  AND title LIKE "%(2000)%" -- 10 --
SELECT *
FROM movies
WHERE title LIKE "%death%"
  AND genres LIKE "%comedy%" -- 11 --
SELECT *
FROM movies
WHERE title LIKE "%super%"
  AND (
    title LIKE "%(2001)"
    OR title LIKE "%(2002)"
  ) -- 12 --
  "cant in sqlLite" -- 13 --
  "cant in sqlLite" -- 14 --
  "cant in sqlLite" --  joins --
  -- 15 --
SELECT movies.title,
  ratings.movie_id,
  ratings.rating
FROM movies
  LEFT JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.id = 858 -- 16 --
SELECT movies.title,
  ratings.movie_id,
  ratings.rating,
  ratings.timestamp
FROM movies
  LEFT JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.id = 858
ORDER BY ratings.timestamp DESC -- 17 --
SELECT movies.title,
  links.imdb_id,
  movies.genres
FROM movies
  LEFT JOIN links ON movies.id = links.movie_id
WHERE title LIKE '%(2005)%'
  AND genres LIKE "%comedy%" -- 18 --
SELECT movies.title,
  ratings.rating
FROM movies
  LEFT JOIN ratings ON movies.id = ratings.movie_id
WHERE ratings.rating = NULL -- 19 --
SELECT movies.title,
  ratings.movie_id,
  AVG(ratings.rating)
FROM movies
  LEFT JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.id = 10 -- 20 --
SELECT movies.title,
  ratings.movie_id,
  COUNT(ratings.rating)
FROM movies
  LEFT JOIN ratings ON movies.id = ratings.movie_id
WHERE movies.id = 12 -- 21 --
SELECT title,
  genres
FROM movies
WHERE genres LIKE "%horror" -- 22 --
SELECT user_id,
  AVG(rating)
FROM ratings
WHERE user_id = 21 -- 23 --
SELECT user_id,
  COUNT(rating)
FROM ratings
GROUP BY user_id
ORDER BY COUNT(rating) DESC
LIMIT 1 -- 24 --
SELECT user_id,
  AVG(rating)
FROM ratings
GROUP BY user_id
ORDER BY AVG(rating) DESC
LIMIT 1 -- 25 --
SELECT user_id,
  AVG(rating),
  COUNT(rating)
FROM ratings
GROUP BY user_id
HAVING COUNT(rating) > 50
ORDER BY AVG(rating) DESC -- 26 --SELECT  movies.title, ratings.movie_id, AVG(ratings.rating)
FROM movies
  LEFT JOIN ratings ON movies.id = ratings.movie_id
GROUP BY movies.id
HAVING(ratings.rating) > 4