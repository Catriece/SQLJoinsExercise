/* joins: select all the computers from the products table:

using the products table and the categories table, return the product name and the category name */

SELECT p.Name AS Product, c.Name AS Category
FROM products AS p
INNER JOIN categories as c
ON c.CategoryID = p.CategoryID
WHERE c.Name = "Computers";

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name AS Product, p.Price AS Price, r.Rating AS Rating
FROM products AS p
INNER JOIN reviews AS r
ON r.ProductID = p.ProductID
HAVING r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.EmployeeID AS EmployeeID, CONCAT(e.FirstName, " ", e.LastName) AS Name, SUM(s.Quantity) AS TotalQuantity
FROM employees AS e
INNER JOIN sales AS s
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING TotalQuantity = (SELECT SUM(sales.Quantity) AS Total FROM sales GROUP BY sales.EmployeeID ORDER BY Total DESC LIMIT 1);



/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name AS Department, c.Name AS Category
FROM categories AS c
INNER JOIN departments AS d
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,

 for Eagles: Hotel California --You may need to use SUM() */
 SELECT p.Name AS Product, SUM(s.Quantity) AS QuantitySold, SUM(s.Quantity * s.PricePerUnit) AS Total
 FROM sales AS s
 INNER JOIN products AS p
 ON s.ProductID = p.ProductID
 WHERE p.Name = "Eagles: Hotel California";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name AS Product, r.Reviewer AS Reviewer, r.Rating AS Rating, r.Comment AS Review
FROM reviews AS r
INNER JOIN products AS p
ON p.ProductID = r.ProductID
WHERE p.Name = "Visio TV"
ORDER BY r.Rating
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult

/* Your goal is to write a query that serves as an employee sales report.

This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID AS EmployeeID, CONCAT(e.LastName, ", ", e.FirstName) AS Name, p.Name AS Product, s.Quantity AS QuantitySold
FROM sales AS s
INNER JOIN employees AS e
ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p
ON p.ProductID = s.ProductID
ORDER BY Name;





