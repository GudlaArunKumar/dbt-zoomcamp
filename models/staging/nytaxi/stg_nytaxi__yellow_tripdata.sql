with 

source as (

    select * from {{ source('nytaxi', 'yellow_tripdata') }}

),

renamed as (

    select

        -- identifiers
        cast(vendorid as integer) as vendor_id,
        pulocationid,
        dolocationid,
        ratecodeid,

        -- timestamps
        tpep_pickup_datetime,
        tpep_dropoff_datetime,

        -- trip info
        store_and_fwd_flag,
        passenger_count,
        trip_distance,
        
        -- payment info
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        payment_type,
        congestion_surcharge

    from source

)

select * from renamed