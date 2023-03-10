DROP TABLE IF EXISTS Temp_DatosCSV;
DROP TABLE IF EXISTS DatosCSV;
DROP TABLE IF EXISTS Date;
DROP TABLE IF EXISTS DatosGenerales;
DROP TABLE IF EXISTS Casos;
DROP TABLE IF EXISTS Test;
DROP TABLE IF EXISTS Vacuna;
DROP TABLE IF EXISTS Muertes;
DROP TABLE IF EXISTS Hospital_UCI;
DROP TABLE IF EXISTS Exceso_Mortalidad;
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
-- INSERT INTO DatosCSV (iso_code, continent, location, date,
--                         total_cases, new_cases, new_cases_smoothed, total_deaths,
--                         new_deaths, new_deaths_smoothed, total_cases_per_million,
--                         new_cases_per_million, new_cases_smoothed_per_million,
--                         total_deaths_per_million, new_deaths_per_million,
--                         new_deaths_smoothed_per_million, reproduction_rate,
--                         icu_patients, icu_patients_per_million, hosp_patients,
--                         hosp_patients_per_million, weekly_icu_admissions,
--                         weekly_icu_admissions_per_million, weekly_hosp_admissions,
--                         weekly_hosp_admissions_per_million, total_tests, new_tests,
--                         total_tests_per_thousand, new_tests_per_thousand,
--                         new_tests_smoothed, new_tests_smoothed_per_thousand,
--                         positive_rate, tests_per_case, tests_units, total_vaccinations,
--                         people_vaccinated, people_fully_vaccinated, total_boosters,
--                         new_vaccinations, new_vaccinations_smoothed,
--                         total_vaccinations_per_hundred, people_vaccinated_per_hundred,
--                         people_fully_vaccinated_per_hundred, total_boosters_per_hundred,
--                         new_vaccinations_smoothed_per_million, new_people_vaccinated_smoothed,
--                         new_people_vaccinated_smoothed_per_hundred, stringency_index,
--                         population_density, median_age, aged_65_older, aged_70_older,
--                         gdp_per_capita, extreme_poverty, cardiovasc_death_rate,
--                         diabetes_prevalence, female_smokers, male_smokers,
--                         handwashing_facilities, hospital_beds_per_thousand,
--                         life_expectancy, human_development_index, population,
--                         excess_mortality_cumulative_absolute, excess_mortality_cumulative,
--                         excess_mortality, excess_mortality_cumulative_per_million)
-- SELECT iso_code, continent, location, date, total_cases, new_cases,
--         new_cases_smoothed, total_deaths, new_deaths, new_deaths_smoothed,
--          total_cases_per_million, new_cases_per_million,
--          new_cases_smoothed_per_million, total_deaths_per_million,
--          new_deaths_per_million, new_deaths_smoothed_per_million,
--          reproduction_rate, icu_patients, icu_patients_per_million,
--          hosp_patients, hosp_patients_per_million,
--          weekly_icu_admissions, weekly_icu_admissions_per_million,
--          weekly_hosp_admissions, weekly_hosp_admissions_per_million,
--          total_tests, new_tests, total_tests_per_thousand,
--           new_tests_per_thousand, new_tests_smoothed, new_tests_smoothed_per_thousand,
--           positive_rate, tests_per_case, tests_units, total_vaccinations,
--           people_vaccinated, people_fully_vaccinated, total_boosters,
--           new_vaccinations, new_vaccinations_smoothed, total_vaccinations_per_hundred,
--           people_vaccinated_per_hundred, people_fully_vaccinated_per_hundred,
--           total_boosters_per_hundred, new_vaccinations_smoothed_per_million,
--           new_people_vaccinated_smoothed, new_people_vaccinated_smoothed_per_hundred,
--           stringency_index, population_density, median_age, aged_65_older,
--           aged_70_older, gdp_per_capita, extreme_poverty, cardiovasc_death_rate,
--           diabetes_prevalence, female_smokers, male_smokers, handwashing_facilities,
--           hospital_beds_per_thousand, life_expectancy, human_development_index,
--           population, excess_mortality_cumulative_absolute, excess_mortality_cumulative,
--            excess_mortality, excess_mortality_cumulative_per_million FROM Temp_DatosCSV;

-- SELECT * FROM DatosCSV;


CREATE TABLE IF NOT EXISTS Date(
  id SERIAL NOT NULL UNIQUE,
  date Date,
  iso_code VARCHAR(10),
  CONSTRAINT Date_pk PRIMARY KEY(id, date,iso_code)
);

INSERT INTO Date (date,iso_code)
SELECT date,iso_code FROM Temp_DatosCSV
ON CONFLICT (id,date,iso_code) DO NOTHING;

SELECT * FROM Date;

CREATE TABLE IF NOT EXISTS Pais(
  id SERIAL NOT NULL UNIQUE,
  iso_code VARCHAR(10),
  continent VARCHAR(50) ,
  location VARCHAR(100)NOT NULL,
  CONSTRAINT Pais_pk PRIMARY KEY(id,iso_code)
);

INSERT INTO Pais (iso_code,continent , location)
SELECT iso_code,continent,location FROM Temp_DatosCSV
ON CONFLICT (id,iso_code) DO NOTHING;

SELECT * FROM Date;


-- Table: DatosGenerales
CREATE TABLE IF NOT EXISTS DatosGenerales (
    id SERIAL  NOT NULL UNIQUE,
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


INSERT INTO DatosGenerales (iso_code, population, population_density,
                          median_age, aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty,
                          cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, 
                          handwashing_facilities, hospital_beds_per_thousand, life_expectancy,
                          human_development_index)
SELECT iso_code,population, population_density, median_age, aged_65_older, aged_70_older, gdp_per_capita, extreme_poverty,
                          cardiovasc_death_rate, diabetes_prevalence, female_smokers, male_smokers, 
                          handwashing_facilities, hospital_beds_per_thousand, life_expectancy,
                          human_development_index FROM Temp_DatosCSV
ON CONFLICT (id) DO NOTHING;

SELECT * FROM DatosGenerales;


CREATE TABLE IF NOT EXISTS Casos (
    id SERIAL  NOT NULL UNIQUE,
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
    FOREIGN KEY (id) REFERENCES DatosGenerales(id) ON UPDATE CASCADE,
    CONSTRAINT Casos_pk PRIMARY KEY (id)
);

INSERT INTO Casos(date,iso_code,total_cases, new_cases, new_cases_smoothed, total_cases_per_million,
                  new_cases_per_million, new_cases_smoothed_per_million) 
SELECT date,iso_code,total_cases, new_cases, new_cases_smoothed, total_cases_per_million,
       new_cases_per_million, new_cases_smoothed_per_million FROM Temp_DatosCSV
ON CONFLICT (id) DO NOTHING;




    -- id_date INT NOT NULL, 
    -- id_pais INT NOT NULL,
-- SELECT * FROM Casos;


-- CREATE TABLE IF NOT EXISTS Date(
--     id SERIAL  NOT NULL UNIQUE,
--     date DATE  NOT NULL,
--     --FOREIGN KEY (id) REFERENCES DatosCSV(id) ON UPDATE CASCADE,
--     CONSTRAINT Date_pk PRIMARY KEY (id,date)
-- );

-- -- INSERT INTO DATE(id, date) 
-- -- SELECT id, date FROM DatosCSV
-- -- ON CONFLICT (id,date) DO NOTHING;

-- INSERT INTO DATE(date) 
-- SELECT DISTINCT ON (date) date FROM Temp_DatosCSV
-- ON CONFLICT (id,date) DO NOTHING;