use indexing;
-- global suparstore Data Analysis using sql
-- 1. find the total revenue  generated .
select * from superstore;
select ROUND(sum(sales), 2) as total_revanue
from superstore;

-- 2. find the segment wise distribution of the sales. 
select segment, ROUND(sum(sales), 2) as total_sales from superstore
group by segment;

-- 3.find the top 3 most profitable products.
SELECT `PRODUCT NAME`,ROUND(SUM(PROFIT), 2) AS Total_Profit
FROM SUPERSTORE
GROUP BY `PRODUCT NAME`
ORDER BY Total_Profit DESC
limit 3;


-- 4.how many orders are placed after january 2016.
select count(*) as orders_after_jan_2026
from superstore
where `order date` >'2016-01-31';

-- 5.how many states from austria are under.
select count(distinct state) as states_in_austria
from superstore
where country = 'austria';

-- 6. which products and subcategories are most and least profitable ?
select `product name`, round(sum(profit), 2) as total_profit
from superstore
group by `product name`
order by total_profit desc
limit 5;

-- 7.which customer segment contributes the most to the total revanue 
select segment, round(sum(sales), 2) total_revenue
from superstore
group by segment 
order by total_revenue desc;

-- 8. What is the year-over-year growth in sales and Profit?
SELECT YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
ROUND(SUM(Sales), 2) AS Total_Sales,
ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore
GROUP BY Year
ORDER BY Year;

-- 9. Which countries and cities are driving the highest sales?
select country,city,Round(sum(sales), 2) from superstore
group by country, city
order by sum(sales) desc
limit 10;


-- 10. What is the average delivery time from order to ship date across regions?
SELECT Region, COUNT(*) AS n_orders,
ROUND(AVG(DATEDIFF(STR_TO_DATE(`Ship Date`,'%d-%m-%Y'),
STR_TO_DATE(`Order Date`,'%d-%m-%Y'))),0) AS avg_delivery_days
FROM Superstore
GROUP BY Region
ORDER BY avg_delivery_days desc;

-- 11. what is the profit distribution across order priority
SELECT 
    `Order Priority`,
    COUNT(*) AS Num_Orders,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Profit), 2) AS Avg_Profit_Per_Order
FROM superstore
GROUP BY `Order Priority`
ORDER BY Total_Profit DESC;

-- 12. Suggest data-driven recommendations for improving profit and reducing losses.
-- 1. Optimize Product Portfolio
-- 2. Re-evaluate Discount Strategy 
-- 3. Improve Delivery Efficiency
-- 4. Focus Marketing on High-Margin Products
-- 5. Prioritize the Most Profitable Customer Segment
-- 6. Regional and Country Strategy
-- 7. Order Priority & Shipping Cost Review
-- 8. Monitor Year-over-Year Trends
-- 9. Leverage Data Dashboards
-- 10. Continuous Review Cycle