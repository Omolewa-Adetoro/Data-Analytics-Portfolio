-- Cleaning the data with SQL

-- Create a table for the data set

CREATE TABLE public.cricket_clean
(
    id numeric,
	batting_team text,
    bowling_team text,
    city text,
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

-- Delete the duplicate rows
DELETE FROM cricket_clean
WHERE id IN (
SELECT id
FROM (
SELECT id, ROW_NUMBER() OVER (PARTITION BY batting_team, bowling_team, city, current_score, pp, balls_left, wickets_left, crr, top_order, middle_order, lower_order,tail, pressure, aggression_mode, death_overs, runs_x) AS rownum
FROM cricket_clean) AS sub
WHERE rownum >1
);

-- 207 rows deleted

-- Analyse the data with SQL
-- Identify all the teams within the dataset

SELECT DISTINCT(batting_team)
FROM cricket_clean
ORDER BY batting_team;

-- 10 teams

-- Identify the number of competions within the dataset

SELECT COUNT(*)
FROM cricket_clean;

-- 42976

SELECT (batting_team,bowling_team,city) AS competitions, 
COUNT( (batting_team,bowling_team,city)) AS competition_count
FROM cricket_clean
GROUP BY competitions
ORDER BY competitions,competition_count DESC;

-- 347 combination of teams and cities

-- Identify the numbers of games each batting team has played
SELECT DISTINCT(batting_team) AS teams, COUNT(runs_x) AS num_of_games
FROM cricket_clean
GROUP BY teams
ORDER BY num_of_games DESC;

-- Identify the numbers of games each batting team has played  at its best
SELECT DISTINCT(batting_team) AS teams, COUNT(runs_x) AS num_of_games
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY num_of_games DESC;

-- Identify the batting team with the highest sum total of score
SELECT DISTINCT(batting_team) AS teams, SUM(runs_x) AS final_scores
FROM cricket_clean
GROUP BY teams
ORDER BY final_scores DESC;

-- Finding the average final score of each batting teams
SELECT DISTINCT(batting_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
GROUP BY teams
ORDER BY avg_scores DESC;

-- Average when their top batsmen were playing
SELECT DISTINCT(batting_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
WHERE top_order = 1
GROUP BY teams
ORDER BY avg_scores DESC;

-- Average when their least significant batsmens were playing
SELECT DISTINCT(batting_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
WHERE lower_order = 1 
GROUP BY teams
ORDER BY avg_scores DESC;

-- Average when the team is playing at its best
SELECT DISTINCT(batting_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY avg_scores DESC;

-- Wickets left batting team
SELECT DISTINCT(batting_team) AS teams, SUM(wickets_left) AS wickets_left 
FROM cricket_clean
GROUP BY teams
ORDER BY wickets_left DESC;

-- Average wickets left of batting team
SELECT DISTINCT(batting_team) AS teams, AVG(wickets_left) AS avg_wickets_left 
FROM cricket_clean
GROUP BY teams
ORDER BY avg_wickets_left DESC;

-- Average wickets left of batting team where the team is playing at their best
SELECT DISTINCT(batting_team) AS teams, AVG(wickets_left) AS avg_wickets_left 
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY avg_wickets_left DESC;

-- Total run score of the last 5 overs 
SELECT DISTINCT(batting_team) AS teams, SUM(last_five) AS last_five
FROM cricket_clean
GROUP BY teams
ORDER BY last_five DESC;

-- Average run score of the last five overs
SELECT DISTINCT(batting_team) AS teams, AVG(last_five) AS avg_last_five
FROM cricket_clean
GROUP BY teams
ORDER BY avg_last_five DESC;

-- Average run score of the last five overs where they are playing at their best
SELECT DISTINCT(batting_team) AS teams, AVG(last_five) AS avg_last_five
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY avg_last_five DESC;

-- Identify the numbers of games each bowling team has playes
SELECT DISTINCT(bowling_team) AS teams, COUNT(runs_x) AS num_of_games
FROM cricket_clean
GROUP BY teams
ORDER BY num_of_games DESC;

-- Identify the numbers of games where the opposing team played at its best
SELECT DISTINCT(bowling_team) AS teams, COUNT(runs_x) AS num_of_games
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY num_of_games;

-- Order the bowling team in terms of which team managed to  get the batting teams to score less overall
SELECT DISTINCT(bowling_team) AS teams, SUM(runs_x) AS final_scores
FROM cricket_clean
GROUP BY teams
ORDER BY final_scores;

-- Order the bowling team in terms of which team managed to  get the batting teams to score on average
SELECT DISTINCT(bowling_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
GROUP BY teams
ORDER BY avg_scores;

-- Average when their least significant batsmens were playing on the opposing team
SELECT DISTINCT(bowling_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
WHERE lower_order = 1 
GROUP BY teams
ORDER BY avg_scores;

-- Average when their top batsmens were playing on the opposing team
SELECT DISTINCT(bowling_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
WHERE top_order = 1 
GROUP BY teams
ORDER BY avg_scores;

-- Average when the opposing team is playing at its best
SELECT DISTINCT(bowling_team) AS teams, AVG(runs_x) AS avg_scores
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY avg_scores;

-- Wickets left of the opposing team
SELECT DISTINCT(bowling_team) AS teams, SUM(wickets_left) AS wickets_left 
FROM cricket_clean
GROUP BY teams
ORDER BY wickets_left;

-- Average wickets left of the opposing team
SELECT DISTINCT(bowling_team) AS teams, AVG(wickets_left) AS avg_wickets_left 
FROM cricket_clean
GROUP BY teams
ORDER BY avg_wickets_left;

-- Average wickets left where the team is opposing playing at their best
SELECT DISTINCT(bowling_team) AS teams, AVG(wickets_left) AS avg_wickets_left 
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY avg_wickets_left;

-- Balls delivered to the left
SELECT DISTINCT(bowling_team) AS teams, SUM(balls_left) AS balls_left
FROM cricket_clean
GROUP BY teams
ORDER BY balls_left DESC;

-- Average balls delivered to the left
SELECT DISTINCT(bowling_team) AS teams, AVG(balls_left) AS avg_balls_left
FROM cricket_clean
GROUP BY teams
ORDER BY avg_balls_left DESC;

-- Total run score of the last 5 overs of the opposing team
SELECT DISTINCT(bowling_team) AS teams, SUM(last_five) AS last_five
FROM cricket_clean
GROUP BY teams
ORDER BY last_five;

-- Average run score of the last five overs of the opposing team
SELECT DISTINCT(bowling_team) AS teams, AVG(last_five) AS avg_last_five
FROM cricket_clean
GROUP BY teams
ORDER BY avg_last_five;

-- Average run score of the last five overs when the opposing team are playing at their best
SELECT DISTINCT(bowling_team) AS teams, AVG(last_five) AS avg_last_five
FROM cricket_clean
WHERE top_order = 1 AND pressure = 0 AND pp = 1 AND aggression_mode = 1 AND tail = 0
GROUP BY teams
ORDER BY avg_last_five;
