{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['manufacturer', 'model'],
    file_format='delta'
)}}

{% set airplanes = source('airboltic_fleet', 'aeroplane_model') %}

SELECT 
    CAST(manufacturer AS VARCHAR) AS manufacturer,
    CAST(model AS VARCHAR) AS model,
    CAST(max_seats AS INT) AS max_seats,
    CAST(max_weight AS INT) AS max_weight,
    CAST(max_distance AS INT) AS max_distance,
    CAST(engine_type AS VARCHAR) AS engine_type,
    CURRENT_DATE() AS load_date
FROM {{airplanes}}
