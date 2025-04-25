{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['airplane_id'],
    file_format='delta'
)}}

{% set airplane_details = ref('airplane_details_inc') %}
{% set order_details = ref('order_details_inc') %}


SELECT 
       ad.airplane_id,
       ad.manufacturer,
       ad.model,
       ad.max_seats,
       ad.max_weight,
       ad.max_distance,
       ad.engine_type,
       COUNT(od.order_id) AS total_orders,
       COUNT(IF(status='Finished', od.order_id, NULL)) AS total_orders_finished,
       COUNT(IF(status='Cancelled', od.order_id, NULL)) AS total_orders_cancelled,
       SUM(od.price) AS booking_value,
       SUM(od.trip_duration) AS total_trip_duration,
       AVG(od.trip_duration) AS avg_trip_duration,
       CURRENT_DATE() AS load_date
FROM {{airplane_details}} ad
LEFT JOIN {{order_details}} od

ON ad.airplane_id = od.airplane_id

GROUP BY ad.airplane_id,
         ad.manufacturer,
         ad.model,
         ad.max_seats,
         ad.max_weight,
         ad.max_distance,
         ad.engine_type





