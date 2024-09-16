CREATE TABLE SALES AS
SELECT * 
FROM AdventureWorks_Sales_2015
UNION
SELECT * 
FROM AdventureWorks_Sales_2016
UNION;
SELECT*
FROM AdventureWorks_Sales_2017

SELECT*
FROM SALES;

INSERT INTO Sales(OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity)
SELECT OrderDate,StockDate, OrderNumber, ProductKey, CustomerKey, TerritoryKey, OrderLineItem, OrderQuantity
FROM Sales;


ALTER TABLE Returns RENAME TO FactReturns;
ALTER TABLE Calendar RENAME TO DimCalendar;
ALTER TABLE Customers RENAME TO DimCustomer;
ALTER TABLE Product_Categories RENAME TO DimProductCategories;
ALTER TABLE Product_Subcategories RENAME TO DimProduct_Subcategories;
ALTER TABLE Products RENAME TO DimProducts;

CREATE TABLE DimCalendars(
	"OrderDate" TEXT,
	"Year" TEXT,
	"Month" TEXT,
	PRIMARY KEY (OrderDate)
	);
	
	INSERT INTO DimCalendars(OrderDate, Year, Month)
	SELECT Date,
	CAST(substr(Date,-4) as INTEGER) as Year, 
	CAST(substr(Date, 1, 2) as INTEGER) as Month
	FROM DimCalendar;