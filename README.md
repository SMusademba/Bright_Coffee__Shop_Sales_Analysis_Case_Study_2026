# Bright_Coffee__Shop_Sales_Analysis_Case_Study_2026
The business has recently appointed a new CEO whose mission is to grow the company’s revenue and improve product performance. Your role, as a Junior Data Analyst, is to extract actionable insights from historical data and prepare a presentation to assist the CEO in decision-making.

**Objective**
Use your analytics, SQL, and data visualization skills to help Bright Coffee Shop understand:
--- Which products generate the most revenue
--- What time of day the store performs best
--- Sales trends across products and time intervals
--- Recommendations for improving sales performance

Using the Bright Coffee data csv file for processing the shop transactional sales data for the 3 locations to understand current performance to give an indication of success areas and areas of improvement.


**CASE STUDY**
Tools
--- Miro planning and project timeline mapping
--- Databricks data processing
--- Excel raw data analysis and final query data pivots and charts
--- Powerpoint presentation preparation

**First step**
--- Create a Gantt Chart and Project Flow Chart both using the MIRO tool. This is to document ideas and map out the project timeline and deliverables after the meeting with the CEO.

--- Checking the raw csv file data to have an initial overview of the data we are dealing with and perform any data cleaning if necessary.

--- ETL > Uploading the data on Databricks to create the table for the Query.

--- Importantly for version control and back up, we also simulatenously link Databricks with Github


**Second step**
--- Run query: Check if the data uploaded correctly onto Databricks

--- Check if data is sufficient to extract insights

--- Exploratory data analysis to check key information:
------- Checking data period, locations, products sold, prices, operating days and hours.
------- 149,116 TOTAL TRANSACTIONS

--- Final Query:
Identify all necessary categorical columns

--- Extract date information into names

CASE Statements
------ Create time bands to analyse business productivity per day
------ Create day classifications as there are weekdays and weekend operational hours
------ Create pricing bands for the analysis of price ranges

--- Download csv file of final query

**Third step**
--- Excel pivots and charts for insights

--- Key insights
------ Hell's kitchen is the best performing over 6 months in total revenue
------ June was the best month of revenue in the 6 months
------ Coffee is 39% of our revenue
------ Total revenue was $698,812 (Jan to Jun 2023)
------ Decline from Jan to Feb in sales and then a MoTM Revenue increase until Jun 2023
------ Breakfast is the best revenue period overall
------ Weekdays majority of revenue but however, 5 days of operation compared to 2 days of weekend operations
------ High spend transaction which is any amount with transaction above $8 generates most revenue

--- Key recommendations
------ Breakfast slot, includes purchases of food items as well significantly benefitting from Bakery sales between 9am and 11:59am
------ Coffee is significantly our best product and ensuring the quality and standard is maintained, or expanding our product range and partnering with other shops to create specials,as well as seasonal prices to assist in Jan and Feb as well as Q3/Q4.
------ Improve the weekend sales and include breakfast specials that allow for families to visit stores.

**Fourth step**
--- Powerpoint presentation summarizing key insights and recommendations for the CEO


