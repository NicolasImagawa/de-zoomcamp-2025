{{
    config(
        materialized='table'
    )
}}

with fhv_data as (
    select *,
    from {{ ref('stg_fhv_data') }}
), 
dim_zones as (
    select * from {{ ref('dim_zones') }}
    where borough != 'Unknown'
)
select fhv_data.dispatching_base_num,
       {{ extract_year('fhv_data.pickup_datetime') }} as trip_year,
       {{ extract_month('fhv_data.pickup_datetime') }} as trip_month,
       fhv_data.pickup_datetime,
       fhv_data.dropOff_datetime,
       fhv_data.PUlocationID as pickup_locationid,
       pickup_zone.borough as pickup_borough,
       pickup_zone.zone pickup_zone,
       fhv_data.DOlocationID as dropoff_locationid,
       dropoff_zone.borough as dropoff_borough,
       dropoff_zone.zone as dropoff_zone,
       fhv_data.SR_Flag,
       fhv_data.Affiliated_base_number,
       fhv_data.__index_level_0__
from fhv_data
inner join dim_zones as pickup_zone
on fhv_data.PUlocationID = pickup_zone.locationid
inner join dim_zones as dropoff_zone
on fhv_data.DOlocationID = dropoff_zone.locationid