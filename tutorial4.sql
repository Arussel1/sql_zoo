-- SELECT within SELECT

1. SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

2. SELECT name FROM world
WHERE gdp/population > (SELECT gdp/population FROM world WHERE name='United Kingdom') AND continent='Europe';

3. SELECT name, continent FROM world
WHERE continent IN (SELECT DISTINCT continent FROM world WHERE name IN ('Argentina ','Australia'));

4. SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name='United Kingdom') AND population < (SELECT population FROM world WHERE name='Germany');

5. SELECT name, 
       CONCAT( ROUND(population/(SELECT population FROM world WHERE name='Germany' ) * 100,0), '%') AS percentage
FROM world 
WHERE continent = 'Europe'

6.SELECT name FROM world
WHERE gdp IS NOT NULL AND gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')

7. SELECT continent, name, area FROM world x
  WHERE area>= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

8. SELECT continent, name FROM world 
GROUP BY continent
ORDER BY name LIMIT 6

9. world
WHERE continent IN (SELECT continent FROM world GROUP BY continent HAVING MAX(population) <= 25000000)

10. SELECT w1.name, w1.continent 
FROM world AS w1
WHERE w1.population/3 > ALL (
    SELECT w2.population 
    FROM world AS w2 
    WHERE w2.continent = w1.continent 
      AND w2.name != w1.name
);

/*
1.  SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

2. SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

3. SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

4. France
Germany
Russia
Turkey

5. SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

6.  SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

7.Bangladesh
India
Pakistan

*/