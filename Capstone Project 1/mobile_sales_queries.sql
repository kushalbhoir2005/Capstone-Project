-- Create Database
create database Mobile_Sales;

-- Use Database
USE Mobile_Sales;

-- Total Revenue
SELECT 
    SUM(`Units Sold` * `Price Per Unit`) AS total_revenue
FROM cleaned_mobile_sales_data;

-- Brand-wise Revenue
SELECT 
    Brand,
    SUM(`Units Sold` * `Price Per Unit`) AS revenue
FROM cleaned_mobile_sales_data
GROUP BY Brand
ORDER BY revenue DESC;

-- City-wise Sales
SELECT 
    City,
    SUM(`Units Sold` * `Price Per Unit`) AS revenue
FROM cleaned_mobile_sales_data
GROUP BY City
ORDER BY revenue DESC;

-- Monthly Sales Trend
SELECT 
    Month,
    SUM(Revenue) AS total_revenue
FROM cleaned_mobile_sales_data
GROUP BY Month
ORDER BY Month;

-- Customer Ratings by Brand
SELECT 
    Brand,
    AVG(`Customer Ratings`) AS avg_rating
FROM cleaned_mobile_sales_data
GROUP BY Brand
ORDER BY avg_rating DESC;

-- Payment Method Analysis
SELECT 
    `Payment Method`,
    COUNT(*) AS total_transactions
FROM cleaned_mobile_sales_data
GROUP BY `Payment Method`
ORDER BY total_transactions DESC;

-- Top Selling Mobile Models
SELECT 
    `Mobile Model`,
    SUM(`Units Sold`) AS total_units_sold
FROM cleaned_mobile_sales_data
GROUP BY `Mobile Model`
ORDER BY total_units_sold DESC;

-- Weekend vs Weekday Sales
SELECT 
    CASE 
        WHEN `Day Name` IN ('Saturday', 'Sunday') THEN 'Weekend'
        ELSE 'Weekday'
    END AS sales_type,
    SUM(Revenue) AS revenue
FROM cleaned_mobile_sales_data
GROUP BY sales_type;