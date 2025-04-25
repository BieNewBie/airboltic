<!-- markdownlint-disable MD041 -->
{% docs customers_inc %}

#### Source: airboltic_customer.customers

We here assume that there is a data producer team which creates table `customers` in schema `airboltic_customer`.

We use this table to create a table in `landing_layer` for data analysis.


#### Model: customers_inc

The model reads the data from the source and does basic operations like typecasting to ensure data integrity. We also add ingestion date.

We also encode the data with SHA1 encoding to comply with GDPR and not use any PII data

We use merge stratergy for this table. It appends the new `id` or updates the 
old if there is any data change

{% enddocs %}