# Upload the test.inline contract for EOSIO v1.2.0
```
~/eos/contracts/test.inline $ hp-wallet_unlock
Unlocking wallet with local stored password
Unlocked: default
~/eos/contracts/test.inline $ cleos wallet list keys
Wallets:
[
  "default *"
]
[
  "EOS4urbT3EyCrRJps2gz5UmTWLzqk1FMuvsdZQJ73dWG37NRBvktS",
  "EOS5P4NyE2jFinj1YpoKcSaAwpp3RMaUi53wkJkNuzN9kpbQUNGoq",
  "EOS5iBKH8KxAU4BLomJseyhWVvwmTiU4a98xKVwLciPZosHgJ66Z5",
  "EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"
]
~/eos/contracts/test.inline $ cleos create account eosio gunnar EOS4urbT3EyCrRJps2gz5UmTWLzqk1FMuvsdZQJ73dWG37NRBvktS EOS5P4NyE2jFinj1YpoKcSaAwpp3RMaUi53wkJkNuzN9kpbQUNGoq
executed transaction: 9adf395a448bc6f39eeb974e6aa18c598203c43c54fd76ad3c9450f8b11ac622  200 bytes  209 us
#         eosio <= eosio::newaccount            {"creator":"eosio","name":"gunnar","owner":{"threshold":1,"keys":[{"key":"EOS4urbT3EyCrRJps2gz5UmTWL...
warning: transaction executed locally, but may not be confirmed by the network yet    ]
~/eos/contracts/test.inline $ cleos set contract gunnar ~/eos/contracts/test.inline/
Reading WASM from /home/gp/eos/contracts/test.inline/test.inline.wasm...
Error 3160009: No wast file found
Error Details:
no wasm file found /home/gp/eos/contracts/test.inline/test.inline.wasm
~/eos/contracts/test.inline $ ls
CMakeLists.txt  test.inline.abi  test.inline.cpp  test.inline.hpp
~/eos/contracts/test.inline $ eosiocpp -o test.inline.wast test.inline.cpp
~/eos/contracts/test.inline $ ls
CMakeLists.txt  test.inline.abi  test.inline.cpp  test.inline.hpp  test.inline.wasm  test.inline.wast
~/eos/contracts/test.inline $ cleos set contract gunnar ~/eos/contracts/test.inline/
Reading WASM from /home/gp/eos/contracts/test.inline/test.inline.wasm...
Publishing contract...
executed transaction: d5d9d6946278d8952c5d4039d2c22c1bf3cb8ad430bb1e23327f4618ab659453  2920 bytes  31318 us
#         eosio <= eosio::setcode               {"account":"gunnar","vmtype":0,"vmversion":0,"code":"0061736d0100000001490e60027f7e0060047f7e7e7e006...
#         eosio <= eosio::setabi                {"account":"gunnar","abi":"0e656f73696f3a3a6162692f312e30000207666f7277617264000307726571617574680c6...
warning: transaction executed locally, but may not be confirmed by the network yet    ]

```


Find some information about the contract from the .abi file
```
~/eos/contracts/test.inline $ cleos get abi gunnar
{
  "version": "eosio::abi/1.0",
  "types": [],
  "structs": [{
      "name": "forward",
      "base": "",
      "fields": [{
          "name": "reqauth",
          "type": "account_name"
        },{
          "name": "forward_code",
          "type": "account_name"
        },{
          "name": "forward_auth",
          "type": "account_name"
        }
      ]
    },{
      "name": "reqauth",
      "base": "",
      "fields": [{
          "name": "from",
          "type": "account_name"
        }
      ]
    }
  ],
  "actions": [{
      "name": "reqauth",
      "type": "reqauth",
      "ricardian_contract": ""
    },{
      "name": "forward",
      "type": "forward",
      "ricardian_contract": ""
    }
  ],
  "tables": [],
  "ricardian_clauses": [],
  "error_messages": [],
  "abi_extensions": []
}

```
Trying a simple contracts
```

Now, push an action to test the smart contract:
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
