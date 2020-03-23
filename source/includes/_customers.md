# Customers

Customers allow you to better track your payments, by associating them with the logical entities in your application (e.g. customers, accounts, clients, users etc.).

Also, Customers are used to store payment instruments in Pencepay gateway, so that you can e.g. make a subscription, trigger a future payment with those safely stored payment instruments.

Using the Customer API you can perform all operations related to Customers available in the Administration tool, from your application.

[[object#Customer]]

In Customer object, all properties except `uid` and `created` are optional.

## Create a Customer

Details on how to create a new Customer object.

[[endpoint#Customer#create]]

All parameters for creating a Customer object are optional, so that you can send us only the data you have, or need to track on the gateway.

### Response

Created `Customer` object, or `Error` in case validation on some property failed.


## Update a Customer

Details on how to update an existing Customer object.

You should set only those parameters that you wish to change. If you wish to reset some parameter (set it to null), set the parameter name in the request, but without setting a value (empty string).

If you do not provide some parameters, the existing values will not be changed.

[[endpoint#Customer#update]]

### Response

Updated `Customer` object, or `Error` in case validation on some property failed.


## Retrieve a Customer

Use this call to retrieve a single Customer.

[[endpoint#Customer#single]]

### Response

You will receive a `Customer` object JSON response. If the `Customer` was not found an `Error` will be returned.


## Delete a Customer

Delete a single Customer.

All the related credit cards, bank accounts and addresses will be deleted as well, if they are not used in any running process, or transaction.

[[endpoint#Customer#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `Customer` was not found an `Error` will be returned.


## Search for Customers

Retrieves a list of `Customer` objects, using the given constraints.

You can limit the size of the list returned by using the `limit` parameter, and control the pagination using the `after` parameters.

Complex searches through the objects are possible, using a number of search operators.

[[endpoint#Customer#search]]

### Response

Returns a List object with embeded Customer objects.

See [Pagination](#pagination) for general details on how to retrieve and paginate through a list of objects.

