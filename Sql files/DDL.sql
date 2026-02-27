=============================================================
-- File Name  : DDL.sql
-- Project    : Snowflake Hotel Bookings – Medallion ETL
-- Layer      : Infrastructure & Bronze Setup
-- Description:
--   • Creates Bronze table structure
--   • Defines raw schema (all STRING for safe ingestion)
--   • Loads raw data from S3 / stage into Bronze layer
--   • Implements COPY INTO with error handling
--
-- Purpose:
--   Store raw ingested data exactly as received for traceability,
--   reprocessing capability, and audit purposes.
 =============================================================

create or replace table bronze_hotel_bookings
(booking_id	string,
hotel_id int,
hotel_city	string,
customer_id	string,
customer_name string,
customer_email string,
check_in_date	string,
check_out_date string,
room_type string,
num_guests string,
total_amount string,
currency string,
booking_status string)

select * from bookings

----------------------------------------------------------------------------------------------------
--loading data from aws

-- NOTE:
-- AWS access is configured using Snowflake Storage Integration.
-- Credentials are managed securely and not included in this repository.

COPY INTO bronze_hotel_bookings
from @stg_hotel_bookings
files=('hotel_bookings_raw.csv')--file_format=(format_name= CSV_FILE_FORMAT)
on_error='continue'

------------------------------------------------------------------------------------------------------------------
--Loading data from on prem local

COPY INTO bronze_hotel_bookings
from @stg_karthik_onprem
file_format=(format_name= CSV_FILE_FORMAT)
on_error='continue'
--------------------------------------------------------------------------------------------------------


SELECT * FROM BRONZE_HOTEL_BOOKINGS limit 20;

create table silver_hotel_bookings(
booking_id	varchar,
hotel_id int,
hotel_city	varchar,
customer_id	varchar,
customer_name varchar,
customer_email varchar,
check_in_date	date,
check_out_date date,
room_type varchar,
num_guests varchar,
total_amount float,
currency varchar,
booking_status varchar);

