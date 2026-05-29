
CREATE DATABASE ECOMMERCE_ASSIGNMENT_DB;
use ECOMMERCE_ASSIGNMENT_DB
--table customer
create table Customer(CustomerId int PRIMARY KEY identity, CustomerName varchar(100),Email varchar(50),
MobileNo BIGINT, City varchar(50),Address varchar(100) ,IsActive BIT ,CreatedDate DATETIME )

--table Seller

create table Seller(SellerId int PRIMARY KEY identity,SellerName varchar(100),Email varchar(100),
MobileNo BIGINT, City varchar(50),Rating int,IsActive BIT)


--Table Product
create table Product(ProductId INT  PRIMARY KEY identity,ProductName VARCHAR(100),Category VARCHAR(50),
 Price DECIMAL(10,2),StockQuantity INT,SellerId INT,CreatedDate DATETIME)

 --Table Orders
create table Orders(OrderId int PRIMARY KEY identity,CustomerId INT,OrderDate DATETIME,
OrderStatus Varchar(50), PaymentMode varchar(50),DeliveryCity varchar(50))
Drop table Orders
Exec sp_rename 'Ordersr' , 'Orders';

--Table OrderItem
create table OrderItem(OrderItemId INT primary key identity,OrderId int,ProductId int,
Quantity int,UnitPrice Decimal(10,2))



--8.Add foreign key relationship between Customer and Order
ALTER TABLE Orders
ADD CONSTRAINT fk_customer_orders
FOREIGN KEY(CustomerId)
REFERENCES Customer(CustomerId);







--9.	Add foreign key relationship between Seller and Product.
ALTER TABLE Product
ADD CONSTRAINT fk_seller_product
FOREIGN KEY(SellerId)
REFERENCES Seller(SellerId);

--10.	Add foreign key relationship between Orders and OrderItem.
ALTER TABLE OrderItem
ADD CONSTRAINT fk_orders_orderitem
FOREIGN KEY(OrderId)
REFERENCES Orders(OrderId);

--11.	Add foreign key relationship between Product and OrderItem.
ALTER TABLE OrderItem
ADD CONSTRAINT fk_product_orderitem
FOREIGN KEY(ProductId)
REFERENCES Product(ProductId);

--12.	Add UNIQUE constraint for customer email.
ALTER TABLE Customer
ADD CONSTRAINT uq_customer_email
UNIQUE(Email);

--13.	Add UNIQUE constraint for seller email.
ALTER TABLE Seller
ADD CONSTRAINT uq_seller_email
UNIQUE(Email);

--14.	Add NOT NULL constraints for important columns.
ALTER TABLE Customer ALTER COLUMN CustomerName VARCHAR(100) NOT NULL;

ALTER TABLE Customer DROP CONSTRAINT uq_customer_email;

ALTER TABLE Customer ALTER COLUMN Email VARCHAR(50) NOT NULL;

ALTER TABLE Seller ALTER COLUMN SellerName VARCHAR(100) NOT NULL;

ALTER TABLE Product ALTER COLUMN ProductName VARCHAR(100) NOT NULL;

--15.	Add CHECK constraint for product price greater than 0.
ALTER TABLE Product
ADD CONSTRAINT chk_product_price
CHECK(Price > 0);

--16.	Add CHECK constraint for stock quantity greater than or equal to 0.
ALTER TABLE Product
ADD CONSTRAINT chk_stock_quantity
CHECK(StockQuantity >= 0);

--17.	Add CHECK constraint for order quantity greater than 0.
ALTER TABLE OrderItem
ADD CONSTRAINT chk_order_quantity
CHECK(Quantity > 0);

--18.	Add DEFAULT constraint for order date.
ALTER TABLE Orders
ADD CONSTRAINT df_order_date
DEFAULT GETDATE() FOR OrderDate;

--19.	Add DEFAULT constraint for order status.
ALTER TABLE Orders
ADD CONSTRAINT df_order_status
DEFAULT 'Pending' FOR OrderStatus;

