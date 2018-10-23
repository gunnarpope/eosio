# Addressbook Contract
modified by gunnar pope
telegram: @gunnarpope

Make sure you open your wallet, create an account named `myaccount` and
then push it to the block chain.


```
~/eos/contracts/addressbook $ ~/scripts/comptract.sh myaccount addressbook
Reading WASM from ../addressbook/addressbook.wasm...
Publishing contract...
executed transaction: 08e9783640e6d00175921e9e3a15165298f8d7c298035b3db45f12872f2e3bc7  5664 bytes  794 us
#         eosio <= eosio::setcode               {"account":"myaccount","vmtype":0,"vmversion":0,"code":"0061736d010000000196011860027f7e0060077f7e7f...
#         eosio <= eosio::setabi                {"account":"myaccount","abi":"0e656f73696f3a3a6162692f312e30000205657261736500010475736572046e616d65...
warning: transaction executed locally, but may not be confirmed by the network yet    ]
~/eos/contracts/addressbook $ cat addressbook.abi
{
    "____comment": "This file was generated with eosio-abigen. DO NOT EDIT Thu Oct 18 12:37:23 2018",
    "version": "eosio::abi/1.0",
    "structs": [
        {
            "name": "erase",
            "base": "",
            "fields": [
                {
                    "name": "user",
                    "type": "name"
                }
            ]
        },
        {
            "name": "person",
            "base": "",
            "fields": [
                {
                    "name": "key",
                    "type": "name"
                },
                {
                    "name": "first_name",
                    "type": "string"
                },
                {
                    "name": "last_name",
                    "type": "string"
                },
                {
                    "name": "street",
                    "type": "string"
                },
                {
                    "name": "city",
                    "type": "string"
                },
                {
                    "name": "state",
                    "type": "string"
                }
            ]
        }
    ],
    "types": [],
    "actions": [
        {
            "name": "erase",
            "type": "erase",
            "ricardian_contract": ""
        }
    ],
    "tables": [
        {
            "name": "people",
            "type": "person",
            "index_type": "i64",
            "key_names": [],
            "key_types": []
        }
    ],
    "ricardian_clauses": [],
    "abi_extensions": []



```
Now, push some actions:

```
~/eos/contracts $ cleos push action myaccount upsert '["myaccount", "gunnar", "pope", "123 drink me way", "wonderland", "amsterdam"]' -p myaccount@active
executed transaction: f8f8da154e2b58a7365af297c098a1b7e3616073be6094a97b8b4472d4867ec0  152 bytes  952 us
#     myaccount <= myaccount::upsert            {"user":"myaccount","first_name":"gunnar","last_name":"pope","street":"123 drink me way","city":"won...
warning: transaction executed locally, but may not be confirmed by the network yet    ]
```

```
~/eos/contracts $ cleos get table myaccount myaccount people -k gunnar
{
  "rows": [{
      "key": "myaccount",
      "first_name": "gunnar",
      "last_name": "pope",
      "street": "123 drink me way",
      "city": "wonderland",
      "state": "amsterdam"
    }
  ],
  "more": false
}

```
