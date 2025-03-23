WITH pronic_root AS (
  SELECT n,
         -- calculate the integer square root of n
         cast(floor(sqrt(n)) as bigint) as root
  FROM pronic
)

SELECT n,
       -- if the nearest pronic number is greater than n, take the next smaller pronic number
       CASE
         WHEN (root * (root + 1)) < n
           THEN (root * (root + 1))
         ELSE (root * (root - 1))
       END as res
FROM pronic_root;
