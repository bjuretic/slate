# Credit cards

`CreditCard` object allows your to store a credit card payment details into a secure Safe in the gateway.

After the card is stored, you can use it to initiate subsequent charges (e.g. in metered use billing) or start subscriptions with that card.

You can safely store in your database all properties of the `CreditCard` object, as they do not contain any sensitive information.

[[object#CreditCard]]


## Create a card

When the card is create, basic validation of the card data is run before the card is saved: LUHN, expiry date and CVV sanity checks. If any of those checks fails, error will be returned and CreditCard object will not be created.

If you wish to perform an actual check of the card with the issuer, you need to request a card validation.

If this is the first card for the Customer, or if your request it, it will be made a default card.

[[endpoint#CreditCard#create]]

### Response

You will receive a `CreditCard` object, or `Error` in case of failure.


## Update a card

Details on how to update an existing CreditCard object.

You should set only those parameters that you wish to change. All parameters are optional, with the exception that both expiration month and year need to be supplied, in case expiry date needs to be updated.

[[endpoint#CreditCard#update]]

### Response

Updated `CreditCard` object, or `Error`.


## Retrieve a card

Retrieve a single CreditCard object.

[[endpoint#CreditCard#single]]

### Response

You will receive a `CreditCard` object, or `Error` in case of failure.



## Delete a card

Delete a single CreditCard.

[[endpoint#CreditCard#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `CreditCard` was not found an `Error` will be returned.



## Search for cards

Retrieves a list of `CreditCard` objects, saved for a specific customer.

You can limit the size of the list returned by using the `limit` parameter, and control the pagination using the `after` parameters.

[[endpoint#CreditCard#search]]

