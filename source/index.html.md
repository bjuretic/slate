---
title: Pencepay API reference

language_tabs:
  - json

toc_footers:
  - <a href='https://pencepay.com/payments'>&gt; Sign up for Pencepay account</a>
  - <a href='https://pencepay.com/about/support'>&gt; Contact Support</a>

includes:
  - customers
  - addresses
  - cards
  - bank_accounts
  - transactions
  - disputes
  - tags
  - paycodes
  - events
  - logs
  - callbacks
  - changelog

search: true
---

# Introduction

```
 _ __   ___ _ __   ___ ___ _ __   __ _ _   _
| '_ \ / _ \ '_ \ / __/ _ \ '_ \ / _` | | | |
| |_) |  __/ | | | (_|  __/ |_) | (_| | |_| |
| .__/ \___|_| |_|\___\___| .__/ \__,_|\__, |
|_|                       |_|          |___/
```

Welcome to Pencepay API reference documentation! This documentation is provided to make it easy for developers to lookup Pencepay gateway objects and parameters, and to provide insight into our low-level API.

Although the RESTful API presented here can be used directly, the recommended method for integrating with Pencepay is to use one of our supported libraries. Still, this documentation will give additional insight to the developer, and it also makes it possible to develop libraries not supported by Pencepay directly.

This documentation contains information on **all features** supported by the gateway, even if they are not implemented in a certain language-specific library.

## Libraries

The best method of integration is to use our libraries:

  - [Pencepay PHP Library](https://pencepay.com/docs/php/basics/setup.html)
  - [Pencepay Java Library](https://pencepay.com/docs/java/basics/setup.html)


### Want to help?

Do you wish to develop a library for Pencepay for a programming language not listed above? <a href='https://pencepay.com/about/pencepay.html'>Drop us an email</a>, and we will gladly give you full support and credit for your work.

## Authentication

Authentication to Pencepay API is done using the [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication). When authenticating, use your Public Key as a username, and your Secret Key as password.

After you signup for Pencepay account (which is free of charge), you can access your Keys in the [Administration tool](https://secure.pencepay.com/admin), under Setup - Users - (your user) - Keys.

All API endpoints must be accessed over the HTTPS, otherwise they will fail.

```shell
$ curl https://api.pencepay.com/v1/{...} -u "public_key:secret_key"
```

> Make sure to replace `public_key` and `secret_key` with your public and secret API keys.

## Errors

`Error` is a response returned by the gateway when any failure occurs. 

[[object#Error]]

### HTTP codes

The API will return a HTTP status code depending on the type of `Error`.

Status code  | Description
------------ | ------------
400          | Bad Request -- Some of the parameters sent in the request are invalid or missing. JSON response contains further information about the exact problem.
401          | Authentication problem -- Your API public or secret key is wrong
403          | Authorization refused -- You don't have permission to view the requested object, or to perform the requested action.
404          | Not Found -- Object with the given UID cannot be found (or you don't have permission for looking it up).
405          | Method Not Allowed -- You tried to access an invalid method
406          | Not Acceptable -- You requested a format that is not valid JSON
429          | Too Many Requests -- You're calling API too many times in the given interval. Try again later.
500          | Internal Server Error -- We had a problem with our server. Try again later.
503          | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.


## Custom data

When integrating your application with the gateway, you will sometimes find it useful to store your database IDs or other identifiers on the gateway, together with the created gateway objects.

Later when you retrieve the thus enriched objects, you will receive your custom data back with the object, which can be very useful in practice.

Use of `customData` property is enabled on most of the top-level gateway objects, like Customer, Transaction, CreditCard, Address etc.

To use `customData` use the HTTP "map" property format, e.g. `customData[myProperty]=myValue`.

If you wish to update `customData` keys or values, you need to provide all (updated) keys and values in the update call (if gateway object supports updating).

<aside class="notice">
Only simple, single-level, key-value data can be stored in this property.
</aside>


```bash
$ curl https://api.pencepay.com/v1/customer \
   -u public_key:secret_key \
   -d description="Test customer" \
   -d customData[reference]="6715123" \
   -d customData[customer_id]="5"
```

> Example of object with customData

```json
{
    "uid": "cust_zEUBdibR5T5X6U",
    "type": "customer",
    "name": null,
    "firstName": null,
    "lastName": null,
    "email": null,
    "phone": null,
    "mobile": null,
    "description": "Test customer",
    "addresses": [],
    "creditCards": [],
    "bankAccounts": [],
    "defaultBillingAddress": null,
    "defaultCreditCard": null,
    "defaultBankAccount": null,
    "customData": {
        "customer_id": "5",
        "reference": "6715123"
    },
    "created": 1424020139
}
```


## Pagination

To browse through the objects returned by using search, we use cursor-based pagination.

Cursor-based pagination is used (instead of classical page/offset pagination used in many applications), because of the real-time nature of the data handled by the gateway.

Because records (e.g. transactions) keep being added in real-time, if page/offset pagination was used there would be a chance that you miss some data while iterating.

To retrieve objects before the given UID, use `before` property set to that UID; likewise use `after` set to the UID of the object to retrieve objects after the given object.

`limit` is used to limit the amount of objects returned, but we will never return more than 100 objects.


### List object

```json
{
    "type": "list",
    "totalCount": 5,
    "hasPrevious": false,
    "hasNext": false,
    "items": [...]
}
```
List object is returned when search method is used for various gateway objects, and it contains helper field for easier navigation through all objects available in the gateway.

Property        | Type   |  Description
--------------- |------- |------------------------------
`type`          | string | 'list' constant
`totalCount`    | int    | Total number of objects of this type in the gateway
`hasPrevious`   | boolean| Are there any more objects before the first object in the `items`?
`hasNext`       | boolean| Are there any more objects after the last object in the `items`?
`items`         | list   | Requested objects


### Query parameters

```shell
$ curl https://api.pencepay.com/v1/customers?after=cust_6GUKEcnRqipj9U11&limit=20 \
    -u public_key:secret_key
```

> Example List response

```json
{
    "type": "list",
    "totalCount": 20,
    "hasPrevious": false,
    "hasNext": true,
    "items": [...]
}
```

Parameter        | Required   |  Description
---------------- |----------- |------------------------------
`limit`          | false      | Maximum number of items returned, default is 100 objects
`before`         | false      | UID of the object before which you wish items to be returned
`after`          | false      | UID of the object after which you wish items to be returned

