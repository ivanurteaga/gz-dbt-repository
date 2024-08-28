select 
    f.date_date,
    operational_margin - ads_cost as ads_margin,
    average_basket,
    operational_margin
from {{ref("finance_days")}} f
left join {{ref("int_campaigns_day")}} i
    on f.date_date = i.date_date

