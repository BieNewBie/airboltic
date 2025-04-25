{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['trip_id'],
    file_format='delta'
)}}

{% set trips = source('airboltic_transactions', 'trips') %}

SELECT 
    CAST("Trip Id" AS INT) AS trip_id,
    CAST("Origin City" AS VARCHAR) AS origin_city,
    CAST("Destination City" AS VARCHAR) AS destination_city,
    CAST("Airplane ID" AS INT) AS airplane_id,
    CAST("Start Timestamp" AS TIMESTAMP) AS start_timestamp,
    CAST("End Timestamp" AS TIMESTAMP) AS end_timestamp,
    CURRENT_DATE() AS load_date
FROM {{trips}}
