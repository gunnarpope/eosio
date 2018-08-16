## Upload and communicate with the asserter contracts

```
~/eos/contracts/test.inline $ eosiocpp -o ~/eos/contracts/asserter/asserter.wast ~/eos/contracts/asserter/asserter.cpp
~/eos/contracts/test.inline $ cleos set contract gunnar ~/eos/contracts/asserter/
Reading WASM from /home/gp/eos/contracts/asserter/asserter.wasm...
Publishing contract...
executed transaction: 2ddf96065989f7e0ac562770ddf2de472cc580af579859a36809490fb4dd7b1d  2512 bytes  510 us
#         eosio <= eosio::setcode               {"account":"gunnar","vmtype":0,"vmversion":0,"code":"0061736d0100000001360b6000006000017e60027e7e006...
#         eosio <= eosio::setabi                {"account":"gunnar","abi":"0e656f73696f3a3a6162692f312e30000209617373657274646566000209636f6e6469746...
warning: transaction executed locally, but may not be confirmed by the network yet    ]
~/eos/contracts/test.inline $ cleos get abi gunnar
{
  "version": "eosio::abi/1.0",
  "types": [],
  "structs": [{
      "name": "assertdef",
      "base": "",
      "fields": [{
          "name": "condition",
          "type": "int8"
        },{
          "name": "message",
          "type": "string"
        }
      ]
    },{
      "name": "nothing",
      "base": "",
      "fields": []
    }
  ],
  "actions": [{
      "name": "procassert",
      "type": "assertdef",
      "ricardian_contract": ""
    },{
      "name": "provereset",
      "type": "nothing",
      "ricardian_contract": ""
    }
  ],
  "tables": [],
  "ricardian_clauses": [],
  "error_messages": [],
  "abi_extensions": []
}
```

Now, push an action to the contract
```
~/eos/contracts/test.inline $ cleos push action -j gunnar procassert  '["20"]' -p gunnar@active
{
  "transaction_id": "c199069563e2dd891113df757909ece907c44285e563eab26de9eb4bc3b45182",
  "processed": {
    "id": "c199069563e2dd891113df757909ece907c44285e563eab26de9eb4bc3b45182",
    "receipt": {
      "status": "executed",
      "cpu_usage_us": 1941,
      "net_usage_words": 12
    },
    "elapsed": 1941,
    "net_usage": 96,
    "scheduled": false,
    "action_traces": [{
        "receipt": {
          "receiver": "gunnar",
          "act_digest": "9ab49f8cf71a459a0f6e839ff0a99c446f8db37308e14af39d7884198e515c19",
          "global_sequence": 4251,
          "recv_sequence": 1,
          "auth_sequence": [[
              "gunnar",
              5
            ]
          ],
          "code_sequence": 2,
          "abi_sequence": 2
        },
        "act": {
          "account": "gunnar",
          "name": "procassert",
          "authorization": [{
              "actor": "gunnar",
              "permission": "active"
            }
          ],
          "data": {
            "condition": 20,
            "message": ""
          },
          "hex_data": "1400"
        },
        "elapsed": 1757,
        "cpu_usage": 0,
        "console": "",
        "total_cpu_usage": 0,
        "trx_id": "c199069563e2dd891113df757909ece907c44285e563eab26de9eb4bc3b45182",
        "inline_traces": []
      }
    ],
    "except": null
  }
}

```
