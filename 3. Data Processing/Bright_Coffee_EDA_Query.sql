--- Query 1 Checking if table uploaded correctly
SELECT * 
FROM workspace.default.bright_coffee_shop
LIMIT 20;
------ Upload successful


--- Query 2 Checking for NULL values in the Data
SELECT *
FROM workspace.default.bright_coffee_shop
WHERE unit_price=NULL;
------ No Null values found in data

--- Query 3 Checking the date range of the data we have
SELECT  MIN(transaction_date),
        MAX(transaction_date)
FROM workspace.default.bright_coffee_shop;
------ 6 months data starting 1 Jan 2023 to 30 Jun 2023

--- Query 4 Checking the store operating days and hours
SELECT  transaction_date,
        MIN(transaction_time),
        MAX(transaction_time),
        dayname(transaction_date) AS Day,
        monthname(transaction_date) AS Month
FROM workspace.default.bright_coffee_shop
GROUP BY  transaction_date,
          transaction_time;
------ Sun to Sat from 6AM TO 9PM


--- Query 5 checking product names across the classes
SELECT DISTINCT   product_category AS category,
                  product_detail AS product_name
FROM workspace.default.bright_coffee_shop;
------ Currently selling 80 inventory items across the different classes of products


--- Query 6 checking cheapest and mosst expensive product in stock
SELECT  MIN(unit_price) AS lowest_price,
        MAX(unit_price) AS highest_price
FROM workspace.default.bright_coffee_shop;
------ 0.8 and 45 are the price ranges 

--- Query 7 Checking number of stores and store names
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop;
------ 3 store locations: Lower Manhattan, Hell's Kitchen and Astoria


--- Query 8 counting all the rows, transactions, products across store locations
SELECT  
        COUNT(*) AS number_of_rows,
        COUNT(DISTINCT transaction_id) AS number_of_sales,
        COUNT(DISTINCT product_id) AS number_of_products,
        COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop;
------ Counting number of rows, 149 116 transactions, 80 products over the 3 stores


--- Query 9 Checking the days of operation in a week
SELECT DISTINCT transaction_date,
        store_location,
        transaction_time,
        dayname(transaction_date) AS Day,
        monthname(transaction_date) AS Month
FROM workspace.default.bright_coffee_shop
GROUP BY transaction_date,
        store_location,
        transaction_time,
        dayname(transaction_date),
        monthname(transaction_date);
------ Operates 7 days a week (Sun-Mon)


--- Query 10 Number of sales 
SELECT  COUNT(DISTINCT transaction_id) AS Number_of_Sales,
        COUNT(DISTINCT product_id) AS Number_of_products,
        COUNT(DISTINCT store_id) AS Number_of_stores,
        SUM(transaction_qty*unit_price) AS revenue_per_day
FROM workspace.default.bright_coffee_shop;
------ 149116 Sales, 80 products from the 3 stores


--- Query 11 chcecking the revenue per transaction
SELECT  transaction_id,
        transaction_date,
        dayname(transaction_date) AS Day_name,
        monthname(transaction_date) AS Month_name,
        transaction_qty*unit_price AS Revenue_per_transaction
FROM workspace.default.bright_coffee_shop;
------ Revenue per transaction


--- Query 12 checking the revenue per day per store loaction
SELECT  transaction_id,
        store_location,
        transaction_date,
        product_category AS Category,
        product_detail AS Item,
        dayname(transaction_date) AS Day_name,
        monthname(transaction_date) AS Month_name,
        COUNT(DISTINCT transaction_id) AS Number_of_sales,
        SUM(transaction_qty*unit_price) AS Revenue_per_day
FROM workspace.default.bright_coffee_shop
GROUP BY  transaction_id,
          store_location,
          transaction_date,
          Category,
          Item,
          Day_name,
          Month_name;
------ Revenue and transactions per Store Location per day based on Category and Item sold

--- Query 13 extracting purcashe times
SELECT  transaction_date,
        dayname(transaction_date) AS Day,
        monthname(transaction_date) AS Month,
        date_format(transaction_time, 'HH:MM:SS') AS Purchase_time,
        store_location
FROM workspace.default.bright_coffee_shop
LIMIT 10;


--- Query 14 Checking the days of operation in a week
SELECT  transaction_date,
        store_location,
        transaction_time,
        dayname(transaction_date) AS Day,
        monthname(transaction_date) AS Month,
        date_format(transaction_time, 'HH:MM:SS') AS Purchase_time,
        SUM(transaction_qty*unit_price) AS Revenue_per_day,
--- Creating Time Buckets for Business operations        
        CASE 
        WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '05:00:00' AND '08:59:59' THEN '01. Morning_Rush_Hour'
        WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '09:00:00' AND '11:59:59' THEN '02. Mid_Morning'
        WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '12:00:00' AND '15:59:59' THEN '03. Lunch'
        WHEN date_format(transaction_time, 'HH:MM:SS') BETWEEN '16:00:00' AND '17:59:59' THEN '04. Evening'
        ELSE '05. Night' 
        END AS time_classification

--- Creating week day and weekend buckets
        
FROM workspace.default.bright_coffee_shop
GROUP BY  transaction_date,
          store_location,
          transaction_time
LIMIT 15;

