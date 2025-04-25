{% docs trips_inc %}

#### Source: airboltic_transactions.trips

We here assume that there is a data producer team which creates table `trips` in schema `airboltic_transactions`.

We use this table to create a table in `landing_layer` for data analysis.


#### Model: trips_inc

The model reads the data from the source and does basic operations like typecasting to ensure data integrity. We also add ingestion date

We use merge stratergy for this table. It appends the new `trip_id` or updates the 
old if there is any data change

{% enddocs %}