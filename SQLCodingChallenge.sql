--- Creating a Database Name SQLCodingChallangeDB--

CREATE DATABASE SQLCodingChallangeDB

-- Now Creating a Tables In DB__

--Customers table

CREATE TABLE customers (
customer_id INT IDENTITY PRIMARY KEY,
name VARCHAR(255),
email VARCHAR(255),
password VARCHAR(255)
)

-- Products Table

CREATE TABLE products (
product_id INT IDENTITY PRIMARY KEY,
name VARCHAR(255),
price DECIMAL(10, 2),
description TEXT,
stockQuantity INT
)

-- Cart Table

CREATE TABLE cart (
cart_id INT IDENTITY PRIMARY KEY,
customer_id INT,
 product_id INT,
quantity INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
)

--orders table

CREATE TABLE orders (
order_id INT IDENTITY PRIMARY KEY,
customer_id INT,
order_date DATETIME,
total_price DECIMAL(10, 2),
shipping_address TEXT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
)


--order_items table (to store order details)

CREATE TABLE order_items (
order_item_id INT IDENTITY PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
)

--- Inserting Records in Tables



INSERT INTO products (name, description, price, stockQuantity)
VALUES
('Laptop', 'High-performance laptop', 800.00, 10),
('Smartphone', 'Latest smartphone', 600.00, 15),
('Tablet', 'Portable tablet', 300.00, 20),
('Headphones', 'Noise-canceling', 150.00, 30),
('TV', '4K Smart TV', 900.00, 5),
('Coffee Maker', 'Automatic coffee maker', 50.00, 25),
('Refrigerator', 'Energy-efficient', 700.00, 10),
('Microwave Oven', 'Countertop microwave', 80.00, 15),
('Blender', 'High-speed blender', 70.00, 20),
('Vacuum Cleaner', 'Bagless vacuum cleaner', 120.00, 10)

ALTER TABLE Customers
ADD FirstName Varchar(255), LastName Varchar(255), address Varchar(255)

ALTER TABLE Customers
DROP COLUMN name, password


INSERT INTO customers (FirstName , lastName, email, address)
VALUES
('John', 'Doe', 'johndoe@example.com', '123 Main St, City'),
('Jane', 'Smith', 'janesmith@example.com', '456 Elm St, Town'),
('Robert', 'Johnson', 'robert@example.com', '789 Oak St, Village'),
('Sarah', 'Brown', 'sarah@example.com', '101 Pine St, Suburb'),
('David', 'Lee', 'david@example.com', '234 Cedar St, District'),
('Laura', 'Hall', 'laura@example.com', '567 Birch St, County'),
('Michael', 'Davis', 'michael@example.com', '890 Maple St, State'),
('Emma', 'Wilson', 'emma@example.com', '321 Redwood St, Country'),
('William', 'Taylor', 'william@example.com', '432 Spruce St, Province'),
('Olivia', 'Adams', 'olivia@example.com', '765 Fir St, Territory')


ALTER TABLE orders
DROP COLUMN shipping_address


INSERT INTO orders (customer_id, order_date, total_price)
VALUES
(1, '2023-01-05', 1200.00),
(2, '2023-02-10', 900.00),
(3, '2023-03-15', 300.00),
(4, '2023-04-20', 150.00),
(5, '2023-05-25', 1800.00),
(6, '2023-06-30', 400.00),
(7, '2023-07-05', 700.00),
(8, '2023-08-10', 160.00),
(9, '2023-09-15', 140.00),
(10, '2023-10-20', 1400.00)


ALTER TABLE order_items 
ADD item_amount int


INSERT INTO order_items (order_id, product_id, quantity, item_amount)
VALUES
(1, 1, 2, 1600.00),
(1, 3, 1, 300.00),
(2, 2, 3, 1800.00),
(3, 5, 2, 1800.00),
(4, 4, 4, 600.00),
(4, 6, 1, 50.00),
(5, 1, 1, 800.00),
(5, 2, 2, 1200.00),
(6, 10, 2, 240.00),
(6, 9, 3, 210.00)

