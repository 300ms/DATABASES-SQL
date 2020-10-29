SELECT SUM(population)
FROM world

SELECT DISTINCT continent FROM world

SELECT SUM(gdp) FROM world WHERE continent = 'Africa'

SELECT COUNT(name) FROM world WHERE area >= 1000000

SELECT SUM(population) FROM world WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

SELECT continent, COUNT(name) FROM world GROUP BY continent

SELECT continent, COUNT(name) FROM (SELECT * FROM world a WHERE population > 10000000) b GROUP BY continent

SELECT continent FROM (SELECT continent, SUM(population) total FROM world GROUP BY continent) x WHERE total > 100000000