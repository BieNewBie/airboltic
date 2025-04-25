{{config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key= ['customer_id'],
    file_format='delta'
)}}

{% set customers_inc = ref('customers_inc') %}
{% set customer_group_inc = ref('customer_group_inc') %}


SELECT ci.customer_id,
       ci.name_hash,
       ci.email_hash,
       ci.phone_number_hash,
       ci.customer_group_id,
       cgi.type,
       cgi.name AS customer_group_name,
       cgi.registry_number,
       CURRENT_DATE() AS load_date

FROM {{customers_inc}}  ci
LEFT JOIN {{customer_group_inc}} cgi

ON ci.customer_group_id = cgi.customer_group_id