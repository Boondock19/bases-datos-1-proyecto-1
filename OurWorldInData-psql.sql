DROP TABLE IF EXISTS Temp_DatosCSV;
DROP TABLE IF EXISTS DatosCSV;
DROP TABLE IF EXISTS Date;
DROP TABLE IF EXISTS DatosGenerales;
DROP TABLE IF EXISTS Casos;
DROP TABLE IF EXISTS Test;
DROP TABLE IF EXISTS Vacunas;
DROP TABLE IF EXISTS Muertes;
DROP TABLE IF EXISTS Hospital_UCI;
DROP TABLE IF EXISTS ExcesoMortalidad;
DROP TABLE IF EXISTS Politica;
DROP TABLE IF EXISTS Produccion;
DROP TABLE IF EXISTS Pais;



CREATE TABLE DatosCSV (
  id SERIAL,
  iso_code VARCHAR(10) NOT NULL,
  continent VARCHAR(50),
  location VARCHAR(100) NOT NULL,
  date DATE NOT NULL,
  total_cases NUMERIC,
  new_cases NUMERIC,
  new_cases_smoothed NUMERIC,
  total_deaths NUMERIC,
  new_deaths NUMERIC,
  new_deaths_smoothed NUMERIC,
  total_cases_per_million NUMERIC,
  new_cases_per_million NUMERIC,
  new_cases_smoothed_per_million NUMERIC,
  total_deaths_per_million NUMERIC,
  new_deaths_per_million NUMERIC,
  new_deaths_smoothed_per_million NUMERIC,
  reproduction_rate NUMERIC,
  icu_patients NUMERIC,
  icu_patients_per_million NUMERIC,
  hosp_patients NUMERIC,
  hosp_patients_per_million NUMERIC,
  weekly_icu_admissions NUMERIC,
  weekly_icu_admissions_per_million NUMERIC,
  weekly_hosp_admissions NUMERIC,
  weekly_hosp_admissions_per_million NUMERIC,
  total_tests NUMERIC,
  new_tests NUMERIC,
  total_tests_per_thousand NUMERIC,
  new_tests_per_thousand NUMERIC,
  new_tests_smoothed NUMERIC,
  new_tests_smoothed_per_thousand NUMERIC,
  positive_rate NUMERIC,
  tests_per_case NUMERIC,
  tests_units VARCHAR(50),
  total_vaccinations NUMERIC,
  people_vaccinated NUMERIC,
  people_fully_vaccinated NUMERIC,
  total_boosters NUMERIC,
  new_vaccinations NUMERIC,
  new_vaccinations_smoothed NUMERIC,
  total_vaccinations_per_hundred NUMERIC,
  people_vaccinated_per_hundred NUMERIC,
  people_fully_vaccinated_per_hundred NUMERIC,
  total_boosters_per_hundred NUMERIC,
  new_vaccinations_smoothed_per_million NUMERIC,
  new_people_vaccinated_smoothed NUMERIC,
  new_people_vaccinated_smoothed_per_hundred NUMERIC,
  stringency_index NUMERIC,
  population_density NUMERIC,
  median_age NUMERIC,
  aged_65_older NUMERIC,
  aged_70_older NUMERIC,
  gdp_per_capita NUMERIC,
  extreme_poverty NUMERIC,
  cardiovasc_death_rate NUMERIC,
  diabetes_prevalence NUMERIC,
  female_smokers NUMERIC,
  male_smokers NUMERIC,
  handwashing_facilities NUMERIC,
  hospital_beds_per_thousand NUMERIC,
  life_expectancy NUMERIC,
  human_development_index NUMERIC,
  population NUMERIC,
  excess_mortality_cumulative_absolute NUMERIC,
  excess_mortality_cumulative NUMERIC,
  excess_mortality NUMERIC,
  excess_mortality_cumulative_per_million NUMERIC,
  CONSTRAINT PK_DatosCVS PRIMARY KEY(id)
);


