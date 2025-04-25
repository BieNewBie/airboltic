{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['customer_group_id'],
    file_format='delta'
)}}

{% set customer_details = ref('customer_details_inc') %}
{% set order_details = ref('order_details_inc') %}


SELECT 
       cd.customer_group_id,
       cd.customer_group_name,
       cd.type,
       COUNT(od.order_id) AS total_orders,
       COUNT(IF(status='Finished', od.order_id, NULL)) AS total_orders_finished,
       COUNT(IF(status='Cancelled', od.order_id, NULL)) AS total_orders_cancelled,
       SUM(od.price) AS booking_value,
       SUM(od.trip_duration) AS total_trip_duration,
       AVG(od.trip_duration) AS avg_trip_duration,
       CURRENT_DATE() AS load_date
FROM {{customer_details}} cd
LEFT JOIN {{order_details}} od

ON cd.customer_id = od.customer_id

GROUP BY cd.customer_group_id,
         cd.customer_group_name,
         cd.type





