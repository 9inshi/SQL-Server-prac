--The JOIN operation
1.第一個例子列出球員姓氏為'Bender'的入球數據。 * 表示列出表格的全部欄位，簡化了寫matchid, teamid, player, gtime語句。
修改此SQL以列出 賽事編號matchid 和球員名 player ,該球員代表德國隊Germany入球的。要找出德國隊球員，要檢查: teamid = 'GER'
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'















