CREATE TEMP TABLE Temp_DatosCSV (
  iso_code VARCHAR(10) NOT NULL,
  continent VARCHAR(50),
  location VARCHAR(100) NOT NULL,
  date DATE NOT NULL,
  total_cases NUMERIC,
  new_cases NUMERIC,
  new_cases_smoothed NUMERIC,
  total_deaths NUMERIC,
  new_deaths NUMERIC,
  new_deaths_smoothed NUMERIC,
  total_cases_per_million NUMERIC,
  new_cases_per_million NUMERIC,
  new_cases_smoothed_per_million NUMERIC,
  total_deaths_per_million NUMERIC,
  new_deaths_per_million NUMERIC,
  new_deaths_smoothed_per_million NUMERIC,
  reproduction_rate NUMERIC,
  icu_patients NUMERIC,
  icu_patients_per_million NUMERIC,
  hosp_patients NUMERIC,
  hosp_patients_per_million NUMERIC,
  weekly_icu_admissions NUMERIC,
  weekly_icu_admissions_per_million NUMERIC,
  weekly_hosp_admissions NUMERIC,
  weekly_hosp_admissions_per_million NUMERIC,
  total_tests NUMERIC,
  new_tests NUMERIC,
  total_tests_per_thousand NUMERIC,
  new_tests_per_thousand NUMERIC,
  new_tests_smoothed NUMERIC,
  new_tests_smoothed_per_thousand NUMERIC,
  positive_rate NUMERIC,
  tests_per_case NUMERIC,
  tests_units VARCHAR(50),
  total_vaccinations NUMERIC,
  people_vaccinated NUMERIC,
  people_fully_vaccinated NUMERIC,
  total_boosters NUMERIC,
  new_vaccinations NUMERIC,
  new_vaccinations_smoothed NUMERIC,
  total_vaccinations_per_hundred NUMERIC,
  people_vaccinated_per_hundred NUMERIC,
  people_fully_vaccinated_per_hundred NUMERIC,
  total_boosters_per_hundred NUMERIC,
  new_vaccinations_smoothed_per_million NUMERIC,
  new_people_vaccinated_smoothed NUMERIC,
  new_people_vaccinated_smoothed_per_hundred NUMERIC,
  stringency_index NUMERIC,
  population_density NUMERIC,
  median_age NUMERIC,
  aged_65_older NUMERIC,
  aged_70_older NUMERIC,
  gdp_per_capita NUMERIC,
  extreme_poverty NUMERIC,
  cardiovasc_death_rate NUMERIC,
  diabetes_prevalence NUMERIC,
  female_smokers NUMERIC,
  male_smokers NUMERIC,
  handwashing_facilities NUMERIC,
  hospital_beds_per_thousand NUMERIC,
  life_expectancy NUMERIC,
  human_development_index NUMERIC,
  population NUMERIC,
  excess_mortality_cumulative_absolute NUMERIC,
  excess_mortality_cumulative NUMERIC,
  excess_mortality NUMERIC,
  excess_mortality_cumulative_per_million NUMERIC
);
/*COPIAR DATOS DEL CSV EN LA TABLA*/
--\COPY Temp_DatosCSV  FROM 'owid-covid-data.csv' DELIMITER ',' CSV HEADER;
\COPY Temp_DatosCSV FROM 'owid-covid-data.csv' WITH (FORMAT csv, DELIMITER ',', HEADER true);


