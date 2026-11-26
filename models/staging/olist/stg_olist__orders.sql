with source as (
    select * from {{ source('olist', 'orders') }}
),
renamed as (
    select 
        -- ids
        order_id,
        customer_id,
        -- status
        order_status,
        -- timestamps (theo thứ tự vòng đời)
        cast(order_purchase_timestamp as timestamp) as ordered_at,
        cast(order_approved_at as timestamp) as approved_at,
        cast(order_delivered_carrier_date as timestamp) as shipped_at,
        cast(order_delivered_customer_date as timestamp) as delivered_at,
        -- dates
        cast(order_estimated_delivery_date as date) as estimated_delivery_date
    from source
)
select *
from renamed