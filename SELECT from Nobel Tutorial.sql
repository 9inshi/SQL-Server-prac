--SELECT from Nobel Tutorial

1.更改查詢以顯示1950年諾貝爾獎的獎項資料
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 
 2.顯示誰贏得了1962年文學獎(Literature)。
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
 
 3.
顯示“愛因斯坦”('Albert Einstein') 的獲獎年份和獎項。
 SELECT yr, subject
  FROM nobel
 WHERE winner = 'Albert Einstein'

 4.
顯示2000年及以後的和平獎(‘Peace’)得獎者。
 SELECT winner
  FROM nobel
 WHERE yr >= 2000 AND subject = 'Peace'
 
 5.
顯示1980年至1989年(包含首尾)的文學獎(Literature)獲獎者所有細節（年，主題，獲獎者）。
 SELECT yr, subject, winner
  FROM nobel
 WHERE yr >= 1980 AND yr<=1989 AND subject = 'Literature'
 
 6.
顯示總統獲勝者的所有細節：
-西奧多•羅斯福 Theodore Roosevelt
-伍德羅•威爾遜 Woodrow Wilson
-吉米•卡特 Jimmy Carter
 SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter')
 
 7.
顯示名字為John 的得獎者。 (注意:外國人名字(First name)在前，姓氏(Last name)在後)
 SELECT winner FROM nobel
 WHERE winner LIKE 'John%'
 
 8.
顯示1980年物理學(physics)獲獎者，及1984年化學獎(chemistry)獲得者。
 SELECT * FROM nobel
 WHERE (yr = 1980 AND subject = 'physics') OR (yr = 1984 AND subject = 'chemistry')
 
 9.
查看1980年獲獎者，但不包括化學獎(Chemistry)和醫學獎(Medicine)。
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
