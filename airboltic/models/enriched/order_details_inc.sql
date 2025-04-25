{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['order_id'],
    file_format='delta'
)}}

{% set orders_inc = ref('orders_inc') %}
{% set trips_inc = ref('trips_inc') %}


SELECT 
       oi.order_id,
       oi.customer_id,
       ti.airplane_id,
       oi.price,
       oi.status,
       ti.origin_city,
       ti.destination_city,
       CAST(ti.start_timestamp AS date) AS trip_start_date,       
       ti.start_timestamp,
       ti.end_timestamp,
       EXTRACT(EPOCH FROM (ti.end_timestamp - ti.start_timestamp))/60 AS trip_duration,
       CURRENT_DATE() AS load_date
FROM {{orders_inc}} oi
LEFT JOIN {{trips_inc}} ti

ON oi.trip_id = ti.trip_id