--DAY2

--- Basic Sub Queries:


--1.	Display all products whose price is greater than the average product price. 
select * from Product where Price>(select AVG(Price) from Product)
--2.	Display all products whose stock quantity is less than the average stock quantity. 
select * from Product where StockQuantity<(select avg(StockQuantity) from Product)
--3.	Display all customers who placed at least one order. 
SELECT * FROM Customer c WHERE EXISTS
(
    SELECT 1 FROM Orders o WHERE o.CustomerId = c.CustomerId
);
--4.	Display all customers who have not placed any order. 
SELECT * FROM Customer c WHERE NOT EXISTS
(
    SELECT 1 FROM Orders o WHERE o.CustomerId = c.CustomerId
);
select * from orders

--5.	Display all products that are ordered at least once. 
SELECT * FROM Product p WHERE  EXISTS
(
    SELECT 1 FROM OrderItem oi WHERE p.ProductId = oi.ProductId
);

--6.	Display all products that are not ordered by any customer. 

SELECT * FROM Product p WHERE  NOT EXISTS
(
    SELECT 1 FROM OrderItem oi WHERE p.ProductId = oi.ProductId
);
select * from product
select * from seller
insert into product(ProductName,Category,Price,StockQuantity,SellerId) values('Smart watch','Accessories',50000,6,1)

select* from orderitem


--7.	Display all sellers who are selling at least one product. 
SELECT * FROM seller s WHERE  EXISTS
(
    SELECT 1 FROM Product p WHERE p.SellerId = s.SellerId
);

--8.	Display all sellers who are not selling any product. 

insert into seller(SellerName,Email,MobileNo,City,Rating,IsActive)values('Myntra','myntra@gmail.com',9873026105,'Mysore',5,1)
SELECT * FROM seller s WHERE NOT EXISTS
(
    SELECT 1 FROM Product p WHERE p.SellerId = s.SellerId
);

--9.	Display all orders placed by customers from Chennai. 
select * from orders
select * from orders where CustomerId = (select CustomerId from Customer where City='Chennai')

--10.	Display all products sold by sellers from Bangalore. 
select * from Product where SellerId = (select SellerId From Seller where City='Bangalore');


--B. Subquery with IN / NOT IN
select * from Customer where CustomerId IN (Select CustomerId from Orders)
select * from orders
select * from Customer

--12.	Display customer details for customers who have not placed any orders. 

select * from Customer where CustomerId NOT IN 
(Select CustomerId from Orders)

--13.	Display product details for products that are available in the OrderItem table. 
select * from product where ProductId in (select ProductId from OrderItem)

--14.	Display product details for products that are not available in the OrderItem table. 
select * from product where ProductId not in (select ProductId from OrderItem)

--15.	Display seller details for sellers who have products in the Product table. 
select * from seller where SellerId in (select sellerId from Product)
--16.select * from seller where SellerId in (select sellerId from Product)

select * from seller where SellerId not in (select sellerId from Product)

--17.	Display orders that contain products from the Mobile category. 
select * from Orders where OrderId in (SELECT OrderId
    FROM OrderItem WHERE ProductId IN
    (select ProductId from Product where Category='Mobile'))

--18.	Display orders that do not contain products from the Laptop category. 
select * from Orders where OrderId in (SELECT OrderId
    FROM OrderItem WHERE ProductId Not IN
    (select ProductId from Product where Category='Laptop'))
select * from orderItem

--Subquery with Aggregate Functions
--19.	Display the product details of the highest priced product. 
select * from Product where Price=(select max(Price) from Product)
--20.	Display the product details of the lowest priced product. 
select * from Product where Price=(select min(Price) from Product)

--21.	Display products whose price is greater than the average price of all products. 
select * from Product where Price>(select avg(Price) from Product)
--22.	Display products whose price is less than the average price of all products. 
select * from Product where Price<(select avg(Price) from Product)

















--D. Correlated Subquery Questions
--29.	Display products whose price is greater than the average price of products in the same category. 
SELECT * FROM Product p1 WHERE Price > (SELECT AVG(p2.Price) FROM Product p2 WHERE p2.Category = p1.Category);
select * from product

