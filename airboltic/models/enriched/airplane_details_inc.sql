{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['airplane_id'],
    file_format='delta'
)}}

{% set airplanes_inc = ref('airplanes_inc') %}
{% set airplane_models_inc = ref('airplane_models_inc') %}


SELECT ai.airplane_id,
       ai.model,
       ai.manufacturer,
       ami.max_seats,
       ami.max_weight,
       ami.max_distance,
       ami.engine_type,
       CURRENT_DATE() AS load_date

FROM {{airplanes_inc}}  ai
LEFT JOIN {{airplane_models_inc}} ami

ON ai.model = ami.model
AND ai.manufacturer = ami.manufacturer






