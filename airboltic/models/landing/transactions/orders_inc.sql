{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['order_id'],
    file_format='delta'
)}}

{% set orders = source('airboltic_transactions', 'orders') %}

SELECT 
    CAST("Order Id" AS INT) AS order_id,
    CAST("Customer ID" AS INT) AS customer_id,
    CAST("Trip ID" AS INT) AS trip_id,
    CAST("Price (EUR)" AS INT) AS price,
    CAST("Seat No" AS VARCHAR) AS seat_no,
    CAST("Status" AS VARCHAR) AS status,
    CURRENT_DATE() AS load_date
FROM {{orders}}
