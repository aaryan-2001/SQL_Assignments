--CREATING DATABASE
CREATE DATABASE TechShop

-- CREARTING TABLES
CREATE TABLE Customers(
	CustomerID INT Primary Key,
	FirstName VARCHAR(200) NOT NULL,
	LastName VARCHAR(200) NOT NULL,
	Email VARCHAR(200) NOT NULL,
	Phone VARCHAR(20),
	Address VARCHAR(200)
 )

 CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price NUMERIC(10, 2)
)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount NUMERIC(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE OrderDetail(
	OrderDetailID INT Primary Key,
	OrderID INT,
	ProductID INT,
	Quantity INT,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

CREATE TABLE Inventory (
	InventoryID INT Primary Key,
	ProductID INT, 
	QuantityInStock INT,
	LastStockUpdate DATE,
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)



-------------------------------------------------------------------------------------------------------------------

-- INSERTING VALUES TO TABLE

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
('1','Aarav', 'Gupta', 'aarav.gupta@email.com', '9876789655', 'Burhanpur india'),
('2','Ishita', 'Patel', 'ishita.patel@email.com', '8765478952', 'Pune india'),
('3','Vivaan', 'Sharma', 'vivaan.sharma@email.com', '76543451230', 'mumbai india'),
('4','Anaya', 'Verma', 'anaya.verma@email.com', '6543278523', 'Burhanpur india'),
('5','Advait', 'Reddy', 'advait.reddy@email.com', '8765474562', 'Pune india'),
('6','Myra', 'Kumar', 'myra.kumar@email.com', '3456774123', 'mumbai india'),
('7','Arjun', 'Singh', 'arjun.singh@email.com', '2345674120', 'Burhanpur india'),
('8','Aisha', 'Yadav', 'aisha.yadav@email.com', '6789078562', 'Pune india'),
('9','Kabir', 'Mishra', 'kabir.mishra@email.com', '1234567890', 'mumbai india'),
('10','Zara', 'Rao', 'zara.rao@email.com', '5678946464', 'Burhanpur india');



INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
('1','Masala Chai', 'Spiced Indian tea blend', 3.99),
('2','Saree', 'Traditional Indian attire', 49.99),
('3','Biryani Spice Mix', 'Authentic blend for biryani', 2.49),
('4','Kumkum Powder', 'Traditional red powder used in rituals', 1.99),
('5','Tabla Instrument', 'Traditional Indian percussion instrument', 149.99),
('6','Ayurvedic Face Cream', 'Natural skincare product', 14.99),
('7','Handwoven Silk Shawl', 'Luxurious silk shawl', 29.99)


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2023-11-01', 25.99),
(2, 2, '2023-11-02', 49.95),
(3, 3, '2023-11-03', 15.75),
(4, 4, '2023-11-04', 32.50),
(5, 5, '2023-11-05', 75.49),
(6, 6, '2023-11-06', 20.99),
(7, 7, '2023-11-07', 40.00),
(8, 8, '2023-11-08', 55.25),
(9, 9, '2023-11-09', 18.99),
(10, 10, '2023-11-10', 30.45)

INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(101, 1, 1, 2),
(102, 2, 3, 1),
(103, 3, 5, 3),
(104, 4, 2, 1),
(105, 5, 7, 2),
(106, 6, 4, 1),
(107, 7, 3, 4),
(108, 8, 2, 1),
(109, 9, 4, 3),
(110, 10, 2, 2)

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1001, 1, 50, '2023-11-01'),
(1002, 2, 30, '2023-11-02'),
(1003, 3, 100, '2023-11-03'),
(1004, 4, 20, '2023-11-04'),
(1005, 5, 10, '2023-11-05'),
(1006, 6, 75, '2023-11-06'),
(1007, 7, 40, '2023-11-07')

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to retrieve the names and emails of all customers. 

SELECT FirstName+' '+ LastName as Name, Email FROM Customers

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to list all orders with their order dates and corresponding customer names.

SELECT OrderDate, FirstName+' '+ LastName as Name 
FROM Orders , Customers
WHERE Orders.CustomerID = Customers.CustomerID

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to insert a new customer record into the "Customers" table. Include 
--customer information such as name, email, and address.

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
('11', 'Aryan', 'Shah', 'aryan.shah@gmail.com', '458963210','MP India')

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to update the prices of all electronic gadgets in the "Products" table by  increasing them by 10%.
UPDATE Products
SET Price = Price*1.10 --1.10 is equivalent to 10%
WHERE Category = 'Electronic'


-------------------------------------------------------------------------------------------------------------------


--Write an SQL query to delete a specific order and its associated order details from the 
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.

DECLARE @od INT =11

DELETE FROM OrderDetail 
WHERE OrderID=@od
DELETE FROM Orders
WHERE OrderID=@od

SELECT * FROM OrderDetail
-------------------------------------------------------------------------------------------------------------------

-- Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, 
--order date, and any other necessary information.

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(11, 1, '2023-11-15', 99.99)

SELECT * FROM Orders

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to update the contact information (e.g., email and address) of a specific 
--customer in the "Customers" table. Allow users to input the customer ID and new contact information

UPDATE Customers 
SET FirstName = 'Vikram', LastName = 'Shroff', Email='Vikram.Shroff@gmail.com', Phone='5896214760', Address='Port Blair' 
WHERE CustomerID=3

SELECT * FROM Customers

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to recalculate and update the total cost of each order in the "Orders" 
--Table based on the prices and quantities in the "OrderDetails" table.

UPDATE Orders 
SET TotalAmount = (SELECT SUM(Price*Quantity) FROM OrderDetail, Products 
WHERE OrderID =Orders.OrderID)

SELECT * FROM Orders


-------------------------------------------------------------------------------------------------------------------


--Write an SQL query to delete all orders and their associated order details for a specific 
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID 
--as a parameter.

DECLARE @CustID INT = 10

DELETE FROM OrderDetail 
WHERE OrderID=(
SELECT OrderID FROM Orders WHERE CustomerID = @CustID
)

DELETE FROM Orders
WHERE CustomerID = @CustID


-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details.


INSERT INTO Products(ProductID, ProductName, Description, Price, Category)
VALUES
(8, 'TV', 'Entertainment product', '900.00','Electronic'),
(9, 'washing machine',' Automatic cloth cleaner', '500','Electronic')

Select * From products

-------------------------------------------------------------------------------------------------------------------

--Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from 
--"Pending" to "Shipped"). Allow users to input the order ID and the new status.