--20.	Add DEFAULT constraint for customer status.
ALTER TABLE Customer
ADD CONSTRAINT df_customer_status
DEFAULT 1 FOR IsActive;

--Inserting values into each table

INSERT INTO Customer
(CustomerName,Email,MobileNo,City,Address,IsActive)
VALUES
('Annsi','annsi@gmail.com',9876543210,'Chennai','OMR Chennai',1),
('Deepi','deepi@gmail.com',9876543211,'Hyderabad','Madhapur',1),
('Dharshu','dharshu@gmail.com',9876543212,'Mumbai','Andheri',1),
('Ramu','ramu@gmail.com',9876543213,'Bhavani','Erode',1),
('Vinai','vinai@gmail.com',9876543214,'Chennai','Velachery',0);


INSERT INTO Seller
(SellerName,Email,MobileNo,City,Rating,IsActive)
VALUES
('Amazon','amazon@gmail.com',9123456781,'Bangalore',5,1),
('Flipkart','flipkart@gmail.com',9123456782,'Chennai',4,1),
('Reliance Digital','reliance@gmail.com',9123456783,'Mumbai',4,1),
('Croma','croma@gmail.com',9123456784,'Hyderabad',5,1);

INSERT INTO Product
(ProductName,Category,Price,StockQuantity,SellerId)
VALUES
('iPhone','Mobile',80000,15,1),
('Samsung','Mobile',70000,12,1),
('OnePlus','Mobile',60000,8,2),
('Dell','Laptop',65000,10,2),
('HP','Laptop',75000,7,3),
('Boat Headset','Accessories',2500,50,3),
('Apple Watch','Accessories',45000,20,4),
('Lenovo','Laptop',85000,5,4),

('Mac lap1','Laptop',850000,8,4);



INSERT INTO Orders
(CustomerId,PaymentMode,DeliveryCity)
VALUES
(1,'UPI','Chennai'),
(2,'Credit Card','Hyderabad'),
(3,'Cash On Delivery','Mumbai'),
(1,'Debit Card','Chennai'),
(5,'UPI','Chennai');

INSERT INTO OrderItem
(OrderId,ProductId,Quantity,UnitPrice)
VALUES
(1,1,1,80000),
(1,6,2,2500),
(2,2,1,70000),
(2,7,1,45000),
(3,4,1,65000),
(3,6,1,2500),
(4,3,1,60000),
(4,8,1,85000),
(5,5,1,75000),
(5,6,3,2500);




--6.	Update one customer city.


UPDATE Customer SET City='Bangalore' WHERE CustomerName='Vinai';
select * from Customer;

--7.	Update one product price.
UPDATE Product SET Price=82000 WHERE ProductName='iPhone';
select * from Product

--8.	Update one order status.
UPDATE Orders SET OrderStatus='Delivered' WHERE OrderId=1;

--9.	Delete one product that is not used in any order item.
SELECT * FROM Product WHERE ProductId NOT IN(
    SELECT ProductId
    FROM OrderItem
);

delete from Product where ProductId=9;
--10
select * from Customer
select * from Orders
Select * from Seller
select * from Product
select *from OrderItem




ALTER TABLE Customer ADD CONSTRAINT df_customer_createddate DEFAULT GETDATE() FOR CreatedDate;

UPDATE Customer SET CreatedDate = GETDATE()  WHERE CreatedDate IS NULL;
select * from Customer;

ALTER TABLE Product
ADD CONSTRAINT df_product_createddate
DEFAULT GETDATE() FOR CreatedDate;
select * from Product



