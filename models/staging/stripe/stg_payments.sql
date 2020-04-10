select
    id as payment_id,
    "orderID" as order_id,
    AMOUNT as amount,
    "paymentMethod" as payment_method,
    _BATCHED_AT
from {{ source('stripe','payment') }}