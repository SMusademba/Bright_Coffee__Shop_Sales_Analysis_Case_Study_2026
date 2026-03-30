SELECT  
--- Dates
        transaction_date AS purchase_date,
        dayname(transaction_date) AS Day,
        monthname(transaction_date) AS Month,
        dayofmonth(transaction_date) AS Date,

--- Weekend and weekday
        CASE
                WHEN dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
                ELSE 'Weekday'
        END AS day_classication,        

--- Operating hours
        CASE
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '08:59:59' THEN '1. Rush_Hour'
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '09:00:00' AND '11:59:59' THEN '2. Breakfast'
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '15:59:59' THEN '3. Lunch'
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '16:00:00' AND '23:59:59' THEN '4. Evening'
        END AS time_classification,

--- Count of Transactions, products and store locations
        COUNT(DISTINCT transaction_id) AS Number_of_sales,
        COUNT(DISTINCT product_id) AS Number_of_products,
        COUNT(DISTINCT store_id) AS Number_of_stores,

--- Revenue per day
        SUM(transaction_qty*unit_price) AS Revenue_per_day,

--- Revenue classifications
        ---Customer Spend Buckets
        CASE
                WHEN Revenue_per_day <=4 THEN '01. Low_spend'
                WHEN Revenue_per_day BETWEEN 5 AND 8 THEN '02. Medium_spend'
                ELSE '03. High_spend'
        END AS revenue_classification,

--- Categorical columns
        store_location,
        product_category,
        product_detail
FROM workspace.default.bright_coffee_shop
GROUP BY transaction_date,
        dayname(transaction_date),
        monthname(transaction_date),
        dayofmonth(transaction_date),
        CASE
                WHEN dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
                ELSE 'Weekday'
        END,        

        CASE
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '05:00:00' AND '08:59:59' THEN '1. Rush_Hour'
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '09:00:00' AND '11:59:59' THEN '2. Breakfast'
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '15:59:59' THEN '3. Lunch'
                WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '16:00:00' AND '23:59:59' THEN '4. Evening'
        END,
        store_location,
        product_category,
        product_detail;