--1.	Display all customers from Chennai.
select * from Customer where City='Chennai'
--2.	Display all customers not from Chennai.
select * from Customer where City NOT IN ('Chennai');
--3.	Display all products with price greater than 50000.
select * from Product where Price>50000
--4.	Display all products with price between 10000 and 60000.
select * from Product where Price BETWEEN 10000 AND 60000
--5.	Display all products from category Mobile or Laptop.
select * from Product where Category IN ('Mobile','Laptop')
--6.	Display all customers whose name starts with A.
select * from Customer where CustomerName like 'A%'
--7.	Display all customers whose email contains gmail.
select * from Customer where Email like '%gmail%'
--8.	Display all products whose product name contains Phone.
select * from Product where ProductName like '%phone%'
--9.	Display all orders with status Delivered.
SELECT * FROM Orders where OrderStatus='Delivered';
--10.	Display all products where stock quantity is less than 10.
select * from Product where StockQuantity<10;
--11.	Display all customers where mobile number is not null.
select *from Customer where MobileNo Is Not NUll;
--14.	Display all customers from Chennai and active status.
select *from Customer where City= 'Chennai' and IsActive=1;
--15.	Display all customers except those from Hyderabad.
select *from Customer where City!= 'Hyderabad'




--1.	Count total customers city-wise.
SELECT City, COUNT(CustomerId) AS TotalCustomers FROM Customer GROUP BY City;
--2.	Count total products category-wise.
SELECT Category,COUNT(ProductId) AS TotalProducts FROM Product GROUP BY Category;

--3.	Find total stock quantity category-wise.
SELECT Category,SUM(StockQuantity) AS TotalStock FROM Product GROUP BY Category;
--4.	Find maximum product price category-wise.
SELECT Category,MAX(Price) AS MaxPrice FROM Product GROUP BY Category;
--5.	Find minimum product price category-wise.
SELECT Category,MIN(Price) AS MinPrice FROM Product GROUP BY Category;
--6.	Find average product price category-wise.
SELECT Category,AVG(Price) AS AvgPrice FROM Product GROUP BY Category;
--7 Find total order amount customer-wise
SELECT c.CustomerName, SUM(oi.Quantity*oi.UnitPrice) AS TotalOrderAmount FROM Customer c
INNER JOIN Orders o ON c.CustomerId=o.CustomerId INNER JOIN OrderItem oi ON o.OrderId=oi.OrderId GROUP BY c.CustomerName;

--8 Find total sales product-wise
SELECT p.ProductName, SUM(oi.Quantity*oi.UnitPrice) AS TotalSales FROM Product p INNER JOIN OrderItem oi
ON p.ProductId=oi.ProductId GROUP BY p.ProductName;

--9 Find total quantity sold product-wise
SELECT p.ProductName,SUM(oi.Quantity) AS TotalQuantitySold FROM Product p INNER JOIN OrderItem oi ON p.ProductId=oi.ProductId
GROUP BY p.ProductName;

--10 Display only categories having more than 1 product
SELECT Category,COUNT(ProductId) AS ProductCount FROM Product GROUP BY Category HAVING COUNT(ProductId)>1;

--11 Display only customers whose total order amount > 50000
SELECT c.CustomerName, SUM(oi.Quantity*oi.UnitPrice) AS TotalAmount FROM Customer c INNER JOIN Orders o
ON c.CustomerId=o.CustomerId INNER JOIN OrderItem oi ON o.OrderId=oi.OrderId GROUP BY c.CustomerName HAVING SUM(oi.Quantity*oi.UnitPrice)>50000;

--12 Find seller-wise total number of products
SELECT s.SellerName,
COUNT(p.ProductId) AS TotalProducts
FROM Seller s
INNER JOIN Product p
ON s.SellerId=p.SellerId
GROUP BY s.SellerName;

--13 Find seller-wise total sales amount
SELECT s.SellerName,SUM(oi.Quantity*oi.UnitPrice) AS TotalSales FROM Seller s INNER JOIN Product p
ON s.SellerId=p.SellerId INNER JOIN OrderItem oi ON p.ProductId=oi.ProductId GROUP BY s.SellerName;

--14 Find order status-wise order count
SELECT OrderStatus,COUNT(OrderId) AS OrderCount  FROM Orders GROUP BY OrderStatus;

--15 Find city-wise customer count and sort by highest count
SELECT City, COUNT(CustomerId) AS CustomerCount FROM Customer GROUP BY City ORDER BY CustomerCount DESC;



