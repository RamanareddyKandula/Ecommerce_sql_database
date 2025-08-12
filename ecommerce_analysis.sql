CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);



INSERT INTO products VALUES 
(1, 'Laptop', 'Electronics', 75000),
(2, 'Mobile', 'Electronics', 20000),
(3, 'Shoes', 'Footwear', 3000);


INSERT INTO orders VALUES 
(101, 1, 1, 1, '2025-08-01'),
(102, 2, 2, 2, '2025-08-03'),
(103, 3, 3, 3, '2025-08-05'),
(104, 1, 3, 1, '2025-08-06');





INSERT INTO orders VALUES 
(105, 5, 5, 1, '2025-08-07'),
(106, 6, 6, 2, '2025-08-07'),
(107, 7, 7, 1, '2025-08-08'),
(108, 8, 8, 2, '2025-08-08'),
(109, 9, 9, 1, '2025-08-09'),
(110, 10, 10, 1, '2025-08-09'),
(111, 1, 2, 2, '2025-08-10'),
(112, 2, 4, 1, '2025-08-10'),
(113, 3, 6, 3, '2025-08-11'),
(114, 4, 8, 1, '2025-08-11'),
(115, 5, 10, 1, '2025-08-12'),
(116, 6, 3, 2, '2025-08-12'),
(117, 7, 5, 1, '2025-08-13'),
(118, 8, 7, 2, '2025-08-13'),
(119, 9, 9, 1, '2025-08-14'),
(120, 10, 1, 1, '2025-08-14');





select * from customers;

select * from products;
select * from orders;
select * from products where category="Electronics" order by name asc ;
select category,sum(price) as total_price from products group by category;


select * from customers c inner join orders o on c.id=o.customer_id inner join products p on p.id = o.product_id;

select sum(price) as total,max(price) as maximum,min(price) as minimum, avg(price) as average from products;

select name, price as second_highest_price from products where price=(select max(price) from products 
where price<(select max(price) from products));
 
 select name, price as highest_price from products order by  price desc limit 1;
 
CREATE VIEW customer_order_summary AS
SELECT customers.name, COUNT(orders.id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;
 
 select * from customer_order_summary;

 

create index idx_orders_customer_id on  orders(customer_id);

SELECT * FROM orders WHERE customer_id = 5;

