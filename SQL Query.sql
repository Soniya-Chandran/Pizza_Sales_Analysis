--Select and Open the Data for analysis--
SELECT * FROM pizza_sales ;

--Calculating the Total Revenue from the given data--
SELECT ROUND(SUM(total_price),4) AS Total_Revenue FROM pizza_sales;

--The Average Order Value by dividing the total revenue and total orders-- 
SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id),2) as Average_Order_Value FROM pizza_sales ;

--The Total Number of pizzas sold during the assessment period--
SELECT SUM(quantity) AS Total_Quantity_Sold FROM pizza_sales ;

--How many total Orders have received--
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales ;

--Calculate the Average Pizzas Per Order--
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_Piazz_per_Order FROM pizza_sales ;

-- Find out the Daily Trend for total orders--
SELECT DATENAME(DW,order_date) AS Day_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date);

-- Find out the monthly Trend for total orders--
SELECT DATENAME(MONTH,order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date);

--What is the Percentage of sales by pizza category--
SELECT	pizza_category,ROUND(SUM(total_price),2) AS Total_Revenue,
		ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS perc_Revenue
FROM pizza_sales
GROUP BY pizza_category
ORDER BY perc_Revenue desc;

--What is the Percentage of sales by pizza size--
SELECT	pizza_size,ROUND(SUM(total_price),2) AS Total_Revenue,
		ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM pizza_sales),2) AS perc_Revenue
FROM pizza_sales
GROUP BY pizza_size
ORDER BY perc_Revenue desc;

--Find out the total pizza sold by pizza category--
SELECT pizza_category, SUM(quantity) as Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY 2 DESC;

--Top 5 best sellers by Revenue, Total Quantity and Total Orders--
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC;

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC;

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 DESC;

--Bottom  5 best sellers by Revenue, Total Quantity and Total Orders--
SELECT TOP 5 pizza_name,ROUND(SUM(total_price),2) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 ;

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 ;

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY 2 ;