--30.	Display products whose price is less than the average price of products in the same category. 
SELECT * FROM Product p1 WHERE Price < (SELECT AVG(p2.Price) FROM Product p2 WHERE p2.Category = p1.Category);
--31.	Display sellers who have more than 2 products. 
select * from seller s where (select count(*) from product p where
s.sellerId = p.SellerId)>2;
--32.	Display customers who have placed more than one order. 
select * from Customer c where(select count(*) from orders o where
c.customerId=o.customerId)>1;

--33 Display orders whose order amount is greater than the average order amount of all orders

SELECT * FROM Orders o WHERE (
    SELECT SUM(oi.Quantity * oi.UnitPrice)
    FROM OrderItem oi
    WHERE oi.OrderId = o.OrderId) > (SELECT AVG(OrderAmount)FROM(
        SELECT SUM(Quantity * UnitPrice) AS OrderAmount
        FROM OrderItem
        GROUP BY OrderId
    ) x
);

--34.	Display products where stock quantity is greater than the average stock quantity of products from the same category. 
select * from Product p1 where StockQuantity>(select avg(stockQuantity) 
from Product p2 where p1.Category=p2.Category)

--35.	Display sellers whose product price average is greater than the overall product average price. 

select * from seller s where(select avg(p.price) from product p
where s.sellerId=p.SellerId)>(select avg(Price) from Product);

--E. EXISTS / NOT EXISTS Questions
--36.	Display customers who have placed at least one order using EXISTS. 
select CustomerName from Customer c where  exists (select 1 from Orders o where o.customerId = c.customerId)
--37.	Display customers who have not placed any order using NOT EXISTS. 
select CustomerName from Customer c where not exists (select 1 from Orders o where o.customerId = c.customerId)

--38.	Display products that are ordered at least once using EXISTS. 
select * from product p where exists(select 1 from orderItem oi where oi.ProductId=p.ProductId)
--39.	Display products that are not ordered using NOT EXISTS. 
select * from product p where not exists(select 1 from orderItem oi where oi.ProductId=p.ProductId)
--40.	Display sellers who have at least one product using EXISTS. 
select s.sellerName from seller s where exists(select 1 from Product p where p.sellerId=s.sellerId)
--41.	Display sellers who do not have any product using NOT EXISTS. 
select s.sellerName from seller s where not exists(select 1 from Product p where p.sellerId=s.sellerId)
--42.	Display customers who ordered any Mobile category product. 

select * From Customer c WHERE EXISTS ( SELECT 1 FROM Orders o INNER JOIN OrderItem oi
ON o.OrderId = oi.OrderId INNER JOIN Product p ON oi.ProductId = p.ProductId WHERE o.CustomerId = c.CustomerId
AND p.Category = 'Mobile');

--43.	Display customers who never ordered any Laptop category product
select  * FROM Customer c WHERE NOT EXISTS ( SELECT 1 FROM Orders o INNER JOIN OrderItem oi
ON o.OrderId = oi.OrderId INNER JOIN Product p ON oi.ProductId = p.ProductId WHERE o.CustomerId = c.CustomerId
AND p.Category = 'Mobile');




--1 Create a stored procedure to display all customer records

CREATE PROCEDURE sp_GetAllCustomers
AS
BEGIN
SELECT * FROM Customer;
END;

--2.	Create a stored procedure to display all product records. 
CREATE PROCEDURE sp_GetAllProducts
AS
BEGIN
SELECT * FROM Product;
END;

--3.	Create a stored procedure to display all seller records. 
CREATE PROCEDURE sp_GetAllSellers
AS
BEGIN
SELECT * FROM Seller;
END;

--4.	Create a stored procedure to display all order records. 
CREATE PROCEDURE sp_GetAllOrders
AS
BEGIN
SELECT * FROM orders;
END;


--5.	Create a stored procedure to display all order item records.
CREATE PROCEDURE sp_GetAllOrderItems
AS
BEGIN
SELECT * FROM OrderItem;
END;





--6 Display customer details based on CustomerId

