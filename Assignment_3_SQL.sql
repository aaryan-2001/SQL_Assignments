
-- CREATE DATABASE FOR ASSIGNMNET 3

CREATE DATABASE HMBank

-------------------------------------------------------------------------------------------------------------------------

-- Customers table
CREATE TABLE Customers (
customer_id INT PRIMARY KEY IDENTITY,
first_name VARCHAR(255),
last_name VARCHAR(255),
DOB DATE,
email VARCHAR(255),
phone VARCHAR(20),
address VARCHAR(255)
)

-- Accounts table
CREATE TABLE Accounts (
account_id INT PRIMARY KEY IDENTITY,
customer_id INT,
account_type VARCHAR(50),
balance DECIMAL(10, 2),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
)


-- Transactions table
CREATE TABLE Transactions (
transaction_id INT PRIMARY KEY IDENTITY,
account_id INT,
transaction_type VARCHAR(50),
amount DECIMAL(10, 2),
transaction_date DATE,
FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
)

-------------------------------------------------------------------------------------------------------------------------

-- Inserting records into Customers 

INSERT INTO Customers (first_name, last_name, DOB, email, phone, address)
VALUES
('Aarav', 'Kumar', '1990-05-15', 'aarav.kumar@example.com', '9876543210', '123 Main Street, Delhi'),
('Isha', 'Sharma', '1985-09-22', 'isha.sharma@example.com', '8765432109', '456 Park Avenue, Mumbai'),
('Rahul', 'Verma', '1992-03-10', 'rahul.verma@example.com', '7654321098', '789 Oak Lane, Bangalore'),
('Aishwarya', 'Singh', '1988-12-03', 'aishwarya.singh@example.com', '6543210987', '101 Pine Road, Kolkata'),
('Vikram', 'Patel', '1995-07-18', 'vikram.patel@example.com', '5432109876', '202 Cedar Drive, Chennai'),
('Meera', 'Gupta', '1983-11-27', 'meera.gupta@example.com', '4321098765', '303 Maple Street, Hyderabad'),
('Aniket', 'Shah', '1998-02-14', 'aniket.shah@example.com', '3210987654', '404 Elm Avenue, Pune'),
('Priya', 'Das', '1980-08-31', 'priya.das@example.com', '2109876543', '505 Birch Lane, Ahmedabad'),
('Aditya', 'Mishra', '1993-06-25', 'aditya.mishra@example.com', '1098765432', '606 Pine Road, Jaipur'),
('Sanya', 'Rao', '1987-04-12', 'sanya.rao@example.com', '9876543210', '707 Cedar Drive, Lucknow')

-- Inserting records into Accounts table

INSERT INTO Accounts (customer_id, account_type, balance)
VALUES
(1, 'savings', 5000.00),
(2, 'current', 7500.50),
(3, 'savings', 3000.25),
(4, 'zero_balance', 0.00),
(5, 'current', 12000.75),
(6, 'savings', 8000.50),
(7, 'zero_balance', 0.00),
(8, 'current', 15000.25),
(9, 'savings', 6000.00),
(10, 'current', 9000.80)

-- Inserting records into Transactions table

INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date)
VALUES
(1, 'deposit', 1000.00, '2023-01-05'),
(2, 'withdrawal', 500.50, '2023-01-10'),
(3, 'deposit', 200.25, '2023-01-15'),
(4, 'deposit', 100.00, '2023-01-20'),
(5, 'withdrawal', 300.75, '2023-01-25'),
(6, 'transfer', 1000.50, '2023-01-30'),
(7, 'deposit', 50.00, '2023-02-05'),
(8, 'withdrawal', 200.25, '2023-02-10'),
(9, 'transfer', 500.00, '2023-02-15'),
(10, 'deposit', 300.80, '2023-02-20'),
(1, 'withdrawal', 200.50, '2023-02-25'),
(2, 'deposit', 150.75, '2023-03-05'),
(3, 'withdrawal', 50.25, '2023-03-10'),
(4, 'transfer', 200.00, '2023-03-15'),
(5, 'deposit', 120.50, '2023-03-20')

-------------------------------------------------------------------------------------------------------------------------

--2. Write SQL queries for the following tasks:
--1. Write a SQL query to retrieve the name, account type and email of all customers. 

SELECT C.customer_id, C.first_name, C.last_name, C.email, A.account_type
FROM Customers C
JOIN Accounts A ON 
C.customer_id = A.customer_id

-------------------------------------------------------------------------------------------------------------------------

--2. Write a SQL query to list all transaction corresponding customer.

SELECT C.customer_id , C.first_name, C.last_name, T.account_id, T.transaction_id, T.transaction_type
FROM Customers C
JOIN Accounts A ON
C.customer_id = A.customer_id
JOIN Transactions T ON
A.account_id = T.account_id

