with source as (
    select *
    from {{ source('olist', 'order_reviews') }}
),
renamed as (
    select review_id,
        order_id,
        cast(review_score as integer) as review_score,
        review_comment_title,
        review_comment_message,
        -- date-only column; 85 rows show 01:00 on Brazil DST start days
        -- (2016-10-16, 2017-10-15) when local midnight did not exist
        cast(review_creation_date as date) as review_sent_date,        cast(review_answer_timestamp as timestamp) as review_answered_at
    from source
)
select *
from renamed
