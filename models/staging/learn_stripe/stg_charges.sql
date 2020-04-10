select
    ID, 			
    CAPTURED, 		
    CREATED, 		
    CURRENCY, 		
    DESCRIPTION, 	
    FAILURE_CODE, 	
    FAILURE_MESSAGE,
    FRAUD_DETAILS, 	
    LIVEMODE, 		
    OBJECT, 		
    PAID, 			
    REFUNDED, 		
    STATUS
from {{ source('learn_stripe','charges') }}