-------------------------------------------------------------------------------------------------------------------------

--3. Write a SQL query to increase the balance of a specific account by a certain amountUPDATE Accounts SET balance = 45000
WHERE customer_id = 5

-------------------------------------------------------------------------------------------------------------------------

--4. Write a SQL query to Combine first and last names of customers as a full_name.

SELECT (C.first_name +' '+ C.last_name)
AS Full_name
FROM Customers C

-------------------------------------------------------------------------------------------------------------------------

--5. Write a SQL query to remove accounts with a balance of zero where the account type is savings.
DELETE FROM Accounts
WHERE balance = 0.00 AND account_type = 'savings'

-------------------------------------------------------------------------------------------------------------------------

--6. Write a SQL query to Find customers living in a specific city.
SELECT * FROM Customers
WHERE address LIKE '%Delhi'

-------------------------------------------------------------------------------------------------------------------------

--7. Write a SQL query to Get the account balance for a specific account.

DECLARE @CustomerAccountID INT = 5

SELECT balance
FROM Accounts
WHERE customer_id = @CustomerAccountID

-------------------------------------------------------------------------------------------------------------------------

--8. Write a SQL query to List all current accounts with a balance greater than $1,000.

DECLARE @VALUE INT = 1000

SELECT account_id, customer_id, balance
FROM Accounts
WHERE balance > @VALUE

-------------------------------------------------------------------------------------------------------------------------

--9. Write a SQL query to Retrieve all transactions for a specific account.

SELECT * FROM Transactions
WHERE account_id = 5

-------------------------------------------------------------------------------------------------------------------------

--10. Write a SQL query to Calculate the interest accrued on savings accounts based on a given interest rate.

DECLARE @IntrestRate INT = 10

SELECT account_id, customer_id, account_type, (balance + balance * ( @IntrestRate)/100)
FROM Accounts 
WHERE account_type = 'savings'

SELECT * FROM Accounts

-------------------------------------------------------------------------------------------------------------------------

--11. Write a SQL query to Identify accounts where the balance is less than a specified overdraft limit.

DECLARE @OverDraft INT = 5000

SELECT * FROM Accounts
WHERE balance < @OverDraft

-------------------------------------------------------------------------------------------------------------------------

--12. Write a SQL query to Find customers not living in a specific city.

SELECT * FROM Customers
WHERE address NOT LIKE '%Delhi'

-------------------------------------------------------------------------------------------------------------------------

/*Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins

1. Write a SQL query to Find the average account balance for all customers. */

SELECT AVG(A.balance)
AS Avg_Balance
FROM Accounts A

-------------------------------------------------------------------------------------------------------------------------

--2. Write a SQL query to Retrieve the top 10 highest account balances

SELECT TOP 10 balance
FROM Accounts
ORDER BY balance DESC

-------------------------------------------------------------------------------------------------------------------------

--3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.
DECLARE @StartDate DATE = '2023-01-15'

SELECT T.account_id, A.customer_id , SUM(T.amount) AS TotalDeposit
FROM Transactions T
JOIN Accounts A ON
T.account_id = A.account_id
WHERE T.transaction_type = 'deposit' AND T.transaction_date = @StartDate 
GROUP BY T.account_id, A.customer_id

SELECT * FROM Transactions

-------------------------------------------------------------------------------------------------------------------------

-- 4. Write a SQL query to Find the Oldest and Newest Customers

SELECT MIN(DOB)
AS oldest_customer,
MAX(DOB) 
AS newest_customer
FROM Customers

-------------------------------------------------------------------------------------------------------------------------

--5. Write a SQL query to Retrieve transaction details along with the account type.
SELECT T.*, A.account_type 
FROM Transactions T
LEFT JOIN Accounts A ON
T.account_id = A.account_id

-------------------------------------------------------------------------------------------------------------------------

--6. Write a SQL query to Get a list of customers along with their account details.

SELECT C.*, A.account_id, A.account_type, A.balance 
FROM Customers C
JOIN Accounts A ON
C.customer_id = A.customer_id

-------------------------------------------------------------------------------------------------------------------------

--7. Write a SQL query to Retrieve transaction details along with customer information for specific account
SELECT C.*, T.*, A.account_type, A.balance 
FROM Transactions T
JOIN Accounts A ON
T.account_id = A.account_id
JOIN Customers C ON
A.customer_id = C.customer_id
WHERE A.account_id = 4

-------------------------------------------------------------------------------------------------------------------------

--8. Write a SQL query to Identify customers who have more than one account.
SELECT c.first_name, c.last_name, COUNT(A.account_id) as TotalAccount
FROM Customers C
JOIN Accounts A ON
C.customer_id = A.customer_id
GROUP BY A.customer_id, c.first_name, c.last_name
HAVING COUNT(A.account_id)>1
SELECT * FROM Accounts-------------------------------------------------------------------------------------------------------------------------

