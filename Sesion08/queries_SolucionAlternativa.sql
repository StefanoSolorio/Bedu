-- Crear la tabla
CREATE TABLE 'countrydata1' (
  'id' int NOT NULL AUTO_INCREMENT,
  'Country' varchar(50) NOT NULL,
  'Cases' int NOT NULL,
  'Deaths' int NOT NULL,
  'Update_Time' datetime NOT NULL,
  PRIMARY KEY ('id')
)

-- Crear la vista a consultar
CREATE VIEW MostRecent AS 
SELECT h.Country AS "Country", MAX(h.Cases) AS "Cases", MAX(h.Deaths) AS "Deaths"
FROM countrydata1 h
INNER JOIN (
    SELECT Country, MAX(Update_Time) AS MaxUpdate_Time
    FROM countrydata1
    GROUP BY Country
) AS latest 
ON h.Country = latest.Country AND h.Update_Time = latest.MaxUpdate_Time
GROUP BY h.Country;

-- ¿Cuál fue el país con mayor número de muertes?
SELECT Country, Deaths
FROM MostRecent
WHERE Deaths = (
    SELECT MAX(Deaths)
    FROM MostRecent
);

-- ¿Cuál fue el país con menor número de muertes?
SELECT Country, Deaths
FROM MostRecent
WHERE Deaths = (
    SELECT MIN(Deaths)
    FROM MostRecent
);

-- ¿Cuál fue el país con el mayor número de casos?
SELECT Country, Cases
FROM MostRecent
WHERE Cases = (
    SELECT MAX(Cases)
    FROM MostRecent
);

-- ¿Cuál fue el país con el menor número de casos?
SELECT Country, Cases
FROM MostRecent
WHERE Cases = (
    SELECT Min(Cases)
    FROM MostRecent
);

-- ¿Cuál fue el número de muertes promedio?
SELECT AVG(Deaths) AS "Promedio Muertes"
FROM MostRecent;

-- ¿Cuál fue el número de casos promedio?
SELECT AVG(Cases) AS "Promedio de Casos"
FROM MostRecent;

-- Top 5 de países con más muertes.
SELECT Country, Deaths
FROM MostRecent 
ORDER BY Deaths DESC
LIMIT 5;

-- Top 5 de países con menos muertes.
SELECT Country, Deaths
FROM MostRecent 
ORDER BY Deaths ASC
LIMIT 5;