-- SELECT * FROM Temp_DatosCSV;
-- SELECT * FROM DatosCSV;
INSERT INTO DatosCSV (iso_code, continent, location, date,
                        total_cases, new_cases, new_cases_smoothed, total_deaths,
                        new_deaths, new_deaths_smoothed, total_cases_per_million,
                        new_cases_per_million, new_cases_smoothed_per_million,
                        total_deaths_per_million, new_deaths_per_million,
                        new_deaths_smoothed_per_million, reproduction_rate,
                        icu_patients, icu_patients_per_million, hosp_patients,
                        hosp_patients_per_million, weekly_icu_admissions,
                        weekly_icu_admissions_per_million, weekly_hosp_admissions,
                        weekly_hosp_admissions_per_million, total_tests, new_tests,
                        total_tests_per_thousand, new_tests_per_thousand,
                        new_tests_smoothed, new_tests_smoothed_per_thousand,
                        positive_rate, tests_per_case, tests_units, total_vaccinations,
                        people_vaccinated, people_fully_vaccinated, total_boosters,
                        new_vaccinations, new_vaccinations_smoothed,
                        total_vaccinations_per_hundred, people_vaccinated_per_hundred,
                        people_fully_vaccinated_per_hundred, total_boosters_per_hundred,
                        new_vaccinations_smoothed_per_million, new_people_vaccinated_smoothed,
                        new_people_vaccinated_smoothed_per_hundred, stringency_index,
                        population_density, median_age, aged_65_older, aged_70_older,
                        gdp_per_capita, extreme_poverty, cardiovasc_death_rate,
                        diabetes_prevalence, female_smokers, male_smokers,
                        handwashing_facilities, hospital_beds_per_thousand,
                        life_expectancy, human_development_index, population,
                        excess_mortality_cumulative_absolute, excess_mortality_cumulative,
                        excess_mortality, excess_mortality_cumulative_per_million)
SELECT iso_code, continent, location, date, total_cases, new_cases,
        new_cases_smoothed, total_deaths, new_deaths, new_deaths_smoothed,
         total_cases_per_million, new_cases_per_million,
         new_cases_smoothed_per_million, total_deaths_per_million,
         new_deaths_per_million, new_deaths_smoothed_per_million,
         reproduction_rate, icu_patients, icu_patients_per_million,
         hosp_patients, hosp_patients_per_million,
         weekly_icu_admissions, weekly_icu_admissions_per_million,
         weekly_hosp_admissions, weekly_hosp_admissions_per_million,
         total_tests, new_tests, total_tests_per_thousand,
          new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand,
          positive_rate, tests_per_case, tests_units, total_vaccinations,
          people_vaccinated, people_fully_vaccinated, total_boosters,
          new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred,
          people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred,
          total_boosters_per_hundred, new_vaccinations_smoothed_per_million,
          new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred,
          stringency_index, population_density, median_age, aged_65_older,
          aged_70_older, gdp_per_capita, extreme_poverty, cardiovasc_death_rate,
          diabetes_prevalence, female_smokers, male_smokers, handwashing_facilities,
          hospital_beds_per_thousand, life_expectancy, human_development_index,
          population, excess_mortality_cumulative_absolute, excess_mortality_cumulative,
           excess_mortality, excess_mortality_cumulative_per_million FROM Temp_DatosCSV;

-- SELECT * FROM DatosCSV;


CREATE TABLE IF NOT EXISTS Date(
  id INT  NOT NULL UNIQUE,
  date Date,
  iso_code VARCHAR(10),
  CONSTRAINT Date_pk PRIMARY KEY(id, date,iso_code)
);

INSERT INTO Date (id,date,iso_code)
SELECT id,date,iso_code FROM DatosCSV
ON CONFLICT (id,date,iso_code) DO NOTHING;

CREATE TABLE IF NOT EXISTS Pais(
  id INT  NOT NULL UNIQUE,
  iso_code VARCHAR(10) NOT NULL,
  continent VARCHAR(50) ,
  location VARCHAR(100)NOT NULL,
  CONSTRAINT Pais_pk PRIMARY KEY(id,iso_code)
);

INSERT INTO Pais (id,iso_code,continent , location)
SELECT id,iso_code,continent,location FROM DatosCSV
ON CONFLICT (id,iso_code) DO NOTHING;

-- Table: DatosGenerales
CREATE TABLE IF NOT EXISTS DatosGenerales (
    id INT  NOT NULL UNIQUE,
    iso_code VARCHAR(10)  NOT NULL,
    population numeric ,
    population_density numeric,
    median_age numeric,
    aged_65_older numeric,
    aged_70_older numeric,
    gdp_per_capita numeric,
    extreme_poverty numeric,
    cardiovasc_death_rate numeric,
    diabetes_prevalence numeric,
    female_smokers numeric,
    male_smokers numeric,
    handwashing_facilities numeric,
    hospital_beds_per_thousand numeric,
    life_expectancy numeric,
    human_development_index numeric,
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    CONSTRAINT DatosGenerales_pk PRIMARY KEY (id)
);


