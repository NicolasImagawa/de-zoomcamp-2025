{{
    config(
        materialized='table',
        partition_by={
            "field": "pickup_datetime",
            "data_type": "timestamp",
            "granularity": "day"
        },
        cluster_by = ["trip_year", "trip_month"],
    )
}}

select *, 
    TIMESTAMP_DIFF(dim_fhv_trips.dropOff_datetime, dim_fhv_trips.pickup_datetime, SECOND) as trip_duration,
from {{ ref('dim_fhv_trips') }}