CREATE PROCEDURE sp_GetCustomerById @CustomerId int 
AS
BEGIN
SELECT * FROM Customer WHERE CustomerId=@CustomerId;
END;
Exec sp_GetCustomerById 2;

--7.	Create a stored procedure to display product details based on ProductId. 
CREATE PROCEDURE sp_GetProductById @ProductId int 
AS 
BEGIN
SELECT * FROM product WHERE ProductId=@ProductId;
END;

Exec sp_GetProductById 2;

--8.	Create a stored procedure to display seller details based on SellerId.

CREATE PROCEDURE sp_GetSellerById @Sellerid int 
AS 
BEGIN
SELECT * FROM seller WHERE sellerId=@Sellerid;
END;
--9.	Create a stored procedure to display order details based on OrderId. 
CREATE PROCEDURE sp_GetOrderById @OrderId int
AS 
BEGIN
SELECT * FROM orders WHERE OrderId=@OrderId;
END;



--10.	Create a stored procedure to display all customers from a given city. 
CREATE PROCEDURE sp_GetCustomerByICity @city varchar(50)
AS 
BEGIN
SELECT * FROM customer WHERE city=@city;
END;


exec sp_GetCustomerByICity 'Bangalore'
--11.	Create a stored procedure to display all products from a given category. 

CREATE PROCEDURE sp_GetProductByICategory @category varchar(50)
AS 
BEGIN
SELECT * FROM product WHERE category=@category;
END;

--12.	Create a stored procedure to display products based on seller id. 
CREATE PROCEDURE sp_GetProductByISellerId @sellerId int
AS 
BEGIN
SELECT * FROM seller WHERE sellerid=@sellerId;
END;


--13.	Create a stored procedure to display orders based on customer id. 
CREATE PROCEDURE sp_GetOredrByICustomerId @customerid int
AS 
BEGIN
SELECT * FROM customer WHERE customerid=@customerid;
END;


--14.	Create a stored procedure to display order items based on order id. 
CREATE PROCEDURE sp_GetOrderItemByorderId @orderid int
AS 
BEGIN
SELECT * FROM orderitem WHERE orderid=@OrderId;
END;



--15.	Create a stored procedure to display products greater than a given price. 
CREATE PROCEDURE sp_GetProductGreaterThanprice @price decimal(10,2)
AS 
BEGIN
SELECT * FROM product WHERE price>@price;
END;


--C. Insert Stored Procedure Questions
--16.	Create a stored procedure to insert a new customer. 

CREATE PROC sp_InsertEmployee
@CustomerName varchar(50),
@Email varchar(50),
@MobileNo bigint,
@City Varchar(50),
@Address varchar(50),
@IsActive bit

AS
BEGIN
INSERT INTO Customer (CustomerName,Email,MobileNo,City,Address,IsActive)
VALUES
(@CustomerName,@Email,@MobileNo,@City,@Address,@IsActive)
END


exec sp_InsertEmployee 'sample10','sample10@gmail.com',83690281765,'Chennai','Ecr',1

--17.	Create a stored procedure to insert a new seller. 
CREATE PROC sp_InsertSeller
@SellerName varchar(50),
@Email varchar(50),
@MobileNo bigint,
@City Varchar(50),
@Rating int,
@IsActive bit

AS
BEGIN
INSERT INTO seller (SellerName,Email,MobileNo,City,Rating,IsActive)
VALUES
(@SellerName,@Email,@MobileNo,@City,@Rating,@IsActive)
END

--18.	Create a stored procedure to insert a new product. 
CREATE PROC sp_InsertProduct
@ProductName varchar(50),
@Category varchar(50),
@Price decimal(10,2),
@StockQuantity int,
@SellerId int


AS
BEGIN
INSERT INTO product (PoductName,Category,Price,StockQuantity,SellerId)
VALUES
(@PoductName,@Category,@Price,@StockQuantity,@SellerId)
END


