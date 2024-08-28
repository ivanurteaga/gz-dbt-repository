SELECT
  o.orders_id
  ,o.date_date
  ,ROUND(cast(o.margin as FLOAT64) + s.shipping_fee - (s.logcost + CAST(s.ship_cost as FLOAT64)),2) AS operational_margin 
  ,o.quantity
  ,o.revenue
  ,o.purchase_cost
  ,o.margin
  ,s.shipping_fee
  ,s.logcost
  ,s.ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s 
  USING(orders_id)
ORDER BY orders_id desc