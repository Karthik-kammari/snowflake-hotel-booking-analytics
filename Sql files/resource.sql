=============================================================
-- File Name  : resource.sql
-- Project    : Snowflake Hotel Bookings – Medallion ETL
-- Layer      : External Resources Configuration
-- Description:
--   • Creates CSV File Format
--   • Configures External Stage for AWS S3
--   • Enables structured ingestion into Snowflake
--
-- Security Note:
--   AWS credentials are managed using secure Storage Integration.
--   No credentials are stored in this repository.
=============================================================

use database hotel_bookings

create or replace file format csv_file_format
type ='csv'
field_delimiter =','
skip_header=1
null_if=('NULL','null','')
error_on_column_count_mismatch = FALSE;

show file formats

create or replace stage stg_hotel_bookings
file_format= csv_file_format
url = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';

show stages;


create stage stg_karthik_onprem
file_format=csv_file_format

