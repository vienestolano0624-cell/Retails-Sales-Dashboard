SELECT * FROM retail.retail;

-- total orders

select count(*) as total_orders from retail.retail;


-- total sales, profit and orders
SELECT
    SUM(Net_sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM retail.retail;


-- total sales and profit by product category
select product_category, sum(Net_sales) as total_sales, sum(profit) as total_profit
from retail.retail 
group by product_category
order by total_sales desc;

-- top 10 products 
select product_name, sum(Net_sales) as total_sales, sum(profit) as total_profit
from retail.retail 
group by product_name
order by total_sales desc
limit 10;


-- sales and profit by month

select month as sales_month, sum(Net_sales) as monthly_sales, sum(profit) as monthly_profit
from retail.retail 
group by month
order by monthly_sales desc;

-- sales and profit by customer segment

select customer_segment, sum(Net_sales) as total_sales, sum(profit) as total_profit
from retail.retail 
group by customer_segment
order by total_sales desc;

-- sales by province 
select province, sum(Net_sales) as total_sales, sum(profit)  as total_profit
from retail.retail 
group by province
order by total_sales desc;

-- returned rate
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE
        WHEN returned = 'Yes' THEN 1
        ELSE 0
    END) AS returned_orders,
    ROUND(
        100.0 * SUM(CASE
            WHEN returned = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*), 2
    ) AS return_rate_pct
FROM retail.retail; 

-- products with low profit
select product_name, sum(Net_sales) as total_sales, sum(profit) as total_profit
from retail.retail
group by product_name 
having sum(profit) <=0
order by total_sales;




