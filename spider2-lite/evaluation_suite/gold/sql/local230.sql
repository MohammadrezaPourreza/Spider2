WITH top_genre AS (
  SELECT 
    g.genre, 
    COUNT(g.movie_id) AS movie_count
  FROM 
    genre AS g
  INNER JOIN 
    ratings AS r ON g.movie_id = r.movie_id
  WHERE 
    avg_rating > 8
  GROUP BY 
    genre
  ORDER BY 
    movie_count DESC
  LIMIT 3
),
top_director AS (
  SELECT 
    n.name AS director_name,
    COUNT(g.movie_id) AS movie_count
  FROM 
    names AS n 
  INNER JOIN 
    director_mapping AS dm ON n.id = dm.name_id 
  INNER JOIN 
    genre AS g ON dm.movie_id = g.movie_id 
  INNER JOIN 
    ratings AS r ON r.movie_id = g.movie_id,
    top_genre
  WHERE 
    g.genre IN (top_genre.genre) 
    AND avg_rating > 8
  GROUP BY 
    director_name
  ORDER BY 
    movie_count DESC
)
SELECT 
  *
FROM 
  top_director
LIMIT 
  3;
