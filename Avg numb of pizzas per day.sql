-- Group the orders by data and calculate the average numbers of pizzas per day
SELECT 
    AVG(Quantity) AS Avg_Quantity_Per_Day
FROM
    (SELECT 
        orders.order_date AS Order_Date,
            SUM(order_details.quantity) AS Quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY Order_Date) AS order_quantity;