# COVID-19 Data Exploration Using SQL

## Project Overview

This project explores global COVID-19 data using Microsoft SQL Server to uncover trends in infection rates, mortality, and vaccination progress across countries and continents.

The goal of this project is to demonstrate practical SQL skills by transforming raw data into meaningful insights through data exploration and analysis.

---

## Dataset

The project uses two datasets:

### COVIDDEATHS

Contains information such as:

* Country
* Continent
* Date
* Population
* Total Cases
* New Cases
* Total Deaths
* New Deaths

### COVIDVACCINATIONS

Contains vaccination-related information including:

* Country
* Date
* New Vaccinations
* Vaccination Progress

---

## Technologies Used

* Microsoft SQL Server
* T-SQL

---

## Project Objectives

This analysis answers several important questions, including:

* Which countries experienced the highest infection rates?
* Which countries recorded the highest number of COVID-19 deaths?
* Which continents were most affected?
* What was the global COVID-19 death rate?
* How did vaccination campaigns progress over time?
* What percentage of each country's population received vaccinations?

---

## SQL Analysis Performed

### 1. Data Exploration

Loaded and filtered COVID-19 death and vaccination datasets for analysis.

**SQL Skills**

* `SELECT`
* `WHERE`
* `ORDER BY`

---

### 2. Total Cases vs Total Deaths

Calculated the likelihood of death after contracting COVID-19 by comparing total cases with total deaths.

**Insight**

* Shows the death percentage for selected countries over time.

**SQL Skills**

* Mathematical calculations
* `CONVERT()`
* `NULLIF()`

---

### 3. Infection Rate vs Population

Measured the percentage of each country's population that had been infected.

**Formula**

```
(Total Cases / Population) × 100
```

---

### 4. Countries with the Highest Infection Rates

Identified countries with the highest percentage of infections relative to their populations.

**SQL Skills**

* `MAX()`
* `GROUP BY`
* Aggregate Functions

---

### 5. Countries with the Highest Death Counts

Compared countries based on the total number of reported COVID-19 deaths.

---

### 6. Death Counts by Continent

Aggregated death statistics by continent to compare regional impact.

---

### 7. Global COVID-19 Statistics

Calculated worldwide totals including:

* Total Cases
* Total Deaths
* Global Death Percentage

This provides an overall snapshot of the pandemic.

---

### 8. Vaccination Analysis

Joined the deaths and vaccinations datasets to compare vaccination progress with population size.

**SQL Skills**

* `INNER JOIN`
* Multiple table analysis

---

### 9. Rolling Vaccination Count

Used SQL Window Functions to calculate cumulative vaccinations over time for each country.

**SQL Skills**

* `SUM() OVER()`
* `PARTITION BY`
* `ORDER BY`

---

### 10. Common Table Expression (CTE)

Created a CTE to simplify the calculation of the percentage of each country's population that had been vaccinated.

**SQL Skills**

* `WITH`
* CTEs
* Derived calculations

---

### 11. Temporary Tables

Stored intermediate vaccination calculations inside a temporary table for easier analysis and reporting.

**SQL Skills**

* Temporary Tables
* `INSERT INTO`
* Data Reuse

---

### 12. SQL Views

Created reusable SQL views to support future dashboards and business intelligence tools such as Power BI or Tableau.

---

## SQL Concepts Demonstrated

* SELECT Statements
* Filtering Data (`WHERE`)
* Sorting (`ORDER BY`)
* Aggregate Functions (`SUM`, `MAX`, `COUNT`)
* Mathematical Calculations
* Data Type Conversion
* NULL Handling
* INNER JOIN
* Window Functions
* Common Table Expressions (CTEs)
* Temporary Tables
* SQL Views
* Data Exploration
* Exploratory Data Analysis (EDA)

---

## Key Insights

* Identified countries with the highest infection rates relative to population.
* Compared COVID-19 death counts across countries and continents.
* Measured global mortality rates during the pandemic.
* Tracked vaccination progress using cumulative totals.
* Calculated vaccination coverage as a percentage of each country's population.
* Created reusable SQL objects for reporting and visualization.

---

## Future Improvements

* Build an interactive Power BI dashboard.
* Create Tableau visualizations.
* Add time-series forecasting using Python.
* Compare vaccination rates with mortality trends.
* Develop a dashboard for country-to-country comparisons.

---

## Author

**Toyin Abiodun**

Aspiring Data Analyst | SQL | Python | Power BI | Business Analytics | Machine Learning

This project showcases my ability to clean, analyze, and transform real-world healthcare data into meaningful insights using SQL.