INSERT INTO cart (customer_id, product_id, quantity)
VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(3, 4, 4),
(3, 5, 2),
(4, 6, 1),
(5, 1, 1),
(6, 10, 2),
(6, 9, 3),
(7, 7, 2)

--------------------------------------------------------------------------------------------------------------------

--1. Update refrigerator product price to 800.

UPDATE products
SET price = 800 WHERE name = 'Refrigerator'

-- 2. Remove all cart items for a specific customer.

DELETE FROM Cart
WHERE customer_id=7

--3. Retrieve Products Priced Below $100.

SELECT * FROM Products p
WHERE p.price<100


--4. Find Products with Stock Quantity Greater Than 5.

SELECT * FROM Products p
WHERE p.stockQuantity>5


--5. Retrieve Orders with Total Amount Between $500 and $1000.

SELECT * FROM orders o
WHERE o.total_price BETWEEN 500 AND 1000 


--6. Find Products which name end with letter ‘r’.

SELECT * FROM products p
Where P.name LIKE '%r'


--7. Retrieve Cart Items for Customer 5.

SELECT * FROM cart c
WHERE c.customer_id=5


--8. Find Customers Who Placed Orders in 2023.

SELECT c.firstName, c.LastName, C.email, o.order_date
FROM customers c
JOIN orders o ON
c.customer_id = o.customer_id
WHERE YEAR(o.order_date)=2023


--9. Determine the Minimum Stock Quantity for Each Product Category.

ALTER TABLE products
ADD category VARCHAR(255) 

UPDATE products
SET category = 'Electronics'
SELECT * FROM products

SELECT category, MIN(stockQuantity) AS miniStockQuantiy
FROM products
GROUP BY category


--10. Calculate the Total Amount Spent by Each Customer.

SELECT c.customer_id, c.firstName, c.lastName, SUM(o.total_price) Total_amount_spent
FROM customers c
JOIN orders o ON
c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName



--11. Find the Average Order Amount for Each Customer.

SELECT c.customer_id, c.firstName, c.lastName, AVG(o.total_price) Average_order_amount
FROM customers c
JOIN orders o ON
c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName


-- 12. Count the Number of Orders Placed by Each Customer.

SELECT c.customer_id, c.firstName, c.lastName, COUNT(o.order_id) AS num_orders
FROM customers c
JOIN orders o ON
c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName


--13. Find the Maximum Order Amount for Each Customer.

SELECT c.customer_id, c.firstName, c.lastName, MAX(o.total_price) Total_amount_spent
FROM customers c
JOIN orders o ON
c.customer_id = o.customer_id
GROUP BY c.customer_id, c.firstName, c.lastName
ORDER BY Total_amount_spent DESC


-- 14. Get Customers Who Placed Orders Totaling Over $1000

SELECT c.customer_id, c.firstName, c.lastName, o.total_price
FROM customers c
JOIN orders o ON
C.customer_id = o.customer_id
WHERE o.total_price>1000


--15. Subquery to Find Products Not in the Cart.

SELECT p.name, p.product_id
FROM products p
WHERE p.product_id NOT IN (SELECT product_id FROM cart)

--16. Subquery to Find Customers Who Haven't Placed Orders.

SELECT c.customer_id, C.firstName, c.lastName 
FROM customers c
WHERE c.customer_id NOT IN (SELECT o.customer_id from orders o)


--17. Subquery to Calculate the Percentage of Total Revenue for a Product.

DECLARE @ProductID int=1 

SELECT product_id,name,price,
(price / (SELECT SUM(price) FROM products)) * 100 AS percentage_of_total_revenue
FROM products
WHERE product_id= @ProductID


--18. Subquery to Find Products with Low Stock.

SELECT p.product_id ,p.name, P.stockQuantity
FROM products p 
WHERE p.stockQuantity < (SELECT AVG(stockQuantity) FROM products)

-- 19. Subquery to Find Customers Who Placed High-Value Orders.

SELECT o.customer_id, o.order_id, o.total_price 
FROM orders o
WHERE o.total_price > (SELECT AVG(total_price) FROM orders)

----------------------------------------------------------------------------------------------------------------------------------