INSERT INTO DatosGenerales (id,iso_code, population, population_density,
                          median_age, aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty,
                          cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, 
                          handwashing_facilities, hospital_beds_per_thousand, life_expectancy,
                          human_development_index)
SELECT id, iso_code,population, population_density, median_age, aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty,
                          cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, 
                          handwashing_facilities, hospital_beds_per_thousand, life_expectancy,
                          human_development_index FROM DatosCSV
                          
ON CONFLICT (id) DO NOTHING;

-- SELECT * FROM DatosGenerales;


CREATE TABLE IF NOT EXISTS Casos (
    id INT  NOT NULL UNIQUE,
    date Date NOT NULL,
    iso_code VARCHAR(10) NOT NULL, 
    total_cases NUMERIC,
    new_cases NUMERIC,
    new_cases_smoothed NUMERIC,
    total_cases_per_million NUMERIC,
    new_cases_per_million NUMERIC,
    new_cases_smoothed_per_million NUMERIC,
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE,
    CONSTRAINT Casos_pk PRIMARY KEY (id)
);

INSERT INTO Casos(id,date,iso_code,total_cases, new_cases, new_cases_smoothed, total_cases_per_million,
                  new_cases_per_million, new_cases_smoothed_per_million) 
SELECT id,date,iso_code,total_cases, new_cases, new_cases_smoothed, total_cases_per_million,
       new_cases_per_million, new_cases_smoothed_per_million FROM DatosCSV
       WHERE new_cases IS NOT NULL AND new_cases <> 0.0
ON CONFLICT (id) DO NOTHING;

-- Table: Test
CREATE TABLE Test (
    id INT  NOT NULL UNIQUE,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    total_tests NUMERIC,
    new_tests NUMERIC,
    total_tests_per_thousand NUMERIC,
    new_tests_per_thousand NUMERIC,
    new_tests_smoothed NUMERIC,
    new_tests_smoothed_per_thousand NUMERIC,
    positive_rate NUMERIC,
    tests_per_case NUMERIC,
    tests_units varchar(50),
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE,
    CONSTRAINT Test_pk PRIMARY KEY (id)
);

INSERT INTO Test(id,iso_code, date , total_tests, 
    new_tests, total_tests_per_thousand, new_tests_per_thousand,
    new_tests_smoothed, new_tests_smoothed_per_thousand, positive_rate,
    tests_per_case, tests_units) 
SELECT id, iso_code, date , total_tests, new_tests, total_tests_per_thousand, 
    new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand, 
    positive_rate, tests_per_case, tests_units FROM DatosCSV
    WHERE total_tests IS NOT NULL AND total_tests <> 0.0
ON CONFLICT (id) DO NOTHING;

-- Table: Vacunas
CREATE TABLE Vacunas (
    id INT  NOT NULL UNIQUE,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    total_vaccinations numeric,
    people_vaccinated numeric,
    people_fully_vaccinated numeric,
    total_boosters numeric,
    new_vaccinations numeric,
    new_vaccinations_smoothed numeric,
    total_vaccinations_per_hundred numeric,
    people_vaccinated_per_hundred numeric,
    people_fully_vaccinated_per_hundred numeric,
    total_boosters_per_hundred numeric,
    new_vaccinations_smoothed_per_million numeric,
    new_people_vaccinated_smoothed numeric,
    new_people_vaccinated_smoothed_per_hundred numeric,
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE,
    CONSTRAINT Vacunas_pk PRIMARY KEY (id)
);

INSERT INTO Vacunas (id, iso_code, date, total_vaccinations,
                  people_vaccinated, people_fully_vaccinated, total_boosters,
                  new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred,
                  people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred,
                  total_boosters_per_hundred, new_vaccinations_smoothed_per_million,
                  new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred) 
SELECT id, iso_code, date, total_vaccinations,
                  people_vaccinated, people_fully_vaccinated, total_boosters,
                  new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred,
                  people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred,
                  total_boosters_per_hundred, new_vaccinations_smoothed_per_million,
                  new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred FROM DatosCSV
                  WHERE total_vaccinations IS NOT NULL AND total_vaccinations <> 0.0
