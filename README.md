# Bike Rental Shop - SQL Case Study

## Overview:

This project is a case study from **LearnSQL.com**, designed to answer business-critical questions for a bike rental shop. The dataset includes customer information, bike details, rental history, membership types, and membership purchases. The goal is to leverage SQL to help the shop owner make informed business decisions, such as improving pricing strategies, understanding rental demand, and optimizing customer segmentation.
This project was completed as part of an SQL learning exercise, and the queries were used to generate insights from the provided dataset.
While this case study is part of a learning exercise, the queries and results are designed to mimic real-world business analysis, making it a practical exercise for anyone looking to improve their SQL skills.
 
## Dataset Description

The dataset consists of five main tables:
1.	customer: Information about customers.
	+ Columns: id, name, email
2.	bike: Information about the bikes available for rental.
	+ Columns: id, model, category, price_per_hour, price_per_day, status
3.	rental: Details about bike rentals made by customers.
	+ Columns: id, customer_id, bike_id, start_datetime, duration, total_paid
4.	membership_type: Different types of memberships available for purchase.
	+ Columns: id, name, description, price
5.	membership: Memberships purchased by customers.
 	+ Columns: id, membership_type_id, customer_id, start_date, end_date, total_paid

## Business Questions Answered
The following business questions were addressed using SQL queries:

**Bike Inventory by Category:** The number of bikes in each category, where the number of bikes is greater than 2.

**Membership Purchases per Customer:** The total number of memberships purchased by each customer.

**New Rental Prices:** A list of bikes with their old and discounted rental prices based on the category (e.g., electric, mountain, and others).

**Rented vs. Available Bikes by Category:** The count of rented and available bikes in each category.

**Rental Revenue by Month, Year, and All-Time:** Total revenue from rentals, aggregated by month and year.

**Revenue from Memberships:** Total revenue from memberships by year, month, and membership type.

**Membership Revenue in 2024:** Subtotals and grand totals for memberships purchased in 2024, broken down by month and membership type.

**Customer Rental Segmentation:** Categorizing customers based on their rental frequency (e.g., more than 10 rentals, between 5-10 rentals, fewer than 5 rentals).

 ## Techniques Used:
  - **Aggregation** (`COUNT()`, `SUM()`, `GROUP BY`)
  - **Conditional Logic** (`CASE WHEN` for discounts)
  - **Joins** (`INNER JOIN`, `LEFT JOIN`)
  - **Date Functions** (`YEAR()`, `MONTH()`)
  - **Grouping Sets**
  - **CTE**

## Files Used
+ **create_database_and_tables.sql :** This file contains all the SQL statements required to create the database schema, including the creation of all the tables.
+ **bike_rental_case_study_queries.sql:** This file contains all the SQL queries to answer the above business questions

## How to Run the SQL Queries

1. **Set up the database**:
   - Run the `create_database_and_tables.sql` script to create all the necessary tables in your SQL database.
   - Execute the `DATASET-Bike_Rental_Case_Study.sql` file to populate the tables with sample data.
   
2. **Run the business queries**:
   - Open the `bike_rental_case_study_queries.sql` file in your SQL client (e.g., MySQL Workbench, SQL Server Management Studio, or any other SQL client).
   - Execute the queries in sequence or run the entire script to get the results for all business questions.

3. **Analyze the results**:
   - Review the output of each query to answer the business questions posed by the bike rental shop owner.

## Technologies Used:
- **SQL**: For querying the database and performing data manipulations.
- **MSSQL SERVER** : The database management system used to execute SQL queries and manage the data.

## Future Improvements:
- **Data Visualization**: Integrate the results with tools like Tableau or Power BI to create visual reports and dashboards.
- **Optimizations**: More efficient queries can be written to handle larger datasets, especially with indexing and query tuning.
- **Additional Queries**: New questions could be added for deeper insights into customer behavior and rental patterns.

## License:
This project is for educational purposes and is not intended for commercial use.

## Acknowledgments:
This case study is inspired by the **LearnSQL.com** platform, which offers SQL courses to help learners improve their database query skills.

