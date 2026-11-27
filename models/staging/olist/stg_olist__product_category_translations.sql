with source as (
    select *
    from {{ source('olist','product_category_name_translation') }}
),
renamed as (
    select product_category_name,
        product_category_name_english as product_category_name_en
    from source
)
select *
from renamed