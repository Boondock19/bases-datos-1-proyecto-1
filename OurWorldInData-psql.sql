DROP TABLE IF EXISTS Temp_DatosCSV;
DROP TABLE IF EXISTS DatosCSV;
	

CREATE TABLE DateTable (
  id SERIAL,
  date_instance DATE NOT NULL,
  CONSTRAINT PK_Date PRIMARY KEY (id)
);

CREATE TABLE Country (
  id SERIAL,
  iso_code varchar(10) NOT NULL,
  continent varchar(50),
  location varchar(100) NOT NULL,
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
  CONSTRAINT PK_Country PRIMARY KEY (id)
);

CREATE TABLE CaseTable (
  id SERIAL,
  total_cases NUMERIC,
  new_cases NUMERIC,
  new_cases_smoothed NUMERIC,
  total_deaths NUMERIC,
  new_deaths NUMERIC,
  new_deaths_smoothed NUMERIC,
  total_cases_per_million NUMERIC,
  new_cases_per_million NUMERIC,
  new_cases_smoothed_per_million NUMERIC,
  country_id INTEGER NOT NULL,
  date_id INTEGER NOT NULL,
  CONSTRAINT PK_Case PRIMARY KEY (id),
  CONSTRAINT FK_Case_Country FOREIGN KEY (country_id) REFERENCES Country(id),
  CONSTRAINT FK_Case_Date FOREIGN KEY (date_id) REFERENCES DateTable(id)
);

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

/*
SELECT * FROM Temp_DatosCSV;
SELECT * FROM DatosCSV;
*/
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
/*
SELECT * FROM DatosCSV;
*/

/*
SELECT DISTINCT date FROM DatosCSV ORDER BY date;
*/
INSERT INTO DateTable (date_instance) SELECT DISTINCT date FROM DatosCSV ORDER BY date;
/*
SELECT * FROM DateTable;
*/
/*
SELECT DISTINCT iso_code,continent,location,population,population_density,median_age,aged_65_older,
aged_70_older,gdp_per_capita,extreme_poverty,cardiovasc_death_rate,diabetes_prevalence,female_smokers,
male_smokers,handwashing_facilities,hospital_beds_per_thousand,life_expectancy,human_development_index,
human_development_index FROM DatosCSV ORDER BY iso_code;
*/


INSERT INTO Country (  iso_code,continent ,location ,population_density ,median_age ,aged_65_older ,aged_70_older ,gdp_per_capita ,
extreme_poverty,cardiovasc_death_rate ,diabetes_prevalence ,female_smokers ,male_smokers ,handwashing_facilities ,hospital_beds_per_thousand ,
life_expectancy,human_development_index, population ) (SELECT DISTINCT ON (iso_code) iso_code,continent ,location ,population_density ,median_age ,aged_65_older ,aged_70_older ,gdp_per_capita ,
extreme_poverty,cardiovasc_death_rate ,diabetes_prevalence ,female_smokers ,male_smokers ,handwashing_facilities ,hospital_beds_per_thousand ,
life_expectancy,human_development_index, population
FROM DatosCSV ORDER BY iso_code);



/*
SELECT COUNT(*) FROM (SELECT DISTINCT iso_code,continent,location,population,population_density,median_age,aged_65_older,
aged_70_older,gdp_per_capita,extreme_poverty,cardiovasc_death_rate,diabetes_prevalence,female_smokers,
male_smokers,handwashing_facilities,hospital_beds_per_thousand,life_expectancy,human_development_index,
human_development_index FROM DatosCSV ORDER BY iso_code) AS FQ;
*/

/*
SELECT DISTINCT iso_code,excess_mortality,excess_mortality_cumulative,excess_mortality_cumulative_absolute,excess_mortality_cumulative_per_million,date 
FROM DatosCSV ORDER BY iso_code;
*/