--19.	Create a stored procedure to insert a new order. 
CREATE PROC sp_InsertOrder
@customerId int,
@OrderStatus varchar(50),
@PaymentMode varchar(50),
@DeliveryCity varchar(50)
AS
BEGIN
INSERT INTO orders (CustomerId,OrderStatus,PaymentMode,DeliveryCity)
VALUES
(@CustomerId,@OrderStatus,@PaymentMode,@DeliveryCity)
END

--20.	Create a stored procedure to insert a new order item. 
CREATE PROC sp_InsertOrderItem
@orderid int,
@ProductId int,
@Quantity int,
@unitPrice decimal(10,2)
AS
BEGIN
INSERT INTO orderitem (OrderId,ProductId,Quantity,UnitPrice)
VALUES
(@OrderId,@ProductId,@Quantity,@UnitPrice)
END



--D. Update Stored Procedure Questions
--21.	Create a stored procedure to update customer city based on customer id. 

CREATE PROC sp_UpdateCustomerCity @CustomerId INT, @City VARCHAR(50)
AS
BEGIN
UPDATE Customer SET City=@City WHERE CustomerId=@CustomerId;
END;

--22.	Create a stored procedure to update customer mobile number based on customer id. 
CREATE PROC sp_UpdateCustomerMobile @CustomerId INT, @MobileNo bigint
AS
BEGIN
UPDATE Customer SET MobileNo=@MobileNo WHERE CustomerId=@CustomerId;
END;

--23.	Create a stored procedure to update product price based on product id. 

CREATE PROC sp_UpdateProductPric @ProductId INT, @Price decimal(10,2)
AS
BEGIN
UPDATE Product SET Price=@Price WHERE ProductId=@ProductId;
END;


--24.	Create a stored procedure to update product stock quantity based on product id. 
create proc sp_UpdateProductStock @ProductId int,@StockQuantity int
AS
Begin
Update Product SET StockQuantity=@StockQuantity where ProductId=@ProductId
END

--25.	Create a stored procedure to update order status based on order id. 
create proc sp_UpdateOrderStatus @OrderId int,@OrderStatus varchar(20)
AS
Begin
Update Orders SET OrderStatus=@OrderStatus where OrderId=@OrderId
END

--26.	Create a stored procedure to update seller rating based on seller id. 

create proc sp_UpdateSellerRating @SellerId int,@Rating int
AS
Begin
Update Seller SET Rating=@Rating where SellerId=@SellerId
END

--27.	Create a stored procedure to update customer active status. 

create proc sp_UpdateActiveStat @IsActive bit,@CustomerId int
AS
Begin
Update Customer SET IsActive=@IsActive where CustomerId=@CustomerId
END


--28.	Create a stored procedure to update seller active status. 


create proc sp_UpdateSellerActiveStat @SellerId int,@IsActive bit
AS
Begin
Update Seller SET IsActive=@IsActive where SellerId=@SellerId
END




--29 Delete customer by CustomerId
CREATE PROC sp_DeleteCustomer
@CustomerId INT
AS
BEGIN
DELETE FROM Customer WHERE CustomerId=@CustomerId;
END;

--30 Delete seller by SellerId
CREATE PROC sp_DeleteSeller
@SellerId INT
AS
BEGIN
DELETE FROM Seller
WHERE SellerId=@SellerId;
END;

--31 Delete product by ProductId
CREATE PROC sp_DeleteProduct
@ProductId INT
AS
BEGIN
DELETE FROM Product
WHERE ProductId=@ProductId;
END;

--32 Delete order by OrderId
CREATE PROC sp_DeleteOrder
@OrderId INT
AS
BEGIN
DELETE FROM Orders
WHERE OrderId=@OrderId;
END;

--33 Delete order item by OrderItemId
CREATE PROC sp_DeleteOrderItem
@OrderItemId INT
AS
BEGIN
DELETE FROM OrderItem
WHERE OrderItemId=@OrderItemId;
END;

--34 Customer-wise order details
CREATE PROC sp_CustomerOrderDetails
AS
BEGIN
SELECT c.CustomerId,c.CustomerName,o.OrderId,o.OrderDate,o.OrderStatus,o.PaymentMode
FROM Customer c
INNER JOIN Orders o
ON c.CustomerId=o.CustomerId;
END;

