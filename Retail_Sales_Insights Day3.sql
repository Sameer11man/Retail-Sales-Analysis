-- 1. Monthly Sales & Profit

SELECT 
  `Order Date` AS Month,
  SUM(Sales) AS Total_Sales,
  SUM(Profit) AS Total_Profit
FROM sale.salesdata
GROUP BY Month
ORDER BY Month;

-- 2. Top Sub-Categories by Profit

SELECT `Sub-Category`, SUM(Profit) AS Total_Profit
FROM sale.SalesData
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC
LIMIT 5;


-- 3. Customer Sales Ranking (Window Function)

 SELECT `Customer Name` , Region, SUM(Sales) AS Total_Sales,
       RANK() OVER (PARTITION BY Region ORDER BY SUM(Sales) DESC) AS Regional_Rank
FROM sale.SalesData
GROUP BY `Customer Name`, Region;


-- 4. % of Total Sales by Segment

select segment ,sum(Sales) as segement_sales , 
round(SUM(Sales) * 100.0 / (select sum(Sales) from sale.salesdata) ,2) as sales_percentage
from sale.salesdata
group by segment

SELECT Segment, ROUND(SUM(Sales), 2) AS Segment_Sales,
ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM sale.SalesData), 2) AS Sales_Percent
FROM sale.salesdata
GROUP BY Segment

