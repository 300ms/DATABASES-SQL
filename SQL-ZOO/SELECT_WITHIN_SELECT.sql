SELECT name FROM world
  WHERE population >
    (SELECT population FROM world
      WHERE name='Russia')

SELECT name
  FROM world
    WHERE (gdp / population) > 
      (SELECT gdp / population FROM world WHERE name = 'United Kingdom')
      AND continent = 'Europe'

SELECT name, continent FROM world
  WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))
    ORDER BY name

SELECT name, population
  FROM world
    WHERE population >
      (SELECT population FROM world WHERE name = 'Canada')
      AND population <
      (SELECT population FROM world WHERE name = 'Poland')

SELECT name, CONCAT(ROUND(population / (SELECT population FROM world WHERE name = 'Germany') * 100, 0), '%')
  FROM world
    WHERE continent = 'Europe'

SELECT name
  FROM world
    WHERE gdp >
      (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')

SELECT continent, name, area
  FROM world
    WHERE area IN (SELECT MAX(area) FROM world GROUP BY continent)

SELECT continent, name
  FROM world
    WHERE name IN (SELECT MIN(name) FROM world GROUP BY continent)

SELECT name, continent, population FROM world
  WHERE continent NOT IN (SELECT DISTINCT continent FROM world WHERE population > 25000000)

SELECT name, continent FROM world current WHERE population >
  ALL (SELECT population * 3 FROM world WHERE continent = current.continent AND name <> current.name)