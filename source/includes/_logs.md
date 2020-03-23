# Logs

Log objects record all important activities on the gateway, and are intended for debugging purposes.

[[object#Log]]


## Retrieve a log

Retrieve a single Log object.

[[endpoint#Log#single]]

### Response

You will receive a `Log` object JSON response. If the `Log` was not found an `Error` will be returned.


## Search for logs

```shell
$ curl https://api.pencepay.com/v1/logs?limit=5 \
    -u public_key:secret_key
```

> The above command returns JSON structured like this:

```json
{
    "type": "list",
    "totalCount": 5,
    "hasPrevious": false,
    "hasNext": false,
    "items": [{
        "uid": "log_bfXLckyxeTgxnf",
        "type": "log",
        "requestMethod": "POST",
        "requestIpAddr": "127.0.0.1",
        "requestPath": "/v1/customer/cust_rLu7LcgR9ieGdu",
        "requestParameters": null,
        "requestBody": "{\"name\":\"John\",\"firstName\":\"Johnny\",\"lastName\":\"Hancock\",\"phone\":\"\",\"mobile\":\"\",\"email\":\"\",\"description\":\"test Customer\",\"customData\":{}}",
        "responseBody": "{\"uid\":\"cust_rLu7LcgR9ieGdu\",\"type\":\"customer\",\"name\":\"John\",\"firstName\":\"Johnny\",\"lastName\":\"Hancock\",\"description\":\"test Customer\",\"addresses\":[],\"creditCards\":[],\"bankAccounts\":[],\"defaultBillingAddress\":\"addr_dqCA5Td5Rcb85C\",\"defaultCreditCard\":\"card_yeUGxiyjrT5KEU\",\"defaultBankAccount\":\"ba_reH7BiByKTXgBH\",\"customData\":{},\"created\":1419242228}",
        "responseCode": 200,
        "created": 1424001068,
        "relations": ["cust_rLu7LcgR9ieGdu", "addr_dqCA5Td5Rcb85C", "card_yeUGxiyjrT5KEU", "ba_reH7BiByKTXgBH"]
    }, {...}]
}
```

### HTTP Request

`GET https://api.pencepay.com/v1/logs`

### Parameters

Property         | Required   |  Description
---------------- |----------- |------------------------------
`limit`          | false      | Maximum number of items returned.



