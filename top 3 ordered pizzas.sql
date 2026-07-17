-- Top 3 most ordered pizza based on revenue
SELECT 
    pizza_types.name AS pizzas_names,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas_names
ORDER BY revenue DESC
LIMIT 3;