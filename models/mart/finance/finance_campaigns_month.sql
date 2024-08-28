SELECT 
    DATE_TRUNC(c.date_date, MONTH) AS month,  
    ROUND(SUM(f.operational_margin - c.ads_cost), 2) AS ads_margin,
    ROUND(SUM(f.average_basket), 2) AS average_basket,
    ROUND(SUM(f.operational_margin), 2) AS operational_margin
FROM {{ ref('int_campaigns_day') }} c
JOIN {{ ref('finance_days') }} f
    ON c.date_date = f.date_date 
GROUP BY month
ORDER BY month DESC