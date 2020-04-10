select
    ID
    , CHARGE_ID	
    , CURRENCY	
    , CREATED	
    , STATUS
from {{ source('learn_stripe','refunds') }}