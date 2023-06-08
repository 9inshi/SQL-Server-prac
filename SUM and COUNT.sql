--SUM and COUNT

1.展示世界的總人口。
SELECT SUM(population) FROM world
--炸掉了,error

2.列出所有的洲, 每個只有一次。
SELECT DISTINCT continent FROM world 
 
3.找出非洲(Africa)的GDP總和。
SELECT SUM(gdp) FROM world
WHERE continent = 'Africa' 

4.有多少個國家具有至少百萬(1000000)的面積。
SELECT COUNT(name) FROM world
WHERE area > 1000000  

5.('France','Germany','Spain')（“法國”，“德國”，“西班牙”）的總人口是多少？
SELECT SUM(population) FROM world
WHERE name IN('France','Germany','Spain')

6.對於每一個洲份，顯示洲份和國家的數量。
SELECT DISTINCT continent , COUNT(name) FROM world
GROUP BY continent

7.對於每一個洲份，顯示洲份和至少有1000萬人(10,000,000)口國家的數目。
SELECT DISTINCT continent , COUNT(name) FROM world
WHERE population > 10000000
GROUP BY continent

8.列出有至少100百萬(1億)(100,000,000)人口的洲份。
SELECT continent
  FROM world
  GROUP BY continent
  HAVING SUM(population)>=100000000
--掛掉跑不出


/*SUM and COUNT Quiz*/
1. Select the statement that shows the sum of population of all countries in 'Europe'
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

2. Select the statement that shows the number of countries with population smaller than 150000
 SELECT COUNT(name) FROM bbc WHERE population < 150000

3. Select the list of core SQL aggregate functions
AVG(), COUNT(), MAX(), MIN(), SUM()

4. Select the result that would be obtained from the following code:
 SELECT region, SUM(area)
   FROM bbc 
  WHERE SUM(area) > 15000000 
  GROUP BY region
  --
No result due to invalid use of the WHERE function

5. Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'
SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

6. Select the statement that shows the medium population density of each region
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

7. Select the statement that shows the name and population density of the country with the largest population
SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

8. Pick the result that would be obtained from the following code:
 SELECT region, SUM(area) 
   FROM bbc 
  GROUP BY region 
  HAVING SUM(area)<= 20000000
  ---
Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710









