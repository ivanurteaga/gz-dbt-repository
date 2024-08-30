select 
    products_id, 
    date_date, 
    orders_id,
    revenue, 
    quantity,
    {{ margin_percent('s.revenue', 's.quantity*CAST(p.purchase_price AS FLOAT64)') }} as margin_percent,
    CAST(purchase_price AS FLOAT64) as purchase_price,
    ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS purchase_cost,
    s.revenue - ROUND(s.quantity*CAST(p.purchase_price AS FLOAT64),2) AS margin
from {{ref("stg_raw__sales")}} s
left join {{ref("stg_raw__product")}} p
 using (products_id)