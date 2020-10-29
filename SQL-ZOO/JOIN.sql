SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

SELECT id,stadium,team1,team2
  FROM game
    WHERE id = '1012'

SELECT player,teamid , stadium, mdate
  FROM game JOIN goal ON (id=matchid AND teamid='GER')

SELECT team1,team2,player
  FROM game JOIN goal ON (id=matchid AND player LIKE 'Mario%')

SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON (teamid=id AND gtime<=10)

SELECT mdate, teamname FROM game JOIN eteam ON (game.team1 = eteam.id) WHERE coach='Fernando Santos'

SELECT player FROM game JOIN goal ON (game.id= goal.matchid) WHERE stadium='National Stadium, Warsaw'

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid!='GER'

SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON eteam.id = goal.teamid
  GROUP BY teamname

SELECT stadium, COUNT(player)
  FROM game JOIN goal ON game.id = goal.matchid
  GROUP BY stadium

SELECT matchid,mdate, COUNT(player)
  FROM game JOIN goal ON game.id = goal.matchid
    WHERE (team1 = 'POL' OR team2 = 'POL')
    GROUP BY goal.matchid

SELECT matchid,mdate, COUNT(player)
  FROM game JOIN goal ON game.id = goal.matchid
    WHERE (team1 = 'GER' OR team2 = 'GER') AND (teamid = 'GER')
    GROUP BY goal.matchid

SELECT mdate,team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON game.id = goal.matchid
  GROUP BY game.id
  ORDER BY mdate, matchid, team1, team2