--1.	Display products by price ascending.
SELECT * FROM Product ORDER BY Price ASC;
--2.	Display products by price descending.
SELECT * FROM Product ORDER BY Price DESC;
--3.	Display customers by city ascending and customer name ascending.
SELECT * FROM Customer ORDER BY City ASC,CustomerName ASC;
--4.	Display orders by order date descending.
SELECT * FROM Orders ORDER BY OrderDate DESC;
--5.	Display products by category ascending and price descending.
SELECT * FROM Product ORDER BY Category ASC,Price DESC;
--6.	Display top 3 highest priced products.
SELECT TOP 3 * FROM Product ORDER BY Price DESC;
--7.	Display top 5 recent orders.
SELECT TOP 5 * FROM Orders ORDER BY OrderDate DESC;
--8.	Display customers sorted by active status and name.
SELECT * FROM Customer ORDER BY IsActive DESC,CustomerName ASC;



--1.	Display orders with customer details using INNER JOIN.
SELECT * FROM Orders o INNER JOIN Customer c ON o.CustomerId=c.CustomerId;
--2.	Display products with seller details using INNER JOIN.
SELECT * FROM Product p INNER JOIN Seller s ON p.SellerId=s.SellerId;
--3.	Display order items with product details using INNER JOIN.
SELECT * FROM OrderItem oi INNER JOIN Product p ON oi.ProductId=p.ProductId;
--4 Complete order report
SELECT c.CustomerName,o.OrderId,p.ProductName,s.SellerName,oi.Quantity,oi.UnitPrice
FROM Customer c INNER JOIN Orders o ON c.CustomerId=o.CustomerId INNER JOIN OrderItem oi ON o.OrderId=oi.OrderId
INNER JOIN Product p ON oi.ProductId=p.ProductId INNER JOIN Seller s ON p.SellerId=s.SellerId;
--5.	Display all customers and their orders using LEFT JOIN.
SELECT * FROM Customer c LEFT JOIN Orders o ON c.CustomerId=o.CustomerId;
--6.	Display all orders and customers using RIGHT JOIN.
SELECT *FROM Customer c RIGHT JOIN Orders o ON c.CustomerId=o.CustomerId;
--7.	Display all customers and all orders using FULL OUTER JOIN.
SELECT * FROM Customer c FULL OUTER JOIN Orders o ON c.CustomerId=o.CustomerId;
--8 All possible combinations of customers and products
SELECT c.CustomerName, p.ProductName FROM Customer c CROSS JOIN Product p;

--9.	Display customers who have not placed any order.
SELECT c.* FROM Customer c LEFT JOIN Orders o ON c.CustomerId=o.CustomerId WHERE o.OrderId IS NULL;
--10.	Display products that are not ordered.
SELECT p.* FROM Product p LEFT JOIN OrderItem oi ON p.ProductId=oi.ProductId WHERE oi.OrderId IS NULL;

--11.	Display seller-wise product list.
SELECT s.SellerName, p.ProductName FROM Seller s INNER JOIN Product p ON s.SellerId=p.SellerId;
--12.	Display customer-wise ordered products.
SELECT c.CustomerName, p.ProductName FROM Customer c INNER JOIN Orders o ON c.CustomerId=o.CustomerId
INNER JOIN OrderItem oi ON o.OrderId=oi.OrderId INNER JOIN Product p ON oi.ProductId=p.ProductId;
--13.	Display order-wise total amount.
SELECT o.OrderId, SUM(oi.Quantity*oi.UnitPrice) AS TotalAmount FROM Orders o
INNER JOIN OrderItem oi ON o.OrderId=oi.OrderId  GROUP BY o.OrderId;
--14.	Display seller-wise total sales.
SELECT s.SellerName, SUM(oi.Quantity*oi.UnitPrice) AS TotalSales FROM Seller s
INNER JOIN Product p ON s.SellerId=p.SellerId INNER JOIN OrderItem oi ON p.ProductId=oi.ProductId
GROUP BY s.SellerName;
--15.	Display product-wise total sales quantity.
SELECT p.ProductName, SUM(oi.Quantity) AS TotalQuantitySold FROM Product p
INNER JOIN OrderItem oi ON p.ProductId=oi.ProductId GROUP BY p.ProductName;