--Using Null

1.列出學系department是NULL值的老師。
為何不能用 =
你可能會以為 dept=NULL 是可行的，但它不是。你要使用dept IS NULL
SELECT name FROM teacher 
WHERE dept IS NULL

2.注意INNER JOIN 不理會沒有學系的老師及沒有老師的學系。
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3.使用不同的JOIN(外連接)，來列出全部老師。 --左連接 left join
SELECT t.name, d.name FROM teacher AS t
LEFT JOIN dept AS d ON t.dept = d.id;

4.使用不同的JOIN(外連接)，來列出全部學系。  --右連接 right join
 SELECT t.name,d.name FROM teacher AS t
RIGHT JOIN dept AS d ON t.dept = d.id;

5.Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given.
Show teacher name and mobile number or '07986 444 2266'
SELECT name, mobile = COALESCE(mobile,'07986 444 2266') FROM teacher 

6.Use the COALESCE function and a LEFT JOIN to print the teacher name and department name.
Use the string 'None' where there is no department.
SELECT t.name, dept = COALESCE(d.name,'None') FROM teacher AS t
LEFT JOIN dept AS d ON t.dept = d.id

7.使用COUNT來數算老師和流動電話數目。
SELECT COUNT(t.name), COUNT(t.mobile) FROM teacher AS t
LEFT JOIN dept AS d ON t.dept = d.id

8.使用COUNT 和 GROUP BY dept.name來顯示每一學系的老師數目。 使用 RIGHT JOIN 以確保工程系Engineering 是在當
SELECT d.name, COUNT(t.name) FROM teacher AS t
RIGHT JOIN dept AS d ON t.dept = d.id
  GROUP BY d.name;

9.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT name, CASE WHEN dept = '1' OR dept = '2' THEN 'Sci'
                  ELSE 'Art'
                  END
      FROM teacher

10.Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, 
show 'Art' if the teacher's  dept is 3 and 'None' otherwise. '

SELECT name,
CASE WHEN dept = '1' OR dept = '2' THEN 'Sci'
     WHEN dept = '3' THEN 'Art'
ELSE 'None'
END
FROM teacher



--Using Null Quiz
1. Select the code which uses an outer join correctly.
SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

2. Select the correct statement that shows the name of department which employs Cutflower -
SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

3. Select out of following the code which uses a JOIN to show a list of all the departments and number of employed teachers
 SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

4. Using SELECT name, dept, COALESCE(dept, 0) AS result FROM teacher on teacher table will:
display 0 in result column for all teachers without department

5. Query:
SELECT name,
       CASE WHEN phone = 2752 THEN 'two'
            WHEN phone = 2753 THEN 'three'
            WHEN phone = 2754 THEN 'four'
            END AS digit
  FROM teacher
shows following 'digit':
'four' for Throd

6. Select the result that would be obtained from the following code:
 SELECT name, 
      CASE 
       WHEN dept 
        IN (1) 
        THEN 'Computing' 
       ELSE 'Other' 
      END 
  FROM teacher
Table-A
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other












































