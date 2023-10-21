select *
from PortfolioProject..coviddeaths
order by 3,4

--select *
--from PortfolioProject..covidvaccinations
--order by 3,4

--select data that we are going to be using

select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..coviddeaths
where continent is not null 
order by 1,2

--Looking at total cases and total deaths of Australia

select location, date, total_cases,total_deaths
from PortfolioProject..coviddeaths
where location like '%Australia%'
order by 1,2

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select Location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
where location like '%australia%'
order by 1,2

-- Looking at Countries with highest infection rate compared to population

Select Location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
where continent is not null 
Group by location, population
order by PercentPopulationInfected 

-- Showing Countries with the highest death count per population 

Select Location, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioProject..coviddeaths
where continent is not null 
Group by location
order by TotalDeathCount desc



Select location, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioProject..coviddeaths
where continent is null 
Group by location
order by TotalDeathCount desc

-- Showing Continents with the highest death count per population

Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioProject..coviddeaths
where continent is not null 
Group by continent
order by TotalDeathCount desc


-- GLOBAL NUMBERS 

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null 
order by 1,2



-- Creating view to store data for later visualizations

Create view TotalDeathCount as
Select continent, MAX(cast(Total_deaths as int)) as TotalDeathCount
from PortfolioProject..coviddeaths
where continent is not null 
Group by continent

Create view PercentPopulationInfected as
Select location, date, Population, total_cases,  (total_cases/population)*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
where location like '%australia%'
-- order by 1,2
























