# Transactions

Transactions are the basic objects in the Pencepay platform, which represent the money flow from your customers to you, and from you to your customers (e.g. in case of refunds).

[[object#Transaction]]


### Address Verification System

Address Verification System (AVS) is provided by card issuing banks in the US, Canada and the UK to verify that the provided address matches Issuer's records, as an additional security feature.
Merchant decides how to act based on the returned result codes.

We provide separate code for verification of street `avsStreetResult` and postal code `avsPostalCodeResult` but both fields will contain one of the AVS result codes below.

Result   |  Description
---------|------------------------------
M        | Street address (or postal code) match
N        | Street address (or postal code) does not match
U        | AVS is not supported by the Issuer or no AVS data provided
I        | Street address (or postal code) invalid data provided

### Card Verification Value

Card Verification Value (CVV) is an additional card legacy security feature used to make sure that the cardholder actually has a card when paying online.
Some banks will approve a transaction even if the CVV is not provided.

Property `cvvResult` contains the result of the CVV verification by the Issuing bank:

Result   |  Description
---------|------------------------------
M        | CVV matches
N        | Does not match
P        | Not processed
U        | Not verified
I        | Not provided
S        | Isser does not support CVV verification


### Transaction Result Codes

| Result code | Description
--------------|--------------------------
|0           | Success / Approval
|1000        | Do not honor
|1001        | Insufficient funds
|1002        | Limit exceeded
|1003        | Cardholder activity limit exceeded
|1004        | Declined - possibly lost or stolen card
|1005        | Call Issuer - pick up card
|1006        | Declined - fraud suspected
|1007        | Processor declined
|1008        | Declined - call Issuer
|1009        | Declined
|1010        | Declined - call for approval
|1011        | Declined - updated cardholder available
|1012        | Voice authorization required
|1013        | Declined - CVV failed
|1014        | Declined - AVS failed
|1015        | Declined - AVS and CVV failed
|1016        | Transaction not allowed
|1017        | Duplicate transaction
|1018        | Cardholder stopped billing
|1019        | Issuer or cardholder has put a restriction on the card
|1020        | Violation
|1021        | Security violation
|1022        | Card expired
|1023        | Card number is invalid
|1024        | Expiry date is invalid
|1025        | No account found
|1026        | No such Issuer
|1027        | Setup issue - Merchant
|1028        | Setup issue - Amount
|1029        | Setup issue - Hierarchy
|1030        | Setup issue - Card
|1031        | Setup issue - Terminal
|1032        | Invalid Merchant ID
|1033        | Merchant not 3-D Secure enabled
|1034        | Encryption error
|1035        | Surcharge not permitted
|1036        | Inconsistent data
|1037        | No action taken
|1038        | Authorization could not be found to reverse
|1039        | Already reversed
|1040        | Invalid authorization code
|1041        | Error - do not retry, call Issuer
|1042        | Credit card number does not match method of payment
|1043        | Reversal amount does not match authorization amount
|1044        | Invalid transaction division number
|1045        | Transaction amount exceeds the transaction division limit
|1046        | Invalid transaction
|1047        | Invalid transaction data
|1048        | Invalid amount
|1049        | Invalid SKU number
|1050        | Invalid credit plan
|1051        | Invalid tax amount
|1052        | Problem in processor system
|1099        | Network problem with processor - try again later

Any other result code should be treated as technical error, and you should contact Pencepay to solve the problem.

## Create a transaction

Details on how to create a new Transaction.

[[endpoint#Transaction#create]]


## Refund a transaction

Refund functionality can be used for all supported payment methods. Depending on the payment method, customer will see the paid funds returned in 2 to 15 days.

You can issue multiple refunds to a customer, making sure not to attempt to return more than the value of the initial charge.

[[endpoint#Transaction#refund]]

### Response

Returns an `TransactionAction` object, or `Error`.


## Void a transaction

Transaction voiding is performed to cancel an authorization of funds on a credit card, and it is not applicable to other payment methods.

During the payment authorization, balance on the card is authorized for a certain amount, which means that customer cannot spend it elsewhere during the duration of authorization.

If you decide that you do not wish to actually charge the card, after the authorization has been made, you void the transaction, which causes the reserved funds to be released back to the customer.

[[endpoint#Transaction#void]]



## Capture a transaction

For credit card transactions which were authorized, you need to call the capture method to actually charge the card.

Usually maximum period in which you can capture an authorized transaction is 7 days.

[[endpoint#Transaction#capture]]



## Retrieve a transaction

Retrieve a single Transaction.

[[endpoint#Transaction#single]]


### Response

You will receive a `Transaction` object JSON response. If the `Transaction` was not found an `Error` will be returned.



## Search for transactions

[[endpoint#Transaction#search]]

