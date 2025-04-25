{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['airplane_id'],
    file_format='delta'
)}}

{% set airplanes = source('airboltic_fleet', 'aeroplane_dimension') %}

SELECT 
    CAST("Airplane ID" AS INT) AS airplane_id,
    CAST("Airplane Model" AS VARCHAR) AS model,
    CAST("Manufacturer" AS VARCHAR) AS manufacturer,
    CURRENT_DATE() AS load_date
FROM {{airplanes}}