--9. Calculating the Difference in Transaction Amounts between Deposits and Withdrawals

SELECT account_id, SUM(amount * CASE WHEN transaction_type = 'deposit' THEN 1 ELSE -1 END) AS transaction_diff
FROM Transactions
GROUP BY account_id
SELECT * FROM Transactions------------------------------------------------------------------------------------------------------------------------

--10. Write a SQL query to Calculate the average daily balance for each account over a specified period.

------------------------------------------------------------------------------------------------------------------------

--11. Calculate the total balance for each account type.

SELECT A.account_type, SUM(A.balance) 
AS Total_Balance
FROM Accounts A
GROUP BY A.account_type

------------------------------------------------------------------------------------------------------------------------
--12. Identify accounts with the highest number of transactions order by descending order.
SELECT account_id, COUNT(*) AS TC
FROM Transactions
GROUP BY account_id
ORDER BY TC DESC

SELECT * FROM Transactions

------------------------------------------------------------------------------------------------------------------------

--13. List customers with high aggregate account balances, along with their account types.SELECT C.first_name, C.last_name, SUM(A.balance) AS Balance, A.account_typeFROM Customers CJOIN Accounts A ON
C.customer_id = A.customer_id
GROUP BY C.first_name, C.last_name, A.account_type
ORDER BY Balance DESC

------------------------------------------------------------------------------------------------------------------------

--14. Identify and list duplicate transactions based on transaction amount, date, and account


SELECT transaction_id, account_id, transaction_type, amount, transaction_date, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, transaction_type, amount, transaction_date, transaction_id
HAVING COUNT(*) > 1

------------------------------------------------------------------------------------------------------------------------

/* Tasks 4: Subquery and its type:

1. Retrieve the customer(s) with the highest account balance.*/

SELECT C.customer_id, C.first_name, C.last_name
FROM Customers C
WHERE C.customer_id =
(SELECT TOP 1 A.customer_id 
FROM Accounts A 
ORDER BY A.balance DESC ) 

------------------------------------------------------------------------------------------------------------------------

--2. Calculate the average account balance for customers who have more than one account

SELECT c.customer_id, c.first_name, c.last_name, AVG(a.balance) AS average_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE c.customer_id IN 
(SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(*) > 1)
GROUP BY c.customer_id, c.first_name, c.last_name

------------------------------------------------------------------------------------------------------------------------

--3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

SELECT account_id, transaction_id, transaction_type, amount
FROM Transactions
WHERE amount > 
(SELECT AVG(amount)
FROM Transactions
WHERE account_id IN 
(SELECT DISTINCT account_id FROM Transactions)
)

------------------------------------------------------------------------------------------------------------------------

--4. Identify customers who have no recorded transactions.

SELECT customer_id,first_name,last_name
FROM Customers
WHERE customer_id NOT IN 
(SELECT DISTINCT customer_id
FROM Transactions
)

------------------------------------------------------------------------------------------------------------------------

--5.Calculate the total balance of accounts with no recorded transactions.

SELECT a.account_id, a.account_type, a.balance
FROM Accounts a
WHERE a.account_id NOT IN
(SELECT DISTINCT t.account_id
FROM Transactions t
)

------------------------------------------------------------------------------------------------------------------------

--6. Retrieve transactions for accounts with the lowest balance.
SELECT T.* 
FROM Transactions T
WHERE T.account_id IN
(SELECT A.account_id FROM Accounts A 
WHERE A.balance = (SELECT MIN(balance) FROM Accounts A) )

------------------------------------------------------------------------------------------------------------------------

--7. Identify customers who have accounts of multiple types

SELECT C.customer_id, C.first_name, C.last_name
FROM Customers C
WHERE C.customer_id IN
(SELECT A.customer_id FROM Accounts A 
GROUP BY A.customer_id
HAVING COUNT(DISTINCT account_type) > 1)

------------------------------------------------------------------------------------------------------------------------

--8. Calculate the percentage of each account type out of the total number of accounts.

SELECT account_type, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type

------------------------------------------------------------------------------------------------------------------------

--9. Retrieve all transactions for a customer with a given customer_id.
SELECT T.*
FROM Transactions T
WHERE T.account_id IN
(SELECT A.Account_id FROM Accounts A WHERE A.customer_id = 3)

------------------------------------------------------------------------------------------------------------------------

--10. Calculate the total balance for each account type, including a subquery within the SELECT clause.

SELECT A.account_type, SUM(A.balance) 
AS Total_Balance
FROM Accounts A
GROUP BY A.account_type

------------------------------------------------------------------------------------------------------------------------

