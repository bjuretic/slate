# Bank accounts

Bank accounts can be saved for a Customer so that customer can later be charged (SEPA Debit, ELV etc.) or that you can payout funds to that bank account (e.g. for marketplaces which need to pay-out sellers from the accumulated funds).

[[object#BankAccount]]

## Create a bank account

Basic syntax/sanity validation of the bank account data is performed when the account is created, based on the provided country code (using validation rules specific for that country).

Account will not be created if validation fails. FIXME

Please note that the validation performed is only logical - no attempt is made to contact the bank and actually verify that the bank account exists, is active and/or has funds in it at this point in time.

[[endpoint#BankAccount#create]]

<aside class="notice">
You must provide either `accountNumber` or `iban`.
</aside>


## Update a bank account

Details on how to update an existing BankAccount object.

You should provide only those properties which you wish to update.

When you update a bank account, we will rerun validation. If validation fails, object will not be updated.

[[endpoint#BankAccount#update]]



## Retrieve a bank account

Retrieve a single BankAccount object.

[[endpoint#BankAccount#single]]

### Response

You will receive a `BankAccount` object, or `Error` in case of failure.


## Delete a bank account

Delete a single BankAccount.

[[endpoint#BankAccount#delete]]

### Response

You will receive a `DeleteResult` object as response. If the `CreditCard` was not found an `Error` will be returned.



## Search for bank accounts

Retrieves a list of `BankAccount` objects, saved for a specific customer.

[[endpoint#BankAccount#search]]

