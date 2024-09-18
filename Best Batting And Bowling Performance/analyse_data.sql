-- Cleaning the data with SQL

-- Create a table for the data set

CREATE TABLE public.cricket_clean
(
    batting_team text,
    bowling_team text,
    ciy text,
    current_score numeric,
    pp numeric,
    balls_left numeric,
    wickets_left numeric,
    crr numeric,
    top_order numeric,
    middle_order numeric,
    lower_order numeric,
    tail numeric,
    pressure numeric,
    aggression_mode numeric,
    last_five numeric,
    death_overs numeric,
    runs_x numeric
);

ALTER TABLE IF EXISTS public.cricket_clean
    OWNER to postgres;

-- import the dataset

-- Identify the duplicate values
SELECT batting_team, bowling_team, ciy, current_score, pp, balls_left, wickets_left, crr, top_order, middle_order, lower_order,tail, pressure, aggression_mode, death_overs, runs_x,COUNT(*)
FROM cricket_clean
GROUP BY batting_team, bowling_team, ciy, current_score, pp, balls_left, wickets_left, crr, top_order, middle_order, lower_order,tail, pressure, aggression_mode, death_overs, runs_x
HAVING COUNT(*) > 1;

-- Delete the duplicate rows


-- Analyse the data with SQL
-- Identify all the teams within the dataset

SELECT DISTINCT(batting_team)
FROM cricket_clean
ORDER BY batting_team;

-- Identify the number of competions within the dataset

SELECT COUNT(*)
FROM cricket_clean;

SELECT (batting_team,bowling_team,ciy) AS competitions, 
COUNT( (batting_team,bowling_team,ciy)) AS competition_count
FROM cricket_clean
GROUP BY competitions
ORDER BY competitions,competition_count DESC;
