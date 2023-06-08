--The JOIN operation

1.第一個例子列出球員姓氏為'Bender'的入球數據。 * 表示列出表格的全部欄位，簡化了寫matchid, teamid, player, gtime語句。
修改此SQL以列出 賽事編號matchid 和球員名 player ,該球員代表德國隊Germany入球的。要找出德國隊球員，要檢查: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

2.由以上查詢，你可見Lars Bender''s 於賽事 1012入球。現在我們想知道此賽事的對賽隊伍是哪一隊。
留意在 goal 表格中的欄位 matchid ，是對應表格game的欄位id。我們可以在表格game中找出賽事1012的資料。
只顯示賽事1012的 id, stadium, team1, team2
SELECT id,stadium,team1,team2 FROM game
WHERE id = '1012'

3.
我們可以利用JOIN來同時進行以上兩個步驟。
SELECT *
  FROM game JOIN goal ON (id=matchid)
語句FROM 表示合拼兩個表格game 和 goal的數據。語句 ON 表示如何找出 game中每一列應該配對goal中的哪一列 -- goal的 id 必須配對game的 matchid 。 簡單來說，就是
ON (game.id=goal.matchid)
以下SQL列出每個入球的球員(來自goal表格)和場館名(來自game表格)
修改它來顯示每一個德國入球的球員名，隊伍名，場館和日期。
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'

4.
使用上題相同的 JOIN語句，
列出球員名字叫Mario (player LIKE 'Mario%')有入球的 隊伍1 team1, 隊伍2 team2 和 球員名 player
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
WHERE player LIKE '%Mario%'

5.
表格eteam 貯存了每一國家隊的資料，包括教練。你可以使用語句 goal JOIN eteam on teamid=id來合拼 JOIN 表格goal 到 表格eteam。
列出每場球賽中首10分鐘gtime<=10有入球的球員 player, 隊伍teamid, 教練coach, 入球時間gtime
SELECT player, teamid, coach, gtime 
  FROM eteam JOIN goal ON (id=teamid)
 WHERE gtime<=10

6.
要合拼JOIN 表格game 和表格 eteam，你可以使用 game JOIN eteam ON (team1=eteam.id) 或 game JOIN eteam ON (team2=eteam.id)
注意欄位id同時是表格game 和表格 eteam的欄位，你要清楚指出eteam.id而不是只用id
列出'Fernando Santos'作為隊伍1 team1 的教練的賽事日期，和隊伍名。
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1=eteam.id)
 WHERE coach = 'Fernando Santos'

7.列出場館 'National Stadium, Warsaw'的入球球員。
SELECT player
  FROM game JOIN goal ON (id=matchid)
 WHERE stadium = 'National Stadium, Warsaw'

8.
以下例子找出德國-希臘Germany-Greece 的八強賽事的入球
修改它，只列出全部賽事，射入德國龍門的球員名字。
HINT
找非德國球員的入球，德國可以在賽事中作team1 隊伍１（主）或team2隊伍２（客）。 你可以用teamid!='GER' 來防止列出德國球員。 你可以用DISTINCT來防止球員出現兩次以上。
SELECT DISTINCT player
 FROM game JOIN goal ON matchid = id 
    WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid != 'GER'

9.
列出隊伍名稱 teamname 和該隊入球總數
COUNT and GROUP BY 你應該在SELECT語句中使用COUNT(*)和使用 GROUP BY teamname

SELECT DISTINCT teamname, num=(SELECT COUNT(teamid) FROM goal b
WHERE b.teamid = a.id ) FROM eteam a 
ORDER BY teamname

--邏輯是 b. 數 每隊在入球表出現的次數，然後這時的id對應eteam的teamname
SELECT COUNT(teamid) FROM goal b
WHERE b.teamid = a.id 
--外層a 不重複德隊名 數量是b數的
SELECT DISTINCT teamname, num=(...b...) FROM eteam a

10.
列出場館名和在該場館的入球數字。
/* 失敗ㄉ
SELECT DISTINCT stadium, id, num=SUM((SELECT COUNT(matchid) FROM goal b WHERE b.matchid= a.id )) FROM game a
ORDER BY stadium
*/
 SELECT b.stadium,
           COUNT(a.player)
      FROM goal AS a
INNER JOIN game AS b
        ON a.matchid = b.id
  GROUP BY b.stadium;

11.每一場波蘭'POL'有參與的賽事中，列出賽事編號 matchid, 日期date 和入球數字。





12.每一場德國'GER'有參與的賽事中，列出賽事編號 matchid, 日期date 和德國的入球數字。





13.
List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
mdate	team1	score1	team2	score2
1 July 2012	ESP	4	ITA	0
10 June 2012	ESP	1	ITA	1
10 June 2012	IRL	1	CRO	3
...
Notice in the query given every goal is listed. If it was a team1 goal then a 1 appears in score1, otherwise there is a 0. You could SUM this column to get a count of the goals scored by team1. Sort your result by mdate, matchid, team1 and team2.


