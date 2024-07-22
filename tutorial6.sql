-- JOIN

1. SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

2. SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

3. SELECT go.player, go.teamid, ga.stadium, ga.mdate
FROM game AS ga 
JOIN goal AS go 
ON (ga.id=go.matchid)
WHERE go.teamid = 'GER'

4. SELECT ga.team1, ga.team2 , go.player
FROM game AS ga
JOIN goal AS go 
ON ga.id=go.matchid
WHERE player LIKE 'Mario%'

5.SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal
JOIN eteam
ON goal.teamid = eteam.id 
WHERE goal.gtime<=10

6. SELECT mdate, teamname FROM game 
JOIN eteam
ON team1 = eteam.id
WHERE coach = "Fernando Santos"

7. SELECT player FROM goal
JOIN game
ON goal.matchid = game.id
WHERE stadium = 'National Stadium, Warsaw'

8.SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid != 'GER'

9.SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

10.SELECT stadium, COUNT(stadium)
  FROM game JOIN goal ON id=matchid
 GROUP BY stadium

11. SELECT matchid,mdate, COUNT(gtime)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid

12. SELECT matchid,mdate, COUNT(gtime)
  FROM game JOIN goal ON matchid = id 
 WHERE teamid = 'GER' 
GROUP BY matchid

13. SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY 
  mdate, matchid
  ORDER BY mdate, matchid, team1, team2

  /* 
  1.  game  JOIN goal ON (id=matchid)

  2. matchid, teamid, player, gtime, id, teamname, coach

  3. SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

 4. DEN	9 June 2012
GER	9 June 2012

5.    SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

6. SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

7. Netherlands	2
Poland	2
Republic of Ireland	1
Ukraine	2

  */