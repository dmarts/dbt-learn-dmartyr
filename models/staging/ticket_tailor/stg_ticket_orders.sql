select
    ORDER_ID			
    , ORDER_CANCELLED		
    , EVENT_ID			
    , EVENT_NAME			
    , EVENT_START			
    , EVENT_END			
    , ORDER_ITEMS			
    , TAX_AMOUNT			
    , TICKETS_CHECKED_IN
    , TICKETS_PURCHASED
    , TOTAL_PAID			
    , TRANSACTION_ID		
    , TRANSACTION_TYPE	
    , ORDER_DATE
from {{ source('ticket_tailor','orders') }}