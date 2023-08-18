SELECT STR_TO_DATE(Date,  '%m/%d/%Y') as date1
FROM countrydata1
GROUP BY date1;

/*¿Cuál fue el país con mayor número de muertes?*/
SELECT DISTINCT Country, Deaths, Date
FROM countrydata1
WHERE Date = "7/6/2009"
ORDER BY Deaths DESC
LIMIT 1;


/*Cuál fue el país con menor número de muertes?*/
SELECT Country, Deaths
FROM countrydata1
WHERE Date = "7/6/2009" AND Deaths = 0
ORDER BY Deaths ASC;


/*¿Cuál fue el país con el mayor número de casos?*/
SELECT DISTINCT Country, Cases, Date
FROM countrydata1
WHERE Date = "7/6/2009"
ORDER BY Cases DESC
LIMIT 1;

/*¿Cuál fue el país con el menor número de casos?*/
SELECT DISTINCT Country, Cases, Date
FROM countrydata1
WHERE Date = "7/6/2009" AND Cases = 1;

/*¿Cuál fue el número de muertes promedio?*/
SELECT Country, AVG(Deaths) as promedio
FROM countrydata1
GROUP BY Country
ORDER BY promedio DESC;

/*¿Cuál fue el número de muertes promedio?*/
SELECT AVG(Deaths) as promedio_global
FROM countrydata1;

/*¿Cuál fue el número de casos promedio?*/
SELECT AVG(Cases) as promedio_global
FROM countrydata1;


/*Top 5 de países con más muertes.*/
SELECT DISTINCT Country, Deaths, Date
FROM countrydata1
WHERE Date = "7/6/2009"
ORDER BY Deaths DESC
LIMIT 5;


/*Top 5 de países con menos muertes*/
SELECT Country, Deaths, Cases
FROM countrydata1
WHERE Date = "7/6/2009" AND Deaths = 0
ORDER BY Deaths ASC, Cases ASC
LIMIT 5;