ON CONFLICT (id) DO NOTHING;


-- Table: ExcesoMortalidad
CREATE TABLE ExcesoMortalidad (
    id INT  NOT NULL UNIQUE,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    excess_mortality NUMERIC,
    excess_mortality_cumulative NUMERIC,
    excess_mortality_cumulative_absolute NUMERIC,
    excess_mortality_cumulative_per_million NUMERIC,
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE,
    CONSTRAINT ExcesoMortalidad_pk PRIMARY KEY (id)
);

INSERT INTO ExcesoMortalidad (id,iso_code, date, excess_mortality, excess_mortality_cumulative,
    excess_mortality_cumulative_absolute, excess_mortality_cumulative_per_million) 
SELECT id,iso_code, date, excess_mortality, excess_mortality_cumulative,
    excess_mortality_cumulative_absolute, excess_mortality_cumulative_per_million FROM DatosCSV
    WHERE excess_mortality IS NOT NULL AND excess_mortality <> 0.0
ON CONFLICT (id) DO NOTHING;


-- Table: Hospital_UCI
CREATE TABLE Hospital_UCI (
    id INT  NOT NULL UNIQUE,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    icu_patients NUMERIC,
    icu_patients_per_million NUMERIC,
    hosp_patients NUMERIC,
    hosp_patients_per_million NUMERIC,
    weekly_icu_admissions NUMERIC,
    weekly_icu_admissions_per_million NUMERIC,
    weekly_hosp_admissions NUMERIC,
    weekly_hosp_admissions_per_million NUMERIC,
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE,
    CONSTRAINT Hospital_UCI_pk PRIMARY KEY (id)
);

INSERT INTO  Hospital_UCI (id,iso_code, date, icu_patients, icu_patients_per_million,
    hosp_patients, hosp_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million,
    weekly_hosp_admissions, weekly_hosp_admissions_per_million) 
SELECT id,iso_code, date, icu_patients, icu_patients_per_million,
    hosp_patients, hosp_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million,
    weekly_hosp_admissions, weekly_hosp_admissions_per_million FROM DatosCSV
    WHERE icu_patients IS NOT NULL AND icu_patients <> 0.0
ON CONFLICT (id) DO NOTHING;

-- Table: Muertes
CREATE TABLE Muertes (
    id INT  NOT NULL UNIQUE,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    total_deaths NUMERIC,
    new_deaths NUMERIC,
    new_deaths_smoothed NUMERIC,
    total_deaths_per_million NUMERIC,
    new_deaths_per_million NUMERIC,
    new_deaths_smoothed_per_million NUMERIC,
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE,
    CONSTRAINT Muertes_pk PRIMARY KEY (id)
);


INSERT INTO  Muertes (id,iso_code, date, total_deaths, new_deaths, new_deaths_smoothed, total_deaths_per_million,
    new_deaths_per_million, new_deaths_smoothed_per_million) 
SELECT id,iso_code, date, total_deaths, new_deaths, new_deaths_smoothed, total_deaths_per_million,
    new_deaths_per_million, new_deaths_smoothed_per_million FROM DatosCSV
    WHERE total_deaths IS NOT NULL AND total_deaths <> 0.0
ON CONFLICT (id) DO NOTHING;


-- Table: Politica
CREATE TABLE Politica (
    id INT  NOT NULL,
    stringency_index numeric ,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT Politica_pk PRIMARY KEY (id),
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE
);


INSERT INTO  Politica (id,stringency_index,iso_code, date) 
SELECT id,stringency_index,iso_code, date FROM DatosCSV
WHERE stringency_index IS NOT NULL AND stringency_index <> 0.0
ON CONFLICT (id) DO NOTHING;

-- Table: Produccion
CREATE TABLE Produccion (
    id INT  NOT NULL,
    reproduction_rate numeric,
    iso_code VARCHAR(10) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT Produccion_pk PRIMARY KEY (id),
    FOREIGN KEY (id,iso_code) REFERENCES Pais(id,iso_code) ON UPDATE CASCADE,
    FOREIGN KEY (id,date,iso_code) REFERENCES Date(id,date,iso_code) ON UPDATE CASCADE
);

