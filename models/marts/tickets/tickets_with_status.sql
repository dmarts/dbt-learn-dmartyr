with ticket_events as (
    select * from {{ ref('tickets_per_event') }}
)
, paid as (
    SELECT
        event_id
        , sum(TOTAL_TICKETS) as TICKETS_PAID
    from ticket_events
    where TRANSACTION_STATUS = 'PAID'
    group by 1
)
, refunded as (
    SELECT
        event_id
        , sum(TOTAL_TICKETS) as TICKETS_REFUNDED
    from ticket_events
    where TRANSACTION_STATUS = 'REFUNDED'
    group by 1
)
, final as (
    select
        distinct EVENT_NAME
        , IFNULL(paid.TICKETS_PAID,0) as TICKETS_PAID
        , IFNULL(refunded.TICKETS_REFUNDED,0) as TICKETS_REFUNDED
    from ticket_events
    left join paid using (event_id)
    left join refunded using (event_id)
    --group by 1
    order by 1
)

select * from final