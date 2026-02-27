=============================================================
-- File Name  : transformations.sql
-- Project    : Snowflake Hotel Bookings – Medallion ETL
-- Layer      : Silver (Data Cleaning & Standardization)
-- Description:
--   • Performs data validation checks
--   • Standardizes text fields (TRIM, LOWER, INITCAP)
--   • Converts data types safely (TRY_TO_DATE, TRY_TO_DECIMAL)
--   • Corrects inconsistent values (e.g., booking_status typos)
--   • Applies business rule validation (date logic, null checks)
--
-- Purpose:
--   Transform raw Bronze data into clean, analytics-ready
--   structured datasets for downstream consumption.
=============================================================


use database hotel_bookings
--Checking for null's,mismatch data, data cleaning
select * from bronze_hotel_bookings limit 50

select * from bronze_hotel_bookings where customer_email not like '%@%.%'

select * from bronze_hotel_bookings where total_amount <0 --- or like '-%'

select * from bronze_hotel_bookings where booking_id is null

select check_in_date,check_out_date from bronze_hotel_bookings where try_to_date(check_out_date) < try_to_date(check_in_date);

select * from bronze_hotel_bookings where booking_status = 'Confirmeeed'


--Loading the data in to silver layer 
insert into silver_hotel_bookings
select 
booking_id,
hotel_id,
initcap(trim(hotel_city)) as hotel_city	,
customer_id	,
-- Standardize city and customer names
initcap(trim(customer_name)) as customer_name ,
-- Validate and normalize email
case 
    when customer_email like '%@%.%' then lower(trim(customer_email))
    else null
end as customer_email,
try_to_date(nullif(check_in_date,'')) as check_in_date,
try_to_date(nullif(check_out_date,'')) as check_out_date ,
room_type ,
num_guests ,
abs(try_to_decimal(total_amount,10,2))as total_amount,
currency ,
case
    when lower(booking_status) = 'confirmeeed' then 'Confirmed' ELSE booking_status
end as booking_status

from bronze_hotel_bookings 
where try_to_date(check_in_date) is not null
and try_to_date(check_out_date) is not null
and try_to_date(check_out_date)>=try_to_date(check_in_date);



select * from bronze_hotel_bookings limit 20
select * from silver_hotel_bookings limit 20

