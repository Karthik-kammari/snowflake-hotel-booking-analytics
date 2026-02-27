=============================================================
-- File Name  : Gold_agg.sql
-- Project    : Snowflake Hotel Bookings – Medallion ETL
-- Layer      : Gold (Aggregations & Analytics)
-- Description:
--   • Creates analytics-ready tables
--   • Computes monthly booking trends
--   • Aggregates revenue metrics
--   • Ranks cities using window functions (RANK())
--   • Prepares datasets optimized for dashboard reporting
--
-- Purpose:
--   Provide high-performance aggregated tables for KPI
--   analysis and Snowsight dashboard visualization.
=============================================================

select * from silver_hotel_bookings limit 10
---------------------------------------------------------------------------------------------------------------------------------
create table GOLD_AGG_DAILY_BOOKINGS AS

select year(check_in_date) as years, 
date_trunc('month', check_in_date) as booking_month,
check_in_date,
count(check_in_date) as No_of_bookings,
sum(total_amount) as monthly_revenue
from silver_hotel_bookings
group by trim(to_char(check_in_date,'Mon')),check_in_date order by years,months,check_in_date;

---------------------------------------------------------------------------------------------------------------------------------
create table GOLD_AGG_DAILY_HOTEL_CITY_SALES AS

select hotel_city,
sum(total_amount) as top_revenue,
rank()over(order by sum(total_amount) desc) as ranking
from silver_hotel_bookings group by hotel_city;

-------------------------------------------------------------
CREATE TABLE GOLD_HOTEL_BOOKINGS_CLEAN AS
SELECT * FROM SILVER_HOTEL_BOOKINGS;
-------------------------------------------------------------
SELECT * FROM GOLD_HOTEL_BOOKINGS_CLEAN LIMIT 10

SELECT * FROM GOLD_AGG_DAILY_BOOKINGS LIMIT 10

SELECT * FROM  GOLD_AGG_DAILY_HOTEL_CITY_SALES LIMIT 10