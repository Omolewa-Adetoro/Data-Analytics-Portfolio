-- Cleaning The Data With SQL

-- Creating a table for each of the 12 data set and importing the dataset
-- The columns weekday, month and ride_length is added to each table and left null until the appropriate data is entered.

CREATE TABLE public.july_2023
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.july_2023
    OWNER to postgres;

CREATE TABLE public.september_2023
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.september_2023
    OWNER to postgres;

CREATE TABLE public.october_2023
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.october_2023
    OWNER to postgres;

CREATE TABLE public.november_2023
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.november_2023
    OWNER to postgres;

CREATE TABLE public.december_2023
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.december_2023
    OWNER to postgres;

CREATE TABLE public.january_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.january_2024
    OWNER to postgres;

CREATE TABLE public.february_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.february_2024
    OWNER to postgres;

CREATE TABLE public.march_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.march_2024
    OWNER to postgres;

CREATE TABLE public.april_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.april_2024
    OWNER to postgres;

CREATE TABLE public.may_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.may_2024
    OWNER to postgres;

CREATE TABLE public.june_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.june_2024
    OWNER to postgres;

CREATE TABLE public.august_2024
(
    ride_id text,
    rideable_type text,
    month text,
    weekday text,
    started_at timestamp without time zone,
    ended_at timestamp without time zone,
    ride_length interval,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE IF EXISTS public.august_2024
    OWNER to postgres;

-- Create a single table with the data from all 12 datasets

CREATE TABLE public.bike_data_clean AS
SELECT * FROM july_2023
UNION ALL
SELECT * FROM august_2024
UNION ALL
SELECT * FROM september_2023
UNION ALL
SELECT * FROM october_2023
UNION ALL
SELECT * FROM november_2023
UNION ALL
SELECT * FROM december_2023
UNION ALL
SELECT * FROM january_2024
UNION ALL
SELECT * FROM february_2024
UNION ALL
SELECT * FROM march_2024
UNION ALL
SELECT * FROM april_2024
UNION ALL
SELECT * FROM may_2024
UNION ALL
SELECT * FROM june_2024;

ALTER TABLE IF EXISTS public.bike_data_clean
    OWNER TO postgres;

-- Create values for week day

UPDATE bike_data_clean
SET weekday = EXTRACT(DOW FROM started_at);

-- Create values for month

UPDATE bike_data_clean
SET "month" = EXTRACT(MONTH FROM started_at);

-- Create the values for ride_length

UPDATE bike_data_clean
SET ride_length = ended_at - started_at;

-- Change the column name member_casual to member_type

ALTER TABLE bike_data_clean
RENAME COLUMN member_casual to member_type;

-- Change the values of weekday to the name of the day

UPDATE bike_data_clean
SET weekday = 'Monday'
WHERE weekday = '1';

UPDATE bike_data_clean
SET weekday = 'Tuesday'
WHERE weekday = '2';

UPDATE bike_data_clean
SET weekday = 'Wednesday'
WHERE weekday = '3';

UPDATE bike_data_clean
SET weekday = 'Thursday'
WHERE weekday = '4';

UPDATE bike_data_clean
SET weekday = 'Friday'
WHERE weekday = '5';

UPDATE bike_data_clean
SET weekday = 'Saturday'
WHERE weekday = '6';

UPDATE bike_data_clean
SET weekday = 'Sunday'
WHERE weekday = '0';


-- Change the values of month to the name of the month

UPDATE bike_data_clean
SET "month" = 'January'
WHERE "month" = '1';

UPDATE bike_data_clean
SET "month" = 'February'
WHERE "month" = '2';

UPDATE bike_data_clean
SET "month" = 'March'
WHERE "month" = '3';

UPDATE bike_data_clean
SET "month" = 'April'
WHERE "month" = '4';

UPDATE bike_data_clean
SET "month" = 'May'
WHERE "month" = '5';

UPDATE bike_data_clean
SET "month" = 'June'
WHERE "month" = '6';

UPDATE bike_data_clean
SET "month" = 'July'
WHERE "month" = '7';

UPDATE bike_data_clean
SET "month" = 'August'
WHERE "month" = '8';

UPDATE bike_data_clean
SET "month" = 'September'
WHERE "month" = '9';

UPDATE bike_data_clean
SET "month" = 'October'
WHERE "month" = '10';

UPDATE bike_data_clean
SET "month" = 'November'
WHERE "month" = '11';

UPDATE bike_data_clean
SET "month" = 'December'
WHERE "month" = '12';

-- Download the table as a csv file
