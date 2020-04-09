select 
    O.order_id
    , O.customer_id
    , P.amount
from {{ ref('stg_orders') }} O
inner join {{ ref('stg_payments') }} P on O.order_id = P.order_id
--order by 'O.order_id'