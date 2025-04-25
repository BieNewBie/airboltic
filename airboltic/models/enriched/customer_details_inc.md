{% docs customer_details_inc %}

#### Sources

We use below tables as input source created in landing layer

1. `landing_layer.customer_group_inc`
2. `landing_layer.customers_inc`

We use `ref()` function of dbt so that lineage/dependencies and correct build order is ensured automatically

#### Model: customer_details_inc

This model is `enriched` version of customer data. In one table we get all the possible details for all the customer data

We use merge stratergy for this table. It appends the new `customer_id` or updates the 
old if there is any data change

{% enddocs %}