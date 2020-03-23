# Events

Events keep your application synced with the gateway, so that you are always up to date.

Events are sent only if you have created Callback before the event occurred. [Callback](#callbacks) can receive test **or** live events.

[[object#Event]]

Each `Event` will contain one more dynamic property - depending on the objectType, response will have a dynamic property name (e.g. `customer`), as appropriate for event's `eventType`.

## Event types

| Type                          | Description
|-------------------------------|-------------
| echo                          | This is our test event, used to make sure your Callback URL is active. Ignore it when you receive it.
| transaction.success           | Transaction is successful. For credit cards this means that the card was authorized or charged, and for other payment methods that the amount was charged from the customer. Not sent for successfuly transactions with status set to PREPARED (used with bank transfers and alternative payment methods), as the payment was not yet attempted so no outcome is known.
| transaction.failure           | Transaction is unsuccessful, either because it was rejected by the gateway or the acquirer. 
| transaction.refunded          | Transaction which was previously charged is now refunded (funds are sent back to the customer).
| transaction.voided            | Transaction which was previously authorized is now voided (used with credit card payments).
| transaction.captured          | Transaction which was previously authorized is now charged (funds previously only reserved on the cards are now actually charged).
| customer.created              | Customer is created
| customer.updated              | details (direct object properties) of the Customer are changed
| customer.deleted              | Customer is deleted
| customer.address.created      | Address is created
| customer.address.updated      | Address details are changed
| customer.address.deleted      | Address is deleted
| customer.bankAccount.created  | Bank account is created
| customer.bankAccount.updated  | Bank account details are changed
| customer.bankAccount.deleted  | Bank account is deleted
| customer.card.created         | Credit Card is created
| customer.card.updated         | Credit Card details are changed
| customer.card.deleted         | Credit Card is deleted
| coupon.created                | Coupon is created
| coupon.deleted                | Coupon details are changed
| plan.created                  | Plan is created
| plan.updated                  | Plan details are changed
| plan.deleted                  | Plan is deleted


## Retrieve an event

Retrieve a single Event.

[[endpoint#Event#single]]

### Response

You will receive an `Event` object JSON response. If the `Event` was not found an `Error` will be returned.


## Search for events

Returs a list of `Event`s from the gateway.

[[endpoint#Event#search]]

