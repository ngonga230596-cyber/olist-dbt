with source as (
    select *
    from {{ source('olist', 'sellers') }}
),
renamed as (
    select 
        -- ids
        seller_id,
        -- location
        lpad(cast(seller_zip_code_prefix as varchar), 5, '0') as seller_zip_code_prefix,
        seller_city,
        seller_state
    from source
)
select *
from renamed
