-- Task 5 - SQL Joins (Inner, Left, Right, Full)

--  Create a new database
CREATE DATABASE Sales;
USE Sales;

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    Country VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    JoinDate DATE
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductName VARCHAR(100),
    OrderDate DATE,
	Price DECIMAL(10, 2),
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerName, Country, Email, JoinDate) VALUES
('Alice Johnson', 'USA', 'alice.johnson@gmail.com', '2023-01-15'),
('Bob Smith', 'UK', 'bob.smith@gmail.com', '2022-11-10'),
('Charlie Brown', 'Canada', 'charlie.brown@gmail.com', '2023-05-22'),
('David Lee', 'Australia', 'david.lee@gmail.com', '2021-07-18'),
('Eva Green', 'Germany', 'eva.green@gmail.com', '2022-09-05'),
('Frank Miller', 'France', 'frank.miller@gmail.com', '2023-02-14'),
('Avinash Singh', 'India', 'singhavi99@gmail.com', '2023-06-30');

-- A customer with no orders
INSERT INTO Customers (CustomerName, Country, Email)
VALUES ('No Order Customer', 'India', 'noorder@example.com');

--  Insert sample data into Orders
INSERT INTO Orders (CustomerID, ProductName, OrderDate, Price,  Quantity) VALUES
(1,'Laptop','2023-02-01', 40000.00, 2),
(1, 'Mouse', '2023-03-10',  20000.00,1),
(2, 'Keyboard', '2023-01-25',  65000.00,3),
(3, 'Monitor','2023-04-15',  10000.00,5),
(5, 'Printer','2023-05-20',  159999.00,1),
(6, 'Harddisk','2023-06-10',  80000.00,4);

-- Temporarily disable foreign key check to insert an orphan order
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO Orders (CustomerID, ProductName, OrderDate, Price, Quantity)
VALUES (999, 'Unlinked Product', '2023-07-01', 5000, 1);
SET FOREIGN_KEY_CHECKS = 1;

--  INNER JOIN - Customers who placed orders
SELECT Customers.CustomerID, Customers.CustomerName, Orders.ProductName, Orders.OrderDate, Orders.Price, Orders.Quantity
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN - All customers (even if no orders)
SELECT Customers.CustomerID, Customers.CustomerName, Customers.Country, Customers.Email,  Orders.ProductName, Orders.OrderDate,  Orders.Price, Orders.Quantity
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN - All orders (even if customer info is missing)
SELECT Customers.CustomerID, Customers.CustomerName, Orders.ProductName, Orders.OrderDate, Orders.Price, Orders.Quantity
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- FULL JOIN  using UNION
SELECT Customers.CustomerID, Customers.CustomerName,Customers.Country, Customers.Email, Orders.ProductName, Orders.OrderDate,Orders.Price, Orders.Quantity
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.CustomerName, Customers.Country, Customers.Email, Orders.ProductName, Orders.OrderDate,Orders.Price, Orders.Quantity
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;


