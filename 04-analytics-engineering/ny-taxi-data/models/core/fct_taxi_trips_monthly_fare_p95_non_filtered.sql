{{
    config(
        materialized='table',
        partition_by={
            "field": "pickup_datetime",
            "data_type": "timestamp",
            "granularity": "day"
        },
        cluster_by = ["service_type", "trip_year", "trip_month", "fare_amount"],
    )
}}

select * 
from {{ ref('fct_taxi_trips_quarterly_revenue') }}