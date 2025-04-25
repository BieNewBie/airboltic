<!-- markdownlint-disable MD041 -->
{% docs airplane_models_inc %}

#### Source: airboltic_fleet.aeroplane_model

We here assume that there is a data producer team which creates table `aeroplane_model` in schema `airboltic_fleet`.

We use this table to create a table in `landing_layer` for data analysis.


#### Model: airplane_models_inc

The model reads the data from the source and does basic operations like typecasting to ensure data integrity. We also add ingestion date

We use merge stratergy for this table. It updates the data by considering `manufacturer`, `model`. If no record is found the combination of `manufacturer`, `model`, then new records is inserted

{% enddocs %}