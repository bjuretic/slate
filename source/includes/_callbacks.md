# Callbacks

Callbacks are destinations to which Events are sent by the gateway.

You can define multiple callbacks so that Events are delivered to all of them.

[[object#Callback]]


## Create a callback

Details on how to create a new Callback.

[[endpoint#Callback#create]]


## Update a callback

Details on how to update an existing Callback object.

[[endpoint#Callback#update]]


## Retrieve a callback

Retrieve a single Callback.

[[endpoint#Callback#single]]

### Response

You will receive a `Callback` object JSON response. If the `Callback` was not found an `Error` will be returned.


## Delete a callback

Delete a single Callback.

[[endpoint#Callback#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `Callback` was not found an `Error` will be returned.


## Search for callbacks

Returns a list of `Callback`s.

[[endpoint#Callback#search]]

