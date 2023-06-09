--More JOIN operations

1.列出1962年首影的電影， [顯示 id, title]
SELECT  id, title
 FROM movie
 WHERE yr=1962

2.電影大國民 'Citizen Kane' 的首影年份。
SELECT  yr
 FROM movie
 WHERE title = 'Citizen Kane'

3.列出全部Star Trek星空奇遇記系列的電影，包括id, title 和 yr(此系統電影都以Star Trek為電影名稱的開首)。按年份順序排列。
SELECT id, title, yr
 FROM movie
 WHERE title LIKE '%Star%Trek%'

4.id是 11768, 11955, 21191 的電影是什麼名稱?
SELECT id, title
 FROM movie
 WHERE id IN ('11768','11955','21191')

5.女演員'Glenn Close'的編號 id是什麼?
SELECT id FROM actor
 WHERE name = 'Glenn Close'

6.電影北非諜影'Casablanca' 的編號 id是什麼?
SELECT id FROM movie
 WHERE title = 'Casablanca'

7.
列出電影北非諜影 'Casablanca'的演員名單。什麼是演員名單?
使用 movieid=11768, 這是你上一題得到的結果。



movie電影(id編號, title電影名稱, yr首影年份, director導演, budget製作費, gross票房收入)
actor演員(id編號, name姓名)
casting角色(movieid電影編號, actorid演員編號, ord角色次序)
--最上層是actor表，因為要找的是演員名，然後join另外兩個表
SELECT a.name FROM actor AS a
JOIN casting AS c 
ON c.actorid = a.id
JOIN movie AS m
ON m.id = c.movieid
WHERE m.title = 'Casablanca';
---拆開的邏輯:
SELECT id FROM movie m
WHERE title = 'Casablanca'

SELECT actorid FROM casting 
WHERE movieid = '27'

SELECT name FROM casting 
WHERE id = actorid 
-----

8.顯示電影異型'Alien' 的演員清單。
SELECT a.name FROM actor AS a
JOIN casting AS c 
ON c.actorid = a.id
JOIN movie AS m
ON m.id = c.movieid
WHERE m.title = 'Alien';

9.列出演員夏里遜福 'Harrison Ford' 曾演出的電影。
SELECT m.title FROM movie AS m
JOIN casting AS c 
ON c.movieid = m.id
JOIN actor AS a
ON a.id = c.actorid
WHERE a.name = 'Harrison Ford';

10.列出演員夏里遜福 'Harrison Ford' 曾演出的電影，但他不是第1主角。
SELECT m.title FROM movie AS m
JOIN casting AS c 
ON c.movieid = m.id
JOIN actor AS a
ON a.id = c.actorid
WHERE a.name = 'Harrison Ford' AND c.ord != '1';

11.列出1962年首影的電影及它的第1主角。
SELECT m.title, a.name FROM movie AS m
JOIN casting AS c 
ON c.movieid = m.id
JOIN actor AS a
ON a.id = c.actorid
WHERE c.ord = '1' AND m.yr = '1962';

12.尊·特拉華達'John Travolta'最忙是哪一年? 顯示年份和該年的電影數目。
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)

13.
列出演員茱莉·安德絲'Julie Andrews'曾參與的電影名稱及其第1主角。
是否列了電影 "Little Miss Marker"兩次?
她於1980再參與此電影Little Miss Marker. 原作於1934年,她也有參與。 電影名稱不是獨一的。在子查詢中使用電影編號。
--
SELECT m.title, a.name FROM casting AS c
JOIN movie AS m
ON m.id = c.movieid
JOIN actor AS a
ON a.id = c.actorid
/*上半部5句建總表，下半部找出'Julie Andrews'有演的movie的id*/
WHERE m.id IN (SELECT c.movieid FROM casting AS c
               JOIN actor AS a
               ON a.id = c.actorid
               WHERE a.name='Julie Andrews')
AND c.ord = '1'
/*最後這句找第一主角*/

14.列出按字母順序，列出哪一演員曾作30次第1主角。
SELECT a.name FROM casting AS c
JOIN movie AS m
ON m.id = c.movieid
JOIN actor AS a
ON a.id = c.actorid
WHERE m.id IN (SELECT c.movieid FROM casting AS c
               JOIN actor AS a
               ON a.id = c.actorid
               WHERE c.ord = '1')
/*重點在下面這句，計算group by*/
GROUP BY a.name
HAVING COUNT(ord) >= 30

15.列出1978年首影的電影名稱及角色數目，按此數目由多至少排列。
SELECT m.title, COUNT(c.actorid) FROM casting AS c
JOIN movie AS m
ON m.id = c.movieid
JOIN actor AS a
ON a.id = c.actorid
WHERE m.id IN (SELECT c.movieid FROM casting AS c
               JOIN actor AS a
               ON a.id = c.actorid
               WHERE m.yr = '1978')
GROUP BY m.title

16.列出曾與演員亞特·葛芬柯'Art Garfunkel'合作過的演員姓名。
SELECT DISTINCT a.name FROM actor AS a
JOIN casting AS c
ON a.id = c.actorid
WHERE c.movieid IN (SELECT c.movieid FROM casting AS c
               JOIN actor AS a
               ON c.actorid = a.id 
               WHERE a.name = 'Art Garfunkel')
AND a.name != 'Art Garfunkel'






