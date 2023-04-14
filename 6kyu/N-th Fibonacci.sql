-- passes the test
-- but submit gives error -> integer out of range
WITH RECURSIVE cteFibo AS (
  SELECT
         CAST(0 AS INT) AS res
        ,CAST(1 AS INT) AS res2
        ,n
  FROM fibo where n = 1
  UNION ALL
  SELECT res2
        ,res2+res
        ,n+1
  FROM cteFibo
  WHERE n < (SELECT MAX(n) FROM fibo)
)
  
SELECT n, res FROM cteFibo
ORDER BY n ASC;

-- alternative with formula:
-- 1/SQRT(5)*(((1+SQRT(5))/2)^n-((1-SQRT(5))/2)^n)
