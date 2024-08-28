SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue), 0) AS revenue,
    ROUND(AVG(revenue), 1) AS average_basket,
    ROUND(SUM(revenue) / COUNT(orders_id), 1) AS average_basket_bis,
    ROUND(SUM(margin), 0) AS margin,
    ROUND(SUM(operational_margin), 0) AS operational_margin,
    ROUND(SUM(purchase_cost), 0) AS purchase_cost,
    ROUND(SUM(shipping_fee), 0) AS shipping_fee,
    ROUND(SUM(logcost), 0) AS logcost,
    ROUND(SUM(CAST(ship_cost AS FLOAT64)), 0) AS ship_cost, -- Asegúrate de que FLOAT es el tipo correcto
    SUM(quantity) AS quantity 
FROM {{ref("int_orders_operational")}}  -- Reemplaza esto con el nombre real de la tabla si no estás usando dbt
GROUP BY date_date
ORDER BY date_date DESC
