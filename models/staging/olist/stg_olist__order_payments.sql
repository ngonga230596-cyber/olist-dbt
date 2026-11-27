with source as (
    select *
    from {{ source('olist', 'order_payments') }}
),
renamed as (
    select 
        -- ids
        order_id,
        -- payment details
        payment_sequential as payment_number,
        payment_type,
        payment_installments as installment_count,
        cast(payment_value as decimal(10,2)) as payment_amount
    from source
)
select *
from renamed
