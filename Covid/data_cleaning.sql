-- create and import the covid csv
CREATE TABLE public.covid
(
    "country/region" text,
    continent text,
    population numeric,
    total_cases numeric,
    new_cases numeric,
    total_deaths numeric,
    new_deaths numeric,
    total_recovered numeric,
    new_recovered numeric,
    active_cases numeric,
    serious_critical numeric,
    "total_cases/1m_pop" numeric,
    "deaths/1m_pop" numeric,
    total_test numeric,
    "tests/1m_pop" numeric,
    who_region text,
    iso_alpha text
);

ALTER TABLE IF EXISTS public.covid
    OWNER to postgres;

-- create and import the covid_group csv
CREATE TABLE public.covid_grouped
(
    date date,
    "country/region" text,
    confrimed numeric,
    deaths numeric,
    recovered numeric,
    active numeric,
    new_cases numeric,
    new_deaths numeric,
    new_recovered numeric,
    who_region text,
    iso_alpha text
);

ALTER TABLE IF EXISTS public.covid_grouped
    OWNER to postgres;

-- create and import coviddeath csv
CREATE TABLE public.coviddeath
(
    date_as_of date,
    start_week date,
    end_week date,
    state text,
    condition_group text,
    condition text,
    icd10_codes text,
    age_group text,
    covid_deaths text,
    flag text
);

ALTER TABLE IF EXISTS public.coviddeath
    OWNER to postgres;
