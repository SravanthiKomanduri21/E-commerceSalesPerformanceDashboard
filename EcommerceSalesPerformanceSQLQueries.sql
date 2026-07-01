# Total Customers 
SELECT COUNT(*) AS Total_Customers
From Customers;
# Total Orders 
SELECT COUNT(*) AS Total_Orders
From Orders;
# Total Revenue 
SELECT SUM(total_amount) AS Total_Revenue 
From Orders;
# Total Products 
SELECT COUNT(*) AS Total_Products
From Products;
# Total Categories 
SELECT COUNT(*) AS Total_Categories 
From Categories;
# Total Quantity Sold 
SELECT SUM(quantity) AS Total_Quantity_Sold
From Order_items;
# Maximum Order Value 
SELECT MAX(total_amount) AS Highest_Order 
From Orders;
# Minimum Order Value 
SELECT MIN(total_amount) AS Lowest_Order
From Orders;
# Customer by Gender 
SELECT gender ,COUNT(*) AS Customer_Count
From Customers
Group By gender;
# Customer by State
SELECT state , COUNT(*) As Total_Customers
From Customers 
GROUP BY state 
ORDER BY Total_Customers DESC;
# Customer by City
SELECT city, COUNT(*) As Total_Customers
From Customers 
GROUP BY city
ORDER BY Total_Customers DESC;

# Order by Status
SELECT order_status, COUNT(*) AS Total_Orders
FROM Orders 
GROUP BY order_status;

# Payment Method Analysis 
SELECT payment_method ,COUNT(*) AS Transactions
FROM Payments 
GROUP BY payment_method ;

# Payment Status Analysis
SELECT payment_status ,COUNT(*) AS Total_Payments
FROM Payments 
GROUP BY payment_status ;

# Top 10 Selling products
SELECT p.product_name, SUM(oi.quantity) AS Quantity_Sold
FROM order_items  oi
Join products p
ON oi .product_id = p.product_id
GROUP BY p.product_name
ORDER BY Quantity_Sold DESC
LIMIT 10;
# Top Categories by Quantity Sold
SELECT c.category_name,SUM(oi.quantity) AS Quantity_Sold
From order_items oi
Join products p
ON oi.product_id = p.product_id
Join categories c
ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY Quantity_Sold DESC;
 # Revenue by Category
 SELECT c.category_name ,SUM(oi.quantity * oi.unit_price) AS Revenue
 FROM order_items oi
 JOIN products p
 ON oi.product_id = p.product_id
 JOIN categories c
 ON p.category_id = c.category_id
 GROUP BY c.category_name
 ORDER BY Revenue DESC;

 # Revenue by Brand 
 SELECT brand ,SUM(price) AS Revenue 
 FROM products
 GROUP BY brand 
 ORDER BY Revenue DESC
 LIMIT 10;
 # Top 10 Customers by Spending 
 SELECT customer_id ,SUM(total_amount) AS Spending 
 FROM orders
 GROUP BY customer_id
 ORDER BY Spending DESC
 Limit 10;
# Monthly Sales Trend 
SELECT Year(order_date) AS Year ,
Month(order_date)AS Month,
SUM(total_amount) AS Revenue 
FROM orders 
GROUP BY Year, Month
ORDER BY Year ,Month;
# Revenue by State
SELECT c.state,SUM(o.total_amount) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY Revenue DESC;

 # Revenue by City
SELECT c.city,SUM(o.total_amount) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY Revenue DESC;
# Most used Courier Service 
SELECT courier_name ,COUNT(*) AS Deliveries
FROM shipping
GROUP BY courier_name 
ORDER BY Deliveries DESC;
# Average Shipping Cost 
SELECT AVG(shipping_cost) AS Avg_Shipping_Cost 
FROM shipping;

