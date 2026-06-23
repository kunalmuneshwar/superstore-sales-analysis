CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(255),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name TEXT,
    sales NUMERIC,
    quantity INT,
    discount NUMERIC,
    profit NUMERIC,
    year INT,
    month VARCHAR(20),
    shipping_days INT
); 

select * from superstore
alter table superstore drop column shipping_days;

SELECT COUNT(*)
FROM superstore;


/* Q1). Total sales , profit and orders */
SELECT
    ROUND(SUM(sales),2) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers
FROM superstore;

/* Q2). Sales by category */
select category , round(sum(sales),2) as Total_Sales from superstore
group by category ;

/* Q3).Profit by category */
select category , round(sum(profit),2) as Total_Profit from superstore
group by category ;

/* Q4).Sales by region */
select region , round(sum(sales),2) as Total_Sales from superstore
group by region 
order by Total_Sales desc ;

/* Q5). Top 10 customers by revenue */
select customer_name , round(sum(sales),2) as revenue from superstore
group by customer_name
order by revenue desc
limit 10 ;


/* Q6).loss making products  */
select product_name , round(sum(profit),2) as net_profit from superstore
group by product_name 
order by net_profit
limit 10;

/* Q7).Top 10 products */

select product_name , round(sum(sales),2) as total_sales from superstore
group by product_name 
order by total_sales desc
limit 10;

/* Q8).Discounted impact */
select discount*100 as discount,round(avg(profit),2) as avg_profit from superstore
group by discount
order by discount;

/* Q9). Monthly sales trend */ 
select date_trunc('month',order_date) as month , round(sum(sales),2) as total_sales from superstore
group by month 
order by month ;

/* Q10). Sales by Segment */ 
select segment , round(sum(sales),2) as Total_sales from superstore
group by segment 
order by Total_sales desc ; 





