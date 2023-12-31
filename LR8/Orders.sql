USE library;

CREATE VIEW OrderCost AS
SELECT
    Orders.OrderID,
    Books.Title AS BookTitle,
    Orders.Quantity,
    Orders.Quantity * Books.Price AS Cost
FROM Orders
JOIN Books ON Orders.BookID = Books.BookID;

CREATE VIEW OrdersPerMonth AS
SELECT
    Orders.Customer,
    MONTH(Orders.OrderDate) AS Month,
    COUNT(*) AS OrderCount,
    SUM(Orders.Quantity * Books.Price) AS TotalCost
FROM Orders
JOIN Books ON Orders.BookID = Books.BookID
GROUP BY Orders.Customer, MONTH(Orders.OrderDate);

CREATE VIEW BooksSold AS
SELECT
    Authors.FullName AS AuthorName,
    Books.Title AS BookTitle,
    SUM(Orders.Quantity) AS QuantitySold
FROM Orders
JOIN Books ON Orders.BookID = Books.BookID
JOIN Authors ON Books.AuthorID = Authors.AuthorID
GROUP BY Authors.FullName, Books.Title;