ALTER TABLE Orders
ADD Status varchar(100) DEFAULT 'pending'

UPDATE Orders 
SET Status = 'Pending' 
WHERE Status IS NULL	--this is to update the new status from pending to shipped

DECLARE @Update_OrderID INT = 1 -- declaring the variables here using declare @ AS USER INPUT
DECLARE @New_Status VARCHAR(50) = 'Shipped'

UPDATE Orders
SET Status = @New_Status
WHERE OrderID = @Update_OrderID

Select * From Orders


-------------------------------------------------------------------------------------------------------------------

-- Write an SQL query to calculate and update the number of orders placed by each customer 
--in the "Customers" table based on the data in the "Orders" table.

ALTER TABLE Customers
ADD TotalOrders INT

UPDATE Customers
SET TotalOrders=(
SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID
)


-------------------------------------------------------------------------------------------------------------------

--# Aggregate Functions

--1.Write an SQL query to find out which customers have not placed any orders.

SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL



-------------------------------------------------------------------------------------------------------------------

--2. Write an SQL query to find the total number of products available for sale.

SELECT COUNT(*) FROM Products

-------------------------------------------------------------------------------------------------------------------

--3. Write an SQL query to calculate the total revenue generated by TechShop. 

SELECT SUM(TotalAmount) AS REVENUE FROM Orders

-------------------------------------------------------------------------------------------------------------------

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category. 
--Allow users to input the category name as a parameter.

DECLARE @CatName VARCHAR(50) = 'Electronic'
 
 SELECT AVG(Quantity) FROM OrderDetail
 WHERE ProductID IN (SELECT ProductID FROM Products WHERE Category = @CatName)

-------------------------------------------------------------------------------------------------------------------

--5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users 
--to input the customer ID as a parameter.


DECLARE @CName int = 1
 
 SELECT SUM(TotalAmount) FROM Orders
 WHERE CustomerID = @CName


 -------------------------------------------------------------------------------------------------------------------

 --Write an SQL query to find the customers who have placed the most orders. List their names 
--and the number of orders they've placed.

SELECT TOP 1 C.FirstName, C.LastName, (
SELECT COUNT(*)
FROM Orders O
WHERE O.CustomerID = C.CustomerID
) 
AS OrderCount
FROM Customers C
ORDER BY OrderCount DESC
 
--------------------------------------------------------------------------------------------------------------------

--7. Write an SQL query to find the most popular product category, which is the one with the highest 
--total quantity ordered across all orders

SELECT P.Category, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P 
JOIN  OrderDetail OD ON
P.ProductID = OD.ProductID
GROUP BY P.Category
ORDER BY TotalQuantityOrdered DESC 

