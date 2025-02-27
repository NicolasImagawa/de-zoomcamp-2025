with 

source as (

    select * from {{ source('staging', 'fhv_data') }}

),

renamed as (

    select
        dispatching_base_num,
        pickup_datetime,
        dropoff_datetime,
        PUlocationID,
        DOlocationID,
        sr_flag,
        affiliated_base_number,
        __index_level_0__

    from source
    where dispatching_base_num is not null

)

select * from renamed
