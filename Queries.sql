\connect OurWorldInData-1510627-1210921; 

-- Query 1 
SELECT id, date, new_cases, new_cases_smoothed,
       ROUND(AVG(new_cases) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),4 )AS new_cases_7day_avg,
       CASE WHEN new_cases = new_cases_smoothed THEN 'Igual' ELSE 'Distintos' END AS es_igual
FROM Casos
ORDER BY(id) ASC;

/* Query 2 */
/* 
    Como no existen instancias que contengan exactamente  a la mitad
    de los casos totales para un pais, obtamos por obtener la fecha
    con el valor mas cercado a la mitad. Este valor es el siguiente
    superior a la mitad.
*/
SELECT C.iso_code,C.total_cases as total_mas_cercano_al_max ,C.date FROM Casos C, 
(WITH max_value AS (
    SELECT iso_code, MAX(total_cases) AS max_total_cases
    FROM Casos
    GROUP BY iso_code
), min_date_value AS (
    SELECT c.iso_code,MIN(c.date) AS min_date
    FROM Casos c , max_value
    WHERE c.total_cases >= max_value.max_total_cases / 2   AND c.iso_code = max_value.iso_code GROUP BY c.iso_code
) SELECT c.iso_code , c.date FROM Casos c , min_date_value WHERE c.iso_code = min_date_value.iso_code AND c.date = min_date_value.min_date) AS MQ
WHERE C.iso_code = MQ.iso_code AND C.date = MQ.date ORDER BY C.iso_code;


-- Query 3 ---

SELECT v.iso_code,
       MAX(CASE WHEN v.total_vaccinations_per_hundred >= 66.666 THEN m.total_deaths END) as muerte_promedio_despues,
       COALESCE(AVG(CASE WHEN v.total_vaccinations_per_hundred < 66.666 THEN m.total_deaths END), 0) as muerte_promedio_antes,
       MIN(CASE WHEN v.total_vaccinations_per_hundred >= 66.666 THEN v.date END) as fecha_alcanzo_vacunacion
FROM Vacunas v
JOIN Muertes m ON v.id = m.id AND v.iso_code = m.iso_code AND v.date = m.date
GROUP BY v.iso_code
HAVING MAX(v.total_vaccinations_per_hundred) >= 66.666;


-- Query 5
SELECT p.continent,
       SUM(c.new_cases_per_million) / SUM(d.population) AS tasa_crecimiento_per_capita
FROM Pais p
JOIN Casos c ON p.id = c.id AND p.iso_code = c.iso_code
JOIN DatosGenerales d ON p.id = d.id AND p.iso_code = d.iso_code
WHERE p.continent IS NOT NULL
GROUP BY p.continent
ORDER BY tasa_crecimiento_per_capita DESC;

