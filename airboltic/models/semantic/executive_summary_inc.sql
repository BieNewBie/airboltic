{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['trip_start_date'],
    file_format='delta'
)}}

{% set order_details = ref('order_details_inc') %}


SELECT 
       trip_start_date,
       COUNT(order_id) AS total_orders,
       COUNT(IF(status='Finished', order_id, NULL)) AS total_orders_finished,
       COUNT(IF(status='Cancelled', order_id, NULL)) AS total_orders_cancelled,
       SUM(price) AS booking_value,
       COUNT(DISTINCT airplane_id) AS total_airplanes,
       COUNT(DISTINCT customer_id) AS total_customers,
       SUM(trip_duration) AS total_trip_duration,
       AVG(trip_duration) AS avg_trip_duration,
       CURRENT_DATE() AS load_date
FROM {{order_details}}


GROUP BY trip_start_date
         



