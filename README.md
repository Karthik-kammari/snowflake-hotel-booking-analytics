# 🏨 Snowflake Hotel Booking Analytics

🚀 End-to-End Medallion ETL Pipeline with AWS S3 Integration

## 📌 Project Overview

This project demonstrates a complete **end-to-end data engineering and analytics pipeline** built entirely in **Snowflake** using **AWS S3** as the source system.

The project follows the **Medallion Architecture (Bronze → Silver → Gold)** to ingest, clean, transform, aggregate, and visualize hotel booking data.  
The final output is delivered through an interactive **Snowsight Dashboard** for KPI tracking and trend analysis.

---

## 🎯 Project Goals

✅ Showcase Snowflake skills for interviews  
✅ Build an end-to-end ETL pipeline  
✅ Implement Medallion Architecture  
✅ Perform data cleaning and transformation  
✅ Build business-ready Gold tables  
✅ Create dashboard visualizations in Snowsight  

---

## 🖼️ Architecture Diagram

<img width="1331" height="799" alt="Architecture" src="https://github.com/user-attachments/assets/9d2197b2-55f6-4bf9-a7a4-cf6969584f72" />


---

## 🔄 Data Flow

AWS S3 CSV File  
↓  
Snowflake External Stage  
↓  
Bronze Layer (Raw Data)  
↓  
Silver Layer (Cleaned & Standardized Data)  
↓  
Gold Layer (Business-Ready Aggregations)  
↓  
Snowsight Dashboard  

---

## 🥇 Medallion Architecture Implementation

### 🟤 Bronze Layer — Raw Data Ingestion

**Table:** `BRONZE_HOTEL_BOOKINGS`

The Bronze layer stores raw hotel booking data exactly as received from the source CSV file.

#### ✅ Key Highlights

- Raw data loaded from AWS S3  
- External Stage used for ingestion  
- CSV File Format configured in Snowflake  
- COPY INTO used with `ON_ERROR = CONTINUE`  
- Raw data preserved for traceability  

---

### ⚪ Silver Layer — Cleaned & Standardized Data

**Table:** `SILVER_HOTEL_BOOKINGS`

The Silver layer applies data cleaning and validation logic to improve data quality.

#### 🧹 Transformations Applied

- `TRY_TO_DATE()` for safe date parsing  
- `TRY_TO_DECIMAL()` for numeric conversion  
- `ABS()` to normalize negative values  
- `LOWER()`, `TRIM()`, `INITCAP()` for text standardization  
- Email validation logic  
- Booking status typo correction  
- Date validation (check-out ≥ check-in)  
- Filtering invalid and null records  

---

### 🟡 Gold Layer — Business-Ready Analytics

**Tables Created:**

- `GOLD_HOTEL_BOOKINGS_CLEAN`
- `GOLD_AGG_DAILY_BOOKINGS`
- `GOLD_AGG_DAILY_HOTEL_CITY_SALES`

The Gold layer contains aggregated datasets optimized for reporting and dashboards.

#### 📊 Business Outputs

- Monthly booking trend  
- Monthly revenue trend  
- Top cities by revenue ranking  
- KPI-ready summary metrics  

---

## 📊 Snowflake Tables Created


<img width="506" height="220" alt="Tables" src="https://github.com/user-attachments/assets/e56bde80-2843-43c4-bb1f-4123ff346636" />


---

## 📊 Snowsight Dashboard


<img width="1840" height="931" alt="Dashboard_overview" src="https://github.com/user-attachments/assets/27cf4c8d-95cc-4313-a1f3-e5b7e4fbe652" />


---

## 📈 KPI Cards


<img width="1625" height="187" alt="KPI_Card" src="https://github.com/user-attachments/assets/d4bf6bb7-f9f0-4d2d-b70c-aa28daa77c3c" />


### KPI Metrics

- Total Bookings  
- Total Revenue  
- Total Guests  
- Average Bookings per Day  

---

## 📉 Monthly Booking Trend


<img width="808" height="306" alt="Monthly_Booking_Trend" src="https://github.com/user-attachments/assets/9e64506c-a187-4ce4-b65d-a4d18db86317" />

---

## 💰 Monthly Revenue Trend


<img width="806" height="306" alt="Monthly_Revenue" src="https://github.com/user-attachments/assets/39b1fea3-4169-4e5f-882a-1bd26232f9ac" />


---

## ⚙ Technologies Used

- Snowflake  
- AWS S3  
- SQL  
- Snowsight  
- Medallion Architecture  

---

## 📁 SQL Files

- `resource.sql` → Stage and file format setup  
- `DDL.sql` → Bronze table and raw ingestion  
- `transformations.sql` → Silver layer transformations  
- `Gold_agg.sql` → Gold layer aggregations  

---

## 🔐 Security Note

AWS credentials are NOT included in this repository.  
Secure Snowflake configuration should be used for external access.

---

## 💼 Business Value

This project demonstrates how raw hotel booking data can be transformed into business insights using a structured warehouse architecture.

Key outcomes:

- Built complete Bronze → Silver → Gold pipeline  
- Improved data quality through validation  
- Generated trend-based and ranking-based analytics  
- Delivered executive-style dashboard in Snowsight  

---

## 👨‍💻 Author

Karthik Chary Kammari  
Senior Data Engineer | 7+ Years Experience | AWS & Azure | Databricks, Glue, ADF, Synapse, Snowflake | Scalable Data Pipelines for Analytics & ML
