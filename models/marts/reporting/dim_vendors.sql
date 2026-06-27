-- one row per vendor  

with trips as 
(
    select * from {{ ref('int_trips_unioned') }}
),

vendors as 
(
    select distinct 
    vendor_id,
    {{ get_vendor_names("vendor_id") }} as vendor_name -- getting vendor names from a macro

    from trips
)

select * from vendors
