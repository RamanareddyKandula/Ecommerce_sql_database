** Ecommerce Analysis – MySQL Project

==> Overview
This project demonstrates SQL-based analysis for an "Ecommerce dataset", focusing on customers, products, and orders.  
It includes queries for product categorization, pricing insights, customer order summaries, and optimization techniques using indexes and views.

---

==> Files in this Repository
==> ecommerce_analysis.sql → Contains all SQL scripts for table creation, sample data insertion, and analysis queries.
==> screenshots → Contains screenshots of query execution and outputs.
---

==> Database Structure
=> Tables
1. customers
   -id – Customer ID (Primary Key)
   - name – Customer name
   - email – Customer email
   - city – Customer city

2. products
   - id – Product ID (Primary Key)
   - name – Product name
   - category – Product category (e.g., Electronics, Footwear)
   - price – Price of the product

3. orders
   - id – Order ID (Primary Key)
   - customer_id – Links to `customers.id`
   - product_id – Links to `products.id`
   - quantity – Quantity ordered
   - order_date – Date of the order

---

==> Key Queries and Analysis
1. View All Customers, Products, and Orders**
   ```sql
   SELECT * FROM customers;
   SELECT * FROM products;
   SELECT * FROM orders;
   
2.based on catergory and order by name
   select * from products where category="Electronics" order by name asc ;
   
3.Query for catergory and total_price using group by aggergate function
select category,sum(price) as total_price from products group by category;

4.using inner join
select * from customers c inner join orders o on c.id=o.customer_id inner join products p on p.id = o.product_id;

5.Aggregate functions
select sum(price) as total,max(price) as maximum,min(price) as minimum, avg(price) as average from products;

6.Subsqueries
select name, price as second_highest_price from products where price=(select max(price) from products 
where price<(select max(price) from products));
 7.Using limit for getting top 1 
 select name, price as highest_price from products order by  price desc limit 1;

 
 7.Create view and using joining keys
 CREATE VIEW customer_order_summary AS
SELECT customers.name, COUNT(orders.id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;
 8.Getting view 
select * from customer_order_summary;

