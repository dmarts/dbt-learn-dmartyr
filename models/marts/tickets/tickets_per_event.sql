with orders as (
    select * from {{ ref('stg_ticket_orders') }}
)
, charges as (
    select * from {{ ref('stg_charges') }}
)
,  refunds as (
    select * from {{ ref('stg_refunds') }}
)
, transactions as (
    select
        cast(EVENT_ID as int) as EVENT_ID
        , EVENT_NAME
        , order_id
        , transaction_id
        , (case when C.PAID = TRUE and C.REFUNDED = FALSE   then 'PAID' 
                when C.PAID = FALSE                         then 'NOT PAID' 
                when C.PAID = TRUE and C.REFUNDED = TRUE    then 'REFUNDED' 
                                                            else 'UNKNOWN'
                end) as TRANSACTION_STATUS
        , TICKETS_PURCHASED
        , TOTAL_PAID
    from orders O
    inner join charges C on O.transaction_id = C.ID
)
, final as (
    select
        EVENT_ID			
        , EVENT_NAME
        , TRANSACTION_STATUS
        , SUM(TICKETS_PURCHASED) as TOTAL_TICKETS
        , SUM(TOTAL_PAID) as TOTAL_VALUE
    from transactions
    group by 1, 2, 3
    order by 1, 3
)

select * from final