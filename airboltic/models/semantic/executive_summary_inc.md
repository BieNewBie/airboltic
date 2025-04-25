{% docs executive_summary_inc %}

#### Sources

We use below tables as input source created in enriched layer

1. `enriched_layer.order_details_inc`

We use `ref()` function of dbt so that lineage/dependencies and correct build order is ensured automatically

#### Model: executive_summary_inc

This model is `semantic` version of orders data. The goal here is to get all the metrics which will give an executive summary of health of business. One can understand, at high level, how the business is performing.

We use merge stratergy for this table. It appends the new `trip_start_date` or updates the 
old if there is any data change
{% enddocs %}