-------------------------------------------------------------------------------------------------------------------

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue
--on electronic gadgets. List their name and total spending.

SELECT C.CustomerID, C.FirstName, SUM(O.TotalAmount) AS TA
FROM Customers C
JOIN Orders O ON
C.CustomerID = O.CustomerID
JOIN OrderDetail OD ON
O.OrderID = OD.OrderID
JOIN Products P ON
P.ProductID = OD.ProductID
WHERE P.Category = 'Electronic'
GROUP BY C.CustomerID, C.FirstName, O.TotalAmount
ORDER BY TA DESC

-------------------------------------------------------------------------------------------------------------------

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of 
--orders) for all customers.

SELECT AVG(TotalAmount) FROM Orders

-------------------------------------------------------------------------------------------------------------------


--10. Write an SQL query to find the total number of orders placed by each customer and list their 
--names along with the order count

SELECT C.FirstNAME, C.LastName, COUNT(O.OrderID) AS OCount 
FROM Customers C
LEFT JOIN Orders O ON
C.CustomerID = O.CustomerID
GROUP BY C.CustomerID,
C.FirstName, C.LastName
ORDER BY OCount DESC

-------------------------------------------------------------------------------------------------------------------

--JOINS

--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., 
--customer name) for each order.

SELECT C.FirstName, C.LastName, C.Email, C.Phone, C.Address, O.OrderDate, O.TotalAmount 
FROM Customers C
lEFT JOIN Orders O ON
C.CustomerID =  O.CustomerID

-------------------------------------------------------------------------------------------------------------------

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue

SELECT P.Category, P.ProductName, SUM(OD.Quantity* P.Price) AS TotalRevenue
FROM Products P 
LEFT JOIN  OrderDetail OD ON
P.ProductID = OD.ProductID
WHERE P.Category = 'Electronic'
GROUP BY P.Category, P.ProductName
ORDER BY TotalRevenue

-------------------------------------------------------------------------------------------------------------------

--3. Write an SQL query to list all customers who have made at least one purchase. Include their 
--names and contact information.

SELECT DISTINCT C.FirstName, C.LastName, C.Email, C.Phone 
FROM Customers C
RIGHT JOIN Orders O ON
C.CustomerID = O.CustomerID

--NOT WORKING....need to check after

-------------------------------------------------------------------------------------------------------------------

--4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest 
--total quantity ordered. Include the product name and the total quantity ordered.


SELECT P.Category, P.ProductName, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P 
JOIN  OrderDetail OD ON
P.ProductID = OD.ProductID
WHERE P.Category = 'Electronic'
GROUP BY P.Category, P.ProductName
ORDER BY TotalQuantityOrdered DESC

-------------------------------------------------------------------------------------------------------------------


--6. Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value

SELECT C.FirstName, C.LastName , C.CustomerID, AVG(O.TotalAmount) 
AS AverageOrderValue  
FROM Customers C
LEFT JOIN Orders O ON
C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName

Select * From Orders

-------------------------------------------------------------------------------------------------------------------

--7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.

SELECT TOP 1 C.FirstName, C.LastName , C.CustomerID, O.OrderID, O.TotalAmount
AS TotalRevenue  
FROM Customers C
LEFT JOIN Orders O ON
C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName, O.TotalAmount, O.OrderID
ORDER BY O.TotalAmount DESC

--Need to check
-------------------------------------------------------------------------------------------------------------------

 -- 8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

SELECT P.ProductID, P.ProductName, P.Category, COUNT(OD.OrderID)
FROM Products P
JOIN OrderDetail OD ON
P.ProductID = OD.ProductID
WHERE P.Category = 'Electronic'
GROUP BY P.ProductID, P.ProductName, P.Category

-------------------------------------------------------------------------------------------------------------------

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.

DECLARE @ProductName VARCHAR(50) = 'TV'

SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customers C 
JOIN Orders O ON 
C.CustomerID = O.CustomerID
JOIN OrderDetail OD ON 
O.OrderID = OD.OrderID
JOIN Products P ON 
OD.ProductID = P.ProductID
WHERE P.ProductName = @ProductName  


-------------------------------------------------------------------------------------------------------------------

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters.

DECLARE @StartDate DATE = '2023-11-01'
DECLARE @EndDate DATE = '2023-11-29'

SELECT SUM(OD.Quantity* P.Price) AS TotalRevenue
FROM Products P 
LEFT JOIN  OrderDetail OD ON
P.ProductID = OD.ProductID

-------------------------------------------------------------------------------------------------------------------

