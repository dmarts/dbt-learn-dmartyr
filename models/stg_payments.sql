select
    id as payment_id,
    "orderID" as order_id,
    AMOUNT as amount
from raw.stripe.payment