INSERT INTO  Produccion (id,reproduction_rate,iso_code, date) 
SELECT id,reproduction_rate,iso_code, date FROM DatosCSV
WHERE reproduction_rate IS NOT NULL AND reproduction_rate <> 0.0
ON CONFLICT (id) DO NOTHING;


-- Query 1 Version 2
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

-- 3 ---

SELECT v.iso_code,
       MAX(CASE WHEN v.total_vaccinations_per_hundred >= 66.666 THEN m.total_deaths END) as muerte_promedio_despues,
       COALESCE(AVG(CASE WHEN v.total_vaccinations_per_hundred < 66.666 THEN m.total_deaths END), 0) as muerte_promedio_antes,
       MIN(CASE WHEN v.total_vaccinations_per_hundred >= 66.666 THEN v.date END) as fecha_alcanzo_vacunacion
FROM Vacunas v
JOIN Muertes m ON v.id = m.id AND v.iso_code = m.iso_code AND v.date = m.date
GROUP BY v.iso_code
HAVING MAX(v.total_vaccinations_per_hundred) >= 66.666;


-- 4 ---

WITH tasas_muerte AS (
  SELECT v.iso_code,
         v.total_vaccinations_per_hundred,
         AVG(CASE WHEN v.total_vaccinations_per_hundred < 66.666 THEN m.total_deaths END) OVER (PARTITION BY v.iso_code) as muerte_promedio_antes,
         AVG(CASE WHEN v.total_vaccinations_per_hundred >= 66.666 THEN m.total_deaths END) OVER (PARTITION BY v.iso_code) as muerte_promedio_despues,
         ROUND(ABS(AVG(CASE WHEN v.total_vaccinations_per_hundred < 66.666 THEN m.total_deaths END) OVER (PARTITION BY v.iso_code) - AVG(CASE WHEN v.total_vaccinations_per_hundred >= 66.666 THEN m.total_deaths END) OVER (PARTITION BY v.iso_code)),4) AS diferencia
  FROM Vacunas v
  JOIN Muertes m ON v.id = m.id AND v.iso_code = m.iso_code AND v.date = m.date
  WHERE v.total_vaccinations_per_hundred BETWEEN 10 AND 90
)
SELECT DISTINCT  ON (iso_code) iso_code,
       porcentajeVacunacion,
       diferencia,
       ROUND(muerte_promedio_antes,2) as muerte_promedio_antes,
       ROUND(muerte_promedio_despues,2) as muerte_promedio_despues
FROM (
  SELECT t1.iso_code,
         t1.muerte_promedio_antes,
         t1.muerte_promedio_despues,
         t1.diferencia,
         t2.total_vaccinations_per_hundred as porcentajeVacunacion,
         LEAD(ABS(t1.muerte_promedio_antes - t1.muerte_promedio_despues)) OVER (PARTITION BY t1.iso_code ORDER BY t2.total_vaccinations_per_hundred) as next_diff
  FROM tasas_muerte t1
  JOIN (
    SELECT DISTINCT ON (iso_code) iso_code, total_vaccinations_per_hundred
    FROM tasas_muerte
  ) t2 ON t1.iso_code = t2.iso_code
  WHERE t1.muerte_promedio_antes IS NOT NULL AND t1.muerte_promedio_despues IS NOT NULL
) t3
WHERE ABS(diferencia - next_diff) < 0.001 OR next_diff IS NULL
ORDER BY iso_code, diferencia;


-- Query 5
SELECT p.continent,
       SUM(c.new_cases_per_million) / SUM(d.population) AS tasa_crecimiento_per_capita
FROM Pais p
JOIN Casos c ON p.id = c.id AND p.iso_code = c.iso_code
JOIN DatosGenerales d ON p.id = d.id AND p.iso_code = d.iso_code
WHERE p.continent IS NOT NULL
GROUP BY p.continent
ORDER BY tasa_crecimiento_per_capita DESC;



