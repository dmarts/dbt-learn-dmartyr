select
    id as payment_id,
    "orderID" as order_id,
    AMOUNT as amount,
    _BATCHED_AT
from {{ source('stripe','payment') }}