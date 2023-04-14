WITH cte AS (
  SELECT CASE
          WHEN (clan = '') THEN '[no clan specified]'
          ELSE clan
         END AS clan
  ,SUM(points) AS total_points
  ,COUNT(name) AS total_people FROM people
GROUP BY clan
)

SELECT RANK() OVER (ORDER BY total_points DESC) AS rank 
  ,clan
  ,total_points
  ,total_people
FROM cte ORDER BY total_points DESC
