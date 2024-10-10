select*
from Portfolioproject..COVIDDEATHS$ 
where continent is not null
order by 3,4

--select*
--from Portfolioproject..COVIDVACCINATIONS$ 
--order by 3,4


-- Select Data that we are going to be using

select location,date,total_cases,new_cases,total_deaths, population
from Portfolioproject..COVIDDEATHS$
order by 1,2

--Looking at Total Cases Vs Total Death
--Shows likelihood of dying if you contract covid in your country

select location,date,total_cases, total_deaths,(CONVERT(float,total_deaths)/nullif(convert(float,total_cases),0)) *100 AS DEATHPERCENTAGE
from Portfolioproject..COVIDDEATHS$
where location like '%states%'
order by 1,2

--Looking at Total cases vs Population
--Shows what percenatge of Population got Covid by date

Select location, date, total_cases, Population,
(CONVERT(float,total_cases)/nullif(convert(float,population),0)) *100 AS PercentPopulationInfected
from Portfolioproject..COVIDDEATHS$

order by 1,2


-- Looking at Countries with highest infection Rate compared to Population

Select location, Population,MAX(total_cases) AS HighestInfectionCount,
Max(CONVERT(float,total_cases)/nullif(convert(float,population),0)) *100 AS PercentPopulationInfected
from Portfolioproject..COVIDDEATHS$
Group by Location, Population
order by PercentPopulationInfected DESC


-- Countries with highest death cout per Population

Select location, MAX(total_deaths) AS TotalDeathCount
from Portfolioproject..COVIDDEATHS$
where continent is not null
Group by Location
order by TotalDeathCount DESC





--showing the continent with the highest death coutn per population

-- Lets break things down by continent (total death count)
Select continent, MAX(total_deaths) AS TotalDeathCount
from Portfolioproject..COVIDDEATHS$
where continent is  not null
Group by continent
order by TotalDeathCount DESC



--GLOBAL NUMBERS
--Total number of Covid cases worldwide versus total deaths and corresponding percentage
select  SUM(new_cases)as Total_cases,Sum(new_deaths) as Total_deaths, 
Sum(new_deaths)/Sum(New_Cases)*100 as DeathPercentage
from Portfolioproject..COVIDDEATHS$
--where location like '%states%'
where continent is not null and
new_cases <>0
--group by date
order by 1,2


--looking at Total population Vs Vaccinations orderred by the location

Select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations
from Portfolioproject..COVIDDEATHS$ dea
 join    Portfolioproject..covidvaccinations$ vac
 on dea.location =vac.location
 and dea.date =vac.date
 where dea.continent is not null
 order by 2,3


 --new vaccintions per day(rolling count per day)
 --by using partition and over

 Select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.Date)
 as rollingpeoplevaccinated
from Portfolioproject..COVIDDEATHS$ dea
 join    Portfolioproject..covidvaccinations$ vac
 on dea.location =vac.location
 and dea.date =vac.date
 where dea.continent is not null
 order by 2,3


 --creating a CTE or temp table cos i want to use the new table created( rolling people vaccinated) 
 to show a new colunm or insight calculation

 --USE CTE



 With PopvsVac (continent, location, date, population, new_vaccinations, Rollingpeoplevaccinated)
 as
 (
 Select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.Date)
 as Rollingpeoplevaccinated
from Portfolioproject..COVIDDEATHS$ dea
 join    Portfolioproject..covidvaccinations$ vac
 on dea.location =vac.location
 and dea.date =vac.date
 where dea.continent is not null
 --order by 2,3
 )
 Select *, (Rollingpeoplevaccinated/population)*100
 from PopvsVac




 -- TEMP TABLE
 
 DROP Table if exists #percentpopulationvaccinated
 Create Table #PercentPopulationVaccinated
 (
 Continent nvarchar(255),
 Location nvarchar (255),
 Date datetime,
 Population float,
 New_vaccinations nvarchar(255),
 RollingPeopleVaccinated numeric
 )



Insert into #PercentPopulationVaccinated
 Select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.Date)
 as Rollingpeoplevaccinated
from Portfolioproject..COVIDDEATHS$ dea
 join    Portfolioproject..covidvaccinations$ vac
 on dea.location =vac.location
 and dea.date =vac.date
 --where dea.continent is not null
 --order by 2,3

 Select *, (Rollingpeoplevaccinated/Population)*100
 from #PercentPopulationVaccinated

 --Creating views to store data for later visualisations
 
 use Portfolioproject
 go
  Create view percentpopulationvaccinated4 as
  Select dea.continent, dea.location, dea.date,dea.population, vac.new_vaccinations,
 sum(convert(bigint,vac.new_vaccinations)) over (partition by dea.location order by dea.location,dea.Date)
 as Rollingpeoplevaccinated
from Portfolioproject..COVIDDEATHS$ dea
 join    Portfolioproject..covidvaccinations$ vac
 on dea.location =vac.location
 and dea.date =vac.date
 where dea.continent is not null
 --order by 2,3