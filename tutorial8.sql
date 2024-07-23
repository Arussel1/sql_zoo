-- USING NULL
/* Note: As the time doing, PostgreSQL doesnt have teacher database, you can check with "SELECT table_schema, table_name 
FROM information_schema.tables 
WHERE table_schema NOT IN ('information_schema', 'pg_catalog');", which show all schema. Therefore, switch to MYSQL instead */

1. SELECT name FROM teacher
WHERE dept IS NULL;

2. SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

3. SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

4. SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

5.SELECT name,COALESCE(mobile,'07986 444 2266' ) FROM teacher

6. SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher LEFT JOIN dept ON dept = dept.id

7. SELECT COUNT(name), COUNT(mobile) FROM teacher

8. SELECT dept.name, COUNT(teacher.name) AS count FROM teacher RIGHT JOIN dept ON dept = dept.id GROUP BY dept ORDER BY count DESC

9. SELECT name,
CASE WHEN dept IN (1,2) THEN 'Sci'
     ELSE 'Art'
     END
FROM teacher

10.SELECT name,
CASE WHEN dept IN (1,2) THEN 'Sci'
     WHEN dept = 3 THEN 'Art'
     ELSE 'None'
     END
FROM teacher

/* Quiz

1. SELECT teacher.name, dept.name FROM teacher LEFT OUTER JOIN dept ON (teacher.dept = dept.id)

2. SELECT dept.name FROM teacher JOIN dept ON (dept.id = teacher.dept) WHERE teacher.name = 'Cutflower'

3. SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

4.  SELECT dept.name, COUNT(teacher.name) FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept GROUP BY dept.name

5. 'four' for Throd

6. Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	Other
Cutflower	Other
Deadyawn	Other

*/