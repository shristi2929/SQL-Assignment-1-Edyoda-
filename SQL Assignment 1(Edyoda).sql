Drop database company;
CREATE DATABASE Company_Details;
USE Company_Details;
DROP TABLE SalesPeople;
CREATE TABLE SalesPeople(Snum INT PRIMARY KEY, Sname VARCHAR(50) UNIQUE KEY , City VARCHAR(50), Comm INT);
INSERT INTO SalesPeople(Snum, Sname, City, Comm) VALUES(1001, "Peel", "London", 12);
INSERT INTO Salespeople(Snum, Sname, City, Comm) VALUES(1002, "Serres", "Sanjose", 13);
INSERT INTO Salespeople(Snum, Sname, City, Comm) VALUES(1004, "Motika", "London", 11);
INSERT INTO Salespeople(Snum, Sname, City, Comm) VALUES(1007, "Rifkin", "Barcelona", 15);
INSERT INTO Salespeople(Snum, Sname, City, Comm) VALUES(1003, "Axelrod", "Newyork", 10);

SELECT * FROM SalesPeople;

CREATE TABLE Customers(Cnum INT PRIMARY KEY, 
Cname VARCHAR(50), City VARCHAR(50) NOT NULL, 
Snum INT, FOREIGN KEY(Snum) References SalesPeople(Snum)); 

INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2001, "Hoffman", "London", 1001);
INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2002, "Giovanni", "Rome", 1003);
INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2003, "Liu", "Sanjose", 1002);
INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2004, "Grass", "Berlin", 1002);
INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2006, "Clemens", "London", 1001);
INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2008, "Cisneros", "Sanjose", 1007);
INSERT INTO Customers(Cnum, Cname, City, Snum) VALUES(2007, "Pereira", "Rome", 1004);

SELECT * FROM Customers;
DROP TABLE orders;
CREATE TABLE Orders(Onum INT, Amt decimal(6,2), Odate date, Cnum INT, FOREIGN KEY(Cnum) References customers(Cnum),
Snum INT, FOREIGN KEY(Snum) References SalesPeople(Snum));


INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3001, 18.69, "1990-3-10", 2008, 1007);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3003, 767.19, "1990-3-10", 2001, 1001);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3002, 1900.10, "1990-3-10", 2007, 1004);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3005, 5160.45, "1990-3-10", 2003, 1002);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3006, 1098.16, "1990-3-10", 2008, 1007);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3009, 1713.23, "1990-4-10", 2002, 1003);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3007, 75.75, "1990-4-10", 2004, 1002);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3008, 4723.00, "1990-5-10", 2006, 1001);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3010, 1309.95, "1990-6-10", 2004, 1002);
INSERT INTO Orders(Onum, Amt, Odate, Cnum, Snum) VALUES(3001, 9891.88, "1990-6-10", 2006, 1001);

SELECT * FROM Orders;

/* On the basis of above tables perform given below questions

1. Count the number of Salesperson whose name begin with name 'a/A'. */
 
SELECT COUNT(Sname) from SalesPeople where Sname like 'A%';

/*2. Display all the Salesperson whose all orders worth is more than Rs. 2000 */

SELECT S.Snum, S.Name FROM SalesPeople, Oders O WHERE S.Snum=O.Snum AND O.Amt > 2000 ;
/*3.Count the number of SalesPerson belonging to Newyork. */

SELECT Count(Sname) FROM Salespeople WHERE City="Newyork";





/*4. Display the numbers of SalesPerson belonging to London and Paris. */
 
 SELECT Count(Sname) FROM SalesPeople WHERE City='London' and City='Paris';

/*5. Display the number of Orders taken by SalesPerson and their date of orders. */
SELECT O.Odate, S.Snum, Sname,COUNT(C.Cnum) FROM SalesPeople S, Customers C, Orders O
WHERE C.Snum=S.Snum GROUP bY S.Snum, Sname;