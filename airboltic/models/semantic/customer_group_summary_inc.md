{% docs customer_group_summary_inc %}

#### Sources

We use below tables as input source created in enriched layer

1. `enriched_layer.customer_details_inc`
2. `enriched_layer.order_details_inc`

We use `ref()` function of dbt so that lineage/dependencies and correct build order is ensured automatically

#### Model: customer_group_summary_inc

This model is `semantic` version of customer and orders data. The goal here is to get all the possible metrics against customer groups. This table will be primarily used to analyse the demand (customer groups) side of things

We use merge stratergy for this table. It appends the new `customer_group_id` or updates the 
old if there is any data change
{% enddocs %}