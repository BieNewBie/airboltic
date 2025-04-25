{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['customer_id'],
    file_format='delta'
)}}

{% set customers = source('airboltic_customer', 'customers') %}

SELECT 
    CAST("Customer ID" AS INT) AS customer_id,
    sha1(Name) AS name_hash,
    CAST("Customer Group ID" AS INT) AS customer_group_id,
    sha1(email) AS email_hash,
    sha1("Phone Number") AS phone_number_hash,
    CURRENT_DATE() AS load_date
FROM {{customers}}
