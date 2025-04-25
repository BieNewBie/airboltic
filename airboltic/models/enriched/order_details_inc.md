{% docs order_details_inc %}

#### Sources

We use below tables as input source created in landing layer

1. `landing_layer.orders_inc`
2. `landing_layer.trips_inc`

We use `ref()` function of dbt so that lineage/dependencies and correct build order is ensured automatically

#### Model: order_details_inc

This model is `enriched` version of trips and orders data. In one table we get all the possible details for the combination of orders and trips data

Here we derive few more columns like `trip_start_date` and `trip_duration`

We use merge stratergy for this table. It appends the new `order_id` or updates the 
old if there is any data change

{% enddocs %}