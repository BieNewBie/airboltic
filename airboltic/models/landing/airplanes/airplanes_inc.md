<!-- markdownlint-disable MD041 -->
{% docs airplanes_inc %}

#### Source: airboltic_fleet.aeroplane_dimension

We here assume that there is a data producer team which creates table `aeroplane_dimension` in schema `airboltic_fleet`.

We use this table to create a table in `landing_layer` for data analysis.


#### Model: airplanes_inc

The model reads the data from the source and does basic operations like typecasting and renaming the columns to ensure data integrity. We also add ingestion date

We use merge stratergy for this table. It appends the new `airplane_id` or updates the 
old if there is any data change

{% enddocs %}