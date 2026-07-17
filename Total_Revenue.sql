-- calculated total revenue genrate from pizza sales 
SELECT 
    ROUND(SUM(pizzas.price * order_details.quantity),
            2) AS Total_sales
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id;