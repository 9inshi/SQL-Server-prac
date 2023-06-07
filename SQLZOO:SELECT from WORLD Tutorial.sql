--SQLZOO:SELECT from WORLD Tutorial

1.閱讀此表的注意事項 觀察運行一個簡單的SQL命令的結果。
SELECT name, continent, population FROM world

2.如何使用WHERE來篩選記錄。 顯示具有至少2億人口的國家名稱。 2億是200000000，有八個零。
SELECT name FROM world
WHERE population>200000000

3.找出有至少200百萬(2億)人口的國家名稱，及人均國內生產總值。
SELECT name ,gdp=gdp/population FROM world
WHERE population>200000000

4.顯示'South America'南美洲大陸的國家名字和以百萬為單位人口數。 將人口population 除以一百萬(1000000)得可得到以百萬為單位人口數。
SELECT name,population=population/1000000 FROM world
WHERE continent='South America' 

5.
顯示法國，德國，意大利(France, Germany, Italy)的國家名稱和人口。
SELECT name,population FROM world
WHERE name IN('France','Germany','Italy') 

6.顯示包含單詞“United”為名稱的國家。
SELECT name FROM world
WHERE name LIKE '%united%' 

7.成為大國的兩種方式：如果它有3百萬平方公里以上的面積，或擁有250百萬(2.5億)以上人口。
展示大國的名稱，人口和面積。
SELECT name, population, area FROM world
WHERE area>3000000 OR population>250000000

8.
美國、印度和中國(USA, India, China)是人口又大，同時面積又大的國家。排除這些國家。
顯示以人口或面積為大國的國家，但不能同時兩者。顯示國家名稱，人口和面積。
--意思是，人口和面積不可都達到大國標準。
SELECT name, population, area FROM world
WHERE (area>3000000 AND population<250000000) OR (area<3000000 AND population>250000000)

9.
除以為1000000（6個零）是以百萬計。除以1000000000（9個零）是以十億計。使用 ROUND 函數來顯示的數值到小數點後兩位。
對於南美顯示以百萬計人口，以十億計2位小數GDP。
百萬和十億，除以為1000000（6個零）是以百萬計。除以1000000000（9個零）是以十億計。
SELECT name, population/1000000, gdp/100000000 FROM world
WHERE continent = 'South America'

10.
顯示國家有至少一個萬億元國內生產總值（萬億，也就是12個零）的人均國內生產總值。四捨五入這個值到最接近1000。
顯示萬億元國家的人均國內生產總值，四捨五入到最近的$ 1000。
SELECT name,gdp=ROUND(gdp/population,-3) FROM world
WHERE gdp>1000000000000

11.
The CASE statement shown is used to substitute North America for Caribbean in the third column.
Show the name - but substitute Australasia for Oceania - for countries beginning with N.
SELECT name, 
       continent = CASE WHEN continent='oceania' THEN 'Australasia'
            ELSE continent END
  FROM world
 WHERE name LIKE 'N%'

12.
Show the name and the continent - but substitute Eurasia for Europe and Asia; 
substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B
SELECT name, 
       continent = CASE WHEN continent='Europe' THEN 'Eurasia'
                        WHEN continent='Asia' THEN 'Eurasia'
                        WHEN continent='North America' THEN 'America'
                        WHEN continent='South America' THEN 'America'
                        WHEN continent='Caribbean' THEN 'America'
            ELSE continent END
  FROM world
 WHERE name LIKE 'A%' OR name LIKE'B%'
 ---------精簡---------
 SELECT name, 
       continent = CASE WHEN continent IN('Europe','Asia') THEN 'Eurasia'
                        WHEN continent IN('North America','South America','Caribbean') THEN 'America'
            ELSE continent END
  FROM world
 WHERE name LIKE 'A%' OR name LIKE'B%'
 
13.
Put the continents right...
-Oceania becomes Australasia
-Countries in Eurasia and Turkey go to Europe/Asia
-Caribbean islands starting with 'B' go to North America, other Caribbean islands go to South America
Show the name, the original continent and the new continent of all countries.
SELECT name, continent,
        CASE WHEN continent='Oceania' THEN 'Australasia'
             WHEN continent IN('Eurasia','Turkey') THEN 'Europe/Asia'
             WHEN continent='Caribbean' AND name LIKE 'B%' THEN 'North America'
             WHEN continent='Caribbean'  THEN 'South  America'
            ELSE continent 
           END
FROM world


































