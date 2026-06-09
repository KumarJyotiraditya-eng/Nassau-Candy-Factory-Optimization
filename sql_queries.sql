select * from nassau_candy_cleaned
limit 5;

select `Product Name`, 
sum(sales) as Total_Sales
from nassau_candy_cleaned
group by `Product Name`
order by Total_Sales Desc;

show columns
from nassau_candy_cleaned;

#Top 10 Products by Sales
Create view Top_10_Products_by_Sales as
select `Product Name`,
round(sum(sales),2) as Total_Sales 
from nassau_candy_cleaned
group by `Product Name`
order by Total_Sales Desc
limit 10;

select * from Top_10_Products_by_Sales;

#Top 10 Products by Profit

Create view Top_Products_by_Profit as
select `Product Name`,
round(sum(`Gross Profit`),2) as Total_Profit
from nassau_candy_cleaned
group by `Product Name`
order by Total_Profit desc
limit 10 ;

select * from Top_Products_by_Profit;

#3: Region Performance
Create view Top_Region_Performance as
select `Product Name`, Region,
round(sum(Sales),2) as Total_sales,
round(sum(`Gross Profit`),2) as Total_Profit
from nassau_candy_cleaned
group by Region, `Product Name`
order by Total_sales desc, Total_profit desc
limit 10;

select * from Top_Region_Performance;

drop view if exists Top_Region_Performance;



select * from nassau_candy_cleaned;

#4: Division Analysis
create view Top_Division as
select Division,
round(sum(Sales),2) as Total_Sales,
round(sum(`Gross Profit`),2) as Profit
from nassau_candy_cleaned
group by Division
order by Total_Sales desc, Profit desc
limit 10;
select * from Top_Division;

drop view if exists Top_Division;

#5: Ship Mode Performance
Create view Ship_Mode as
select `Ship Mode`,
count(*) as Orders,
round(avg(Lead_Time),2) as Avg_Laed_Time
from nassau_candy_cleaned
group by `Ship Mode`
limit 10;

select * from Ship_Mode;

#6: Top States by Sales
Create view Top_States as
select `State/Province`,
round(sum(Sales),2) as Total_Sales,
round(sum(`Gross Profit`),2) as Profit
from nassau_candy_cleaned
group by `State/Province`
order by Total_Sales desc, Profit desc
limit 10;
select * from TOP_States;
select * from nassau_candy_cleaned;

# Year-wise Sales & Profit
select 
year(`Order Date`) as Order_Year,
round(sum(Sales),2) as Total_Sales,
round(sum(`Gross Profit`),2) as Profit
from nassau_candy_cleaned
group by Order_year
order by Order_year desc
limit 5;

#Month-wise Sales Trend
select 
month(`Order Date`) as Month_no,
monthname(`Order Date`) as Month_Name,
round(sum(sales),2) as sales
from nassau_candy_cleaned
group by Month_no, Month_Name
order by Month_no desc, Month_Name desc;

#Monthly Lead Time Analysis
select 
monthname(`Order Date`) as Month_Name,
round(avg(Lead_Time),2) as AVG_lead_time
from nassau_candy_cleaned
group by Month_Name
order by Avg_lead_time;

#Sales Trend by Year-Month
select 
date_format(`Order Date`, "%y-%m") as Year_Mont,
round(sum(sales),2) as Total_sales
from nassau_candy_cleaned
group by Year_Mont
order by Total_sales desc;

#Monthly_sales by Views
CREATE VIEW Monthly_Sales AS
SELECT
DATE_FORMAT(`Order Date`,'%Y-%m') AS Year_Mont,
ROUND(SUM(Sales),2) AS Total_Sales
FROM nassau_candy_cleaned
GROUP BY Year_Mont;
select * from Monthly_sales;

# Views Monthly_Profit
CREATE VIEW Monthly_Profit AS
SELECT
DATE_FORMAT(`Order Date`,'%Y-%m') AS Year_Mont,
ROUND(SUM(`Gross Profit`),2) AS Total_Profit
FROM nassau_candy_cleaned
GROUP BY Year_Mont;

select * from Monthly_Profit;

# Region vs Lead Time
SELECT
Region,
ROUND(AVG(`Lead_Time`),2) AS Avg_Lead_Time
FROM nassau_candy_cleaned
GROUP BY Region
ORDER BY Avg_Lead_Time DESC;

# Product vs Lead Time
SELECT
`Product Name`,
ROUND(AVG(`Lead_Time`),2) AS Avg_Lead_Time
FROM nassau_candy_cleaned
GROUP BY `Product Name`
ORDER BY Avg_Lead_Time DESC;

#State vs Lead Time
SELECT
`State/Province`,
ROUND(AVG(`Lead_Time`),2) AS Avg_Lead_Time
FROM nassau_candy_cleaned
GROUP BY `State/Province`
ORDER BY Avg_Lead_Time DESC
LIMIT 20;


select * from nassau_candy_cleaned;