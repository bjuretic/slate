# Addresses

`Address` object allow you to save address information about your customers in the gateway.

You can save multiple addresses for each [Customer](#customers).

[[object#Address]]

## Create an Address

Details on how to create a new Address object for an existing Customer.

All parameters are optional, so that you can tailor the use of the Address object according to your needs.

Newly created address is not default address for the Customer. You have to set the default Address using the Customer API.

[[endpoint#Address#create]]

## Update an Address

Details on how to update an existing Address object.

You should set only those parameters that you wish to change. If you wish to reset some parameter (set it to null), set the parameter name in the request, but without setting a value (empty string).

[[endpoint#Address#update]]

### Response

Returns an updated Address object.

## Retrieve an Address

Retrieve a single Address.

[[endpoint#Address#single]]

### Response

You will receive an `Address` object JSON response. If the `Address` was not found an `Error` will be returned.


## Delete an Address

Delete a single Address.

[[endpoint#Address#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `Address` was not found an `Error` will be returned.


## Search for Addresses

Retrieves a list of `Address` objects for a given `Customer`.

[[endpoint#Address#search]]
