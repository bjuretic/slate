# Tags

Tags allow for better reporting and tracking of Transactions. You can attach multiple tags to a transaction, and later filter transactions based on tags.

[[object#Tag]]


## Create a tag

Details on how to create a new Tag.

[[endpoint#Tag#create]]


## Update a tag

Details on how to update an existing Tag object.

[[endpoint#Tag#update]]


## Retrieve a tag

Retrieve a single Tag.

[[endpoint#Tag#single]]

### Response

You will receive a `Tag` object JSON response. If the `Tag` was not found an `Error` will be returned.


## Delete a tag

Delete a single Tag.

You can only delete Tags which are not used by Transactions.

[[endpoint#Tag#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `Tag` was not found an `Error` will be returned.


## Search for tags

[[endpoint#Tag#search]]
