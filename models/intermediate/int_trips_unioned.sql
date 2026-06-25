with green_trips as 
(
    select 
        -- identifiers
        vendor_id,
        pulocationid,
        dolocationid,
        ratecodeid,

        -- timestamps
        lpep_pickup_datetime,
        lpep_dropoff_datetime,

        -- trip info
        cast(store_and_fwd_flag as string) as store_and_fwd_flag,               
        passenger_count,
        trip_distance,
        trip_type,

        -- payment info
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        payment_type,
        congestion_surcharge,

        -- dataset identifier
        'Green' as service_type
      
    
    from {{ ref('stg_nytaxi__green_tripdata') }}

),

yellow_trips as 
(
    select  
     -- identifiers
        vendor_id,
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
        1 as trip_type,  -- yellow taxi only do street hail (code 1)
        
        -- payment info
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        improvement_surcharge,
        total_amount,
        payment_type,
        congestion_surcharge,

        -- dataset identifier
        'Yellow' as service_type

from {{ ref('stg_nytaxi__yellow_tripdata') }}

)

select * from green_trips 
union all 
select * from yellow_trips
 