--35 Seller-wise product details
CREATE PROC sp_SellerProductDetails
AS
BEGIN
SELECT s.SellerId,s.SellerName,p.ProductId,p.ProductName,p.Category,p.Price
FROM Seller s
INNER JOIN Product p
ON s.SellerId=p.SellerId;
END;

--36 Order-wise product details
CREATE PROC sp_OrderProductDetails
AS
BEGIN
SELECT o.OrderId,p.ProductId,p.ProductName,oi.Quantity,oi.UnitPrice
FROM Orders o
INNER JOIN OrderItem oi
ON o.OrderId=oi.OrderId
INNER JOIN Product p
ON oi.ProductId=p.ProductId;
END;

--37 Complete order report
CREATE PROC sp_CompleteOrderReport
AS
BEGIN
SELECT c.CustomerName,
p.ProductName,
s.SellerName,
oi.Quantity,
oi.UnitPrice,
(oi.Quantity*oi.UnitPrice) AS TotalAmount
FROM Customer c
INNER JOIN Orders o
ON c.CustomerId=o.CustomerId
INNER JOIN OrderItem oi
ON o.OrderId=oi.OrderId
INNER JOIN Product p
ON oi.ProductId=p.ProductId
INNER JOIN Seller s
ON p.SellerId=s.SellerId;
END;

--38 Customer-wise total order amount
CREATE PROC sp_CustomerTotalOrderAmount
AS
BEGIN
SELECT c.CustomerId,
c.CustomerName,
SUM(oi.Quantity*oi.UnitPrice) AS TotalOrderAmount
FROM Customer c
INNER JOIN Orders o
ON c.CustomerId=o.CustomerId
INNER JOIN OrderItem oi
ON o.OrderId=oi.OrderId
GROUP BY c.CustomerId,c.CustomerName;
END;

--39 Seller-wise total sales amount
CREATE PROC sp_SellerTotalSales
AS
BEGIN
SELECT s.SellerId,
s.SellerName,
SUM(oi.Quantity*oi.UnitPrice) AS TotalSales
FROM Seller s
INNER JOIN Product p
ON s.SellerId=p.SellerId
INNER JOIN OrderItem oi
ON p.ProductId=oi.ProductId
GROUP BY s.SellerId,s.SellerName;
END;

--40 Product-wise total sales quantity
CREATE PROC sp_ProductSalesQuantity
AS
BEGIN
SELECT p.ProductId,
p.ProductName,
SUM(oi.Quantity) AS TotalQuantitySold
FROM Product p
INNER JOIN OrderItem oi
ON p.ProductId=oi.ProductId
GROUP BY p.ProductId,p.ProductName;
END;

--46 Return total number of customers
CREATE PROC sp_TotalCustomers
@TotalCustomers INT OUTPUT
AS
BEGIN
SELECT @TotalCustomers=COUNT(*)
FROM Customer;
END;

--47 Return total number of products
CREATE PROC sp_TotalProducts
@TotalProducts INT OUTPUT
AS
BEGIN
SELECT @TotalProducts=COUNT(*)
FROM Product;
END;

--48 Return total number of orders
CREATE PROC sp_TotalOrders
@TotalOrders INT OUTPUT
AS
BEGIN
SELECT @TotalOrders=COUNT(*)
FROM Orders;
END;

--49 Return total sales amount of a product
CREATE PROC sp_ProductTotalSales
@ProductId INT,
@TotalSales DECIMAL(18,2) OUTPUT
AS
BEGIN
SELECT @TotalSales=SUM(Quantity*UnitPrice)
FROM OrderItem
WHERE ProductId=@ProductId;
END;

--50 Return total purchase amount of a customer
CREATE PROC sp_CustomerTotalPurchase
@CustomerId INT,
@TotalPurchase DECIMAL(18,2) OUTPUT
AS
BEGIN
SELECT @TotalPurchase=SUM(oi.Quantity*oi.UnitPrice)
FROM Orders o
INNER JOIN OrderItem oi
ON o.OrderId=oi.OrderId
WHERE o.CustomerId=@CustomerId;
END;

