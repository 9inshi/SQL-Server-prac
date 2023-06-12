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








































