SELECT COUNT(id) FROM stops

SELECT id FROM stops
WHERE name = 'Craiglockhart'

SELECT id,name FROM stops JOIN route ON stops.id = route.stop
WHERE num = 4 AND company = 'LRT'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)>1

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

SELECT DISTINCT R1.company,R1.num FROM route R1, route R2

  WHERE R1.stop=115 AND R2.stop=137 AND R1.num=R2.num AND R1.company=R2.company

SELECT DISTINCT R1.company,R1.num FROM 
route R1 JOIN route R2 ON
(R1.company=R2.company AND R1.num=R2.num)
JOIN stops s1 ON (R1.stop=s1.id)
JOIN stops s2 ON (R2.stop=s2.id)
  WHERE s1.name='Craiglockhart' AND s2.name='Tollcross'

SELECT DISTINCT bstop.name, a.company, a.num FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
	WHERE astop.name = 'Craiglockhart'

SELECT a.num, a.company, bstop.name, c.num, c.company FROM
	route AS a JOIN route AS b ON (a.company = b.company AND a.num = b.num)
			   JOIN route AS c ON (b.stop = c.stop)
			   JOIN route AS d ON (c.company = d.company AND c.num = d.num)
			   JOIN stops AS astop ON (a.stop = astop.id)
			   JOIN stops AS bstop ON (b.stop = bstop.id)
			   JOIN stops AS cstop ON (c.stop = cstop.id)
			   JOIN stops AS dstop ON (d.stop = dstop.id)
	WHERE astop.name = 'Craiglockhart' AND dstop.name = 'Sighthill' AND bstop.id = cstop.id 