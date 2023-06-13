--Self join

1.How many stops are in the database. 資料庫中有多少停靠點。
SELECT COUNT(id) FROM stops

2.Find the id value for the stop 'Craiglockhart' 查找停靠點「克雷格洛克哈特」的id值
SELECT id FROM stops
WHERE name = 'Craiglockhart'

3.Give the id and the name for the stops on the '4' 'LRT' service. 提供「4」「輕軌」服務網站的ID和名稱。
SELECT id, name FROM stops, route 
WHERE id = stop AND num = '4' AND company = 'LRT' 

4.
The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
Run the query and notice the two services that link these stops have a count of 2.
Add a HAVING clause to restrict the output to these two routes.
顯示的查詢給出了訪問倫敦路 （149） 或克雷格洛克哈特 （53） 的路線數量。運行查詢並注意連結這些停靠點的兩個服務的計數為 2。添加 HAVING 子句以將輸出限制為這兩個路由。
SELECT company, num, COUNT(*)
    FROM route
   WHERE stop = 149 OR stop = 53
GROUP BY company, num
  HAVING COUNT(*) = 2

5.執行顯示的自連接，並觀察 b.stop 提供了您可以從克雷格洛克哈特到達的所有地方，而無需更改路線。
更改查詢，使其顯示從克雷格洛克哈特到倫敦路的服務。
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = '149'

6.顯示的查詢與前一個查詢類似，但是通過連接停靠點表的兩個副本，我們可以按名稱而不是數位引用停靠點。
更改查詢，以便顯示「Craiglockhart」和「London Road」之間的服務。
如果您厭倦了這些地方，請嘗試“Fairmilehead”而不是“Tollcross”
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road'

7.列出連接115號和137號網站的所有服務（「乾草市場」和「利斯」）
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name = 'Leith'
GROUP BY a.num,a.company

8.列出連接「克雷格洛克哈特」和「收費交叉路口」站的服務
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'Tollcross'
GROUP BY a.num,a.company

9.給出一個明確的網站清單，列出乘坐一輛公共汽車可以從「克雷格洛克哈特」到達的網站，包括輕軌公司提供的「克雷格洛克哈特」本身。
包括相關服務的公司和巴士號碼
SELECT DISTINCT s2.name,
       r2.company,
       r2.num
  FROM stops AS s1,
       stops AS s2,
       route AS r1,
       route AS r2
 WHERE s1.name = 'Craiglockhart'
       AND r1.num = r2.num
       AND r1.company = r2.company
       AND s1.id = r1.stop
       AND s2.id = r2.stop;
       
--太難了我直接看網路上的 https://zhuanlan.zhihu.com/p/112026744
10.
尋找包含兩輛巴士的路線，這些巴士可以從 克雷格洛克哈特 到 洛亨德 。
顯示第一輛巴士的巴士號和公司，換乘的網站名稱，
以及第二輛巴士的巴士號和公司。
自行加入兩次，找到前往克雷格洛克哈特和洛亨德的巴士，然後在匹配的網站加入。
SELECT DISTINCT r1.num,
       r1.company,
       s2.name,
       sec.num,
       sec.company
  FROM route AS r1
  JOIN route AS r2
    ON r1.company = r2.company
       AND r1.num = r2.num
  JOIN stops AS s1
    ON r1.stop = s1.id
  JOIN stops AS s2
    ON r2.stop = s2.id
  JOIN (SELECT DISTINCT s11.name,
               r11.num,
               r11.company
          FROM route AS r11
          JOIN route AS r22
            ON r11.company = r22.company
               AND r11.num = r22.num
          JOIN stops AS s11
            ON r11.stop = s11.id
          JOIN stops AS s22
            ON r22.stop = s22.id
         WHERE s22.name = 'Lochend') AS sec
    ON s2.name = sec.name
 WHERE s1.name = 'Craiglockhart';

--Self join Quiz
SELF JOIN quiz

stops	route
id	num
name	company
pos
stop
1. Select the code that would show it is possible to get from Craiglockhart to Haymarket
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

2. Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

3. Select the code that shows the services available from Tollcross?
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'











