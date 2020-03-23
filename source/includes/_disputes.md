# Disputes

Disputes are descriptions of complaints (or "reclamations" in some languages) from your customers, which we receive from the acquirer.

[[object#Dispute]]

### DisputeType

Describes possible type of the Dispute.

Code             |  Description
-----------------|--------------------------
RETRIEVAL        | Retrieval, i.e. acquirer asked us for more information about the payment of the customer
CHARGEBACK       | Chargeback, i.e. disputed funds have been already taken from your settlement due
PRE_ARBITRATION  | Pre-arbitration
REVERSAL         | Reversal, i.e. funds have been returned to your account after you won a dispute claim

### DisputeReason

Describes possible reasons for this Dispute.

Code                         |  Description
-----------------------------|------------------------------
CANCELLED_RECURRING          | Payment was made on an already customer-cancelled subscription.
CREDIT_NOT_RECEIVED          | Customer did not receive the credit that was agreed upon before
DUPLICATE                    | Duplicate payment from the customer, for the same product or service.
FRAUD                        | Customer claim that the payment was made without his consent, i.e. stolen payment instrument 
GENERIC                      | No specific dispute reason was given
INVALID_ACCOUNT              | Payment instrument is not valid anymore, e.g. expired card, wrong account number etc.
NOT_RECOGNIZED               | Customer does not recognize the payment on his financial statement
PRODUCT_NOT_RECEIVED         | Customer did not receive your product or service that was paid for
PRODUCT_UNSATISFACTORY       | Product or service provided are of insufficient quality, i.e. defective
TRANSACTION_AMOUNT_DIFFERENT | Amount charged to customer is different than the amount expected


## Retrieve a dispute

Retrieve a single Dispute.

[[endpoint#Dispute#single]]

### Response

You will receive a `Dispute` object JSON response. If the `Dispute` was not found an `Error` will be returned.


## Search for disputes

Retrieve a list of Disputes.

[[endpoint#Dispute#search]]

See [Pagination](#pagination) for general details on how to retrieve and paginate through a list of objects.

