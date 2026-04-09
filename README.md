# PlatinumRx_Assignment

📊 Data Analysis & SQL Practice Project
🧾 Overview

This project demonstrates skills in:

SQL (database design + querying)
Data analysis using Excel
Basic Python scripting

The work is divided into three parts:

SQL – Hotel Management System
SQL – Clinic Management System
Spreadsheet & Python Analysis

🏨 SQL – Hotel Management System
🧠 Approach
Designed a relational database with multiple tables (users, bookings, items, booking_commercials)
Used JOINs to combine related datasets
Applied aggregate functions like SUM() for calculations
Used GROUP BY for grouping data
Used subqueries and window functions (RANK) for ranking-based problems
Focused on time-based filtering (month/year)

📊 Query-wise Explanation
🔹 Q1: Last booked room per user
Found latest booking per user using aggregation
Retrieved corresponding room details

🔹 Q2: Total billing for November 2021
Joined booking, billing, and item tables
Calculated total bill using quantity × rate
Grouped by booking

🔹 Q3: Bills greater than 1000
Aggregated billing per bill
Filtered using HAVING condition

🔹 Q4: Most & Least ordered item per month
Aggregated item quantities per month
Used ranking logic to identify:
Most ordered
Least ordered items

🔹 Q5: Second highest bill per month
Calculated total bill per transaction
Used ranking to find second highest
Handled cases where second highest does not exist

⚙️ Assumptions
Data is clean and complete
Each booking/bill has unique identifiers
Prices and quantities are valid
Months with insufficient data may not return results


🏥 SQL – Clinic Management System
🧠 Approach
Designed relational schema using 4 tables:
clinics, customer, clinic_sales, expenses
Used:
JOINs for combining tables
SUM() for revenue & expense calculation
GROUP BY for aggregation
ORDER BY + LIMIT for top results
Subqueries & ranking logic for advanced analysis
Focused on financial insights (profitability analysis)

📊 Query-wise Explanation
🔹 Q1: Revenue by sales channel
Aggregated revenue based on sales_channel
Helps compare online vs offline performance

🔹 Q2: Top 10 customers
Joined sales with customer table
Calculated total spending per customer
Sorted in descending order

🔹 Q3: Monthly profit analysis
Calculated:
Revenue (sales)
Expenses
Profit = Revenue − Expenses
Added status:
Profitable / Not Profitable

🔹 Q4: Most profitable clinic per city
Calculated profit per clinic
Used ranking logic to find top clinic per city

🔹 Q5: Second least profitable clinic per state
Calculated profit per clinic
Compared within same state
Selected second lowest performer using ranking logic

⚙️ Assumptions
Currency is consistent across data
Data is complete and valid
Clinics can have multiple sales and expenses
Profit is derived from:
Sales − Expenses
Ranking is possible due to sufficient data


📊 Spreadsheet Analysis (Excel)
🎯 Objective

Analyze ticket and feedback data using lookup and aggregation techniques.

🧠 Approach
Data Preparation
Created separate sheets: ticket and feedbacks
Entered sample structured data

Data Mapping
Used VLOOKUP to match and fetch related fields
Simulated SQL JOIN behavior

Time Analysis
Created helper columns:
Same day ticket closure
Same hour closure

Aggregation
Used COUNTIFS to calculate:
Tickets closed on same day
Tickets closed within same hour

📌 Result
Successfully analyzed time-based ticket resolution patterns
Demonstrated lookup, filtering, and aggregation skills in Excel


🐍 Python Scripts
🎯 Objective

Demonstrate basic programming concepts:

Time conversion
String manipulation


🔹 1. Time Converter
Approach
Convert minutes into hours and minutes using:
Integer division (//)
Modulus (%)
Handle singular/plural formatting
Example
130 → 2 hrs 10 min
110 → 1 hr 50 min


🔹 2. Remove Duplicates from String
Approach
Loop through each character
Track seen characters using a dictionary
Build a new string without duplicates
Maintain original order
Example
"programming" → "progamin"


⚙️ Assumptions
Inputs are valid
Case sensitivity is preserved
Output format is simple and readable


🚀 Tools Used
SQL (MySQL)
DB Fiddle
Excel
Python


📌 Conclusion

This project demonstrates:

Strong understanding of SQL queries and database design
Ability to perform data analysis using Excel
Basic programming skills in Python
Use of aggregation, joins, and ranking techniques
