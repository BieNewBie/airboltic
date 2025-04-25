<!-- markdownlint-disable MD041 -->
{% docs customer_group_inc %}

#### Source: airboltic_customer.customer_groups

We here assume that there is a data producer team which creates table `customer_groups` in schema `airboltic_customer`.

We use this table to create a table in `landing_layer` for data analysis.


#### Model: customer_group_inc

The model reads the data from the source and does basic operations like typecasting to ensure data integrity. We also add ingestion date

We use merge stratergy for this table. It appends the new `customer_group_id` or updates the 
old if there is any data change

{% enddocs %}