with source as (
    select * from {{ source('olist', 'order_items') }}
),
renamed as (
    select 
        -- ids
        order_id,
        order_item_id as item_number,
        product_id,
        seller_id,
        -- timestamps
        cast(shipping_limit_date as timestamp) as shipping_limit_at,
        -- amounts
        cast(price as decimal(10,2)) as price,
        cast(freight_value as decimal(10,2)) as shipping_fee
    from source
)
select *
from renamed
