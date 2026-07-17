-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pizza_types.name AS pizzas_names,
    ROUND((SUM(order_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(pizzas.price * order_details.quantity),
                                2) AS Total_sales
                FROM
                    pizzas
                        JOIN
                    order_details ON pizzas.pizza_id = order_details.pizza_id)) * 100,
            2) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas_names
ORDER BY revenue DESC
LIMIT 3;