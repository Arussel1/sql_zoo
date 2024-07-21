-- SELECT from Nobel
1. SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

2. SELECT winner
  FROM nobel
 WHERE yr = 1962 
   AND subject = 'literature'

3. SELECT yr, subject FROM nobel
WHERE winner='Albert Einstein'

4. SELECT winner FROM nobel
WHERE subject = 'peace' AND yr >= 2000

5. SELECT yr, subject, winner FROM nobel
WHERE subject = 'literature ' AND yr BETWEEN 1980 AND 1989;

6. SELECT * FROM nobel
WHERE  winner IN ('Theodore Roosevelt',
                  'Thomas Woodrow Wilson',
                  'Jimmy Carter', 
                  'Barack Obama')

7. SELECT winner FROM nobel
 WHERE  winner LIKE 'John%'

8. SELECT * FROM nobel
 WHERE  (yr = 1980 AND subject = 'physics') OR ( yr = 1984 AND subject = 'chemistry' )

9. SELECT * FROM nobel
 WHERE  yr = 1980 AND subject NOT IN ( 'chemistry', 'medicine' )

10. SELECT * FROM nobel
 WHERE  (yr < 1910 AND subject = 'Medicine') OR ( yr >= 2004 AND subject = 'Literature' )

11. SELECT * FROM nobel
 WHERE winner = 'PETER GRÜNBERG';

12. SELECT * FROM nobel
 WHERE winner = 'EUGENE O\'NEILL';

13. SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

14. SELECT winner, subject
FROM nobel
WHERE yr = 1984
ORDER BY (subject IN ('chemistry', 'physics')), subject, winner;

/* Quiz
1.SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

2. SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

3.SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

4.Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

5. SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT subject
                 FROM nobel
                WHERE subject IN ('Chemistry','Physics'))

6.SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

7.Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1 */