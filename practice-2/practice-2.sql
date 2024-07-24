-- SELECT * FROM customers;

/******************************************************************************************************/

-- SELECT City FROM customers;

-- SELECT DISTINCT Country FROM customers;

-- SELECT * FROM customers WHERE City = 'Berlin';

-- SELECT * FROM customers WHERE CustomerID = 32;

/******************************************************************************************************/

-- SELECT *
-- FROM customers
-- ORDER BY City ASC;

/******************************************************************************************************/

-- SELECT *
-- FROM customers
-- ORDER BY City DESC;

/******************************************************************************************************/

-- SELECT *
-- FROM customers
-- ORDER BY Country, City;

/******************************************************************************************************/

-- SELECT *
-- FROM customers
-- WHERE City = 'Berlin' AND PostalCode = '12209';

/******************************************************************************************************/

-- SELECT *
-- FROM customers
-- WHERE City = 'Berlin' OR City = 'London';

/******************************************************************************************************/

-- SELECT *
-- FROM customers
-- WHERE NOT City = 'Berlin';

/******************************************************************************************************/
-- single record
-- INSERT INTO customers (CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES
-- ('Asim', 'Sahal', 'Scarborough', 'Toronto', 'M1P', 'Canada');

-- multiple records
-- INSERT INTO customers (CustomerName, ContactName, Address, City, PostalCode, Country)
-- VALUES
-- ('Sahal', 'Sahal', '100 Ft Road', 'Anand', '388001', 'India'),
-- ('Kareen', 'Sahal', '100 Ft Road', 'Anand', '388001', 'India'),
-- ('Muhammad', 'Zahir', 'Upton Park', 'London', 'E13 ORA', 'UK'),
-- ('Aqsha', 'Zahir', 'Upton Park', 'London', 'E13 ORA', 'UK');

-- SELECT * FROM customers
-- WHERE ContactName = 'Sahal' OR ContactName = 'Zahir';

/******************************************************************************************************/
-- dont know not working
-- SELECT *
-- FROM customers
-- WHERE PostalCode IS NULL;

-- this is working
-- SELECT *
-- FROM customers
-- WHERE PostalCode = '';

-- for not empty
-- SELECT *
-- FROM customers
-- WHERE PostalCode IS NOT NULL;

-- SELECT * FROM customers
-- WHERE Country = 'Norway';

/******************************************************************************************************/
-- update city to 'Jersey' where country has value 'USA'
-- UPDATE customers
-- SET City = 'Jersey'
-- WHERE Country = 'USA';

-- SELECT * FROM customers
-- WHERE Country = 'USA';


-- update City to 'New York' and Country to 'USA' of record with CustomerID 11
-- UPDATE customers
-- SET City = 'New York',
-- Country = 'USA'
-- WHERE CustomerID = 11;

-- SELECT * FROM customers WHERE CustomerID = 11;

/******************************************************************************************************/
/*
 ERROR Error invoking remote method 'DB_EXECUTE_CANCELLABLE_QUERY': Error: Cannot delete
 or update a parent row: a foreign key constraint fails (`w3schools`.`orders`, 
 CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`))
 
 order table contains CustomerID as foreign key so we cant delete record in customers Table
 although we can force delete it !!!!
*/
-- DELETE FROM customers
-- WHERE Country = 'Norway';

-- SELECT * FROM customers WHERE Country = 'Norway';


/******************************************************************************************************/

-- SELECT MIN(Price), MAX(Price)
-- FROM Products;

-- SELECT COUNT(*) AS 'Total'
-- FROM Products
-- WHERE Price = 18;

-- SELECT AVG(Price) as 'Average', SUM(Price) as 'Total'
-- FROM Products;

/******************************************************************************************************/

-- city starts with 'a'
-- SELECT *
-- FROM customers
-- WHERE City LIKE 'a%';

-- city ends with 'a'
-- SELECT *
-- FROM customers
-- WHERE City LIKE '%a';

-- city contains 'a'
-- SELECT *
-- FROM customers
-- WHERE City LIKE '%a%';

-- city starts with 'a' and ends with 'b'
-- SELECT *
-- FROM customers
-- WHERE City LIKE 'a%b';

-- city not starts with 'a'
-- SELECT *
-- FROM customers
-- WHERE City NOT LIKE 'a%';

/******************************************************************************************************/

-- second letter of the City is an "a"
-- SELECT *
-- FROM Customers
-- WHERE City LIKE '_a%';

-- first letter of the City is an "a" or a "c" or an "s"
-- SELECT *
-- FROM Customers
-- WHERE City LIKE '[acs]%';

-- first letter of the City starts with anything from an "a" to an "f"
-- SELECT *
-- FROM Customers
-- WHERE City LIKE '[a-f]%';

-- first letter of the City is NOT an "a" or a "c" or an "f"
-- SELECT *
-- FROM Customers
-- WHERE City LIKE '[!acf]%';

/******************************************************************************************************/
-- SELECT *
-- FROM customers
-- WHERE ContactName IN ('Sahal', 'Zahir');

-- SELECT *
-- FROM customers
-- WHERE Country IN ('Norway', 'France');

-- SELECT *
-- FROM customers
-- WHERE Country NOT IN ('Norway', 'France');

/******************************************************************************************************/

-- SELECT * FROM products
-- WHERE Price BETWEEN 10 AND 20;

-- or we can use this
-- SELECT * FROM products
-- WHERE Price >= 10 AND Price <= 20;

-- SELECT * FROM products
-- WHERE Price NOT BETWEEN 10 AND 20;

-- SELECT * FROM products
-- WHERE ProductName BETWEEN 'Geitost' AND 'Pavlova';

/******************************************************************************************************/

-- SELECT CustomerName AS Name,
-- PostalCode AS Pno
-- FROM customers;

/******************************************************************************************************/

-- List the number of customers in each country
-- SELECT COUNT(CustomerID) AS 'NO. OF CUSTOMERS',
-- Country
-- FROM Customers
-- GROUP BY Country;

-- List the number of customers in each country, ordered by the country with the most customers first
-- SELECT COUNT(CustomerID) AS Total, Country
-- FROM Customers
-- GROUP BY Country
-- ORDER BY Total DESC;

/******************************************************************************************************/

-- DATABASE related

-- create new database testDB
-- CREATE DATABASE testDB;

-- delete database testDB
-- DROP DATABASE testDB;

-- create new table student with your choice of fields
-- CREATE TABLE Students (
--   studID INT NOT NULL,
--   studName VARCHAR(255),
--   studPhone VARCHAR(13),
--   studEmail VARCHAR(255),
--   studFee DECIMAL(10,2)
-- );

-- display Students table Schema
-- DESC Students;

-- delete table Students
-- DROP TABLE Students;

-- delete all data inside a table
-- TRUNCATE TABLE Students;

-- or we can use this
-- DELETE FROM Students;

-- Add a column of type DATE called DOB in Students Table
-- ALTER TABLE Students
-- ADD DOB DATE;

-- to delete DOB in Students Table
-- ALTER TABLE Students
-- DROP COLUMN DOB;

/******************************************************************************************************/
-- JOINS

-- join the two tables Orders and Customers, using the CustomerID field in both tables as the relationship between the two tables
SELECT * FROM orders LIMIT 5;
SELECT * FROM customers LIMIT 5;

-- SELECT *
-- FROM orders AS O
-- LEFT JOIN customers AS C
-- ON O.CustomerID = C.CustomerID
-- LIMIT 5;

-- select all records from the two tables where there is a match in both tables
-- SELECT *
-- FROM orders AS O
-- INNER JOIN customers AS C
-- ON O.CustomerID = C.CustomerID
-- LIMIT 5;

-- select all the records from the Customers table plus all the matches in the Orders table
-- SELECT *
-- FROM orders AS O
-- RIGHT JOIN customers AS C
-- ON O.CustomerID = C.CustomerID
-- LIMIT 5;

CONTINUE


/******************************************************************************************************/
