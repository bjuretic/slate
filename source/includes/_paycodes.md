# Paycodes

Having the ability to send requests for payment to your customers is achieved through Paycodes.

Paycode is an object which represents the information about what customer needs to pay, together with the payment amount and the reference used to actually pay.

There is no limit on how many times a customer (or how many different customers) can pay using the same Paycode, but if you wish you can set a time limit before the Paycode expires and can be no longer used.

There are several ways you can use a Paycode in your payment workflow, the most simple being just copy-pasting the `url` property, with the secure URL customer can pay on, and sending it to your customer by email during your usual proposal-to-payment process.

[[object#Paycode]]


## Create a paycode

Details on how to create a new Paycode.

[[endpoint#Paycode#create]]


## Update a paycode

Details on how to update an existing Paycode object.

[[endpoint#Paycode#update]]


## Retrieve a paycode

Retrieve a single Paycode.

[[endpoint#Paycode#single]]


### Response

You will receive a `Paycode` object JSON response. If the `Paycode` was not found an `Error` will be returned.


## Delete a paycode

Delete a single Paycode.

[[endpoint#Paycode#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `Paycode` was not found an `Error` will be returned.


## Search for paycodes

Returns a list of `Paycode`s.

[[endpoint#Paycode#search]]
