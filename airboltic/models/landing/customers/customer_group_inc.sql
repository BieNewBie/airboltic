{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['customer_group_id'],
    file_format='delta'
)}}

{% set customer_groups = source('airboltic_customer', 'customer_groups') %}

SELECT 
    CAST(id AS INT) AS customer_group_id,
    CAST("Type" AS VARCHAR) AS type,
    CAST("Name" AS VARCHAR) AS name,
    CAST("Registry number" AS VARCHAR) AS registry_number,
    CURRENT_DATE() AS load_date
FROM {{customer_groups}}
