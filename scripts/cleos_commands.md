# Useful cleos commands
* Get the abi from an account to find useful fields and actions
```
~/repos/eosio/scripts $ cleos -u ${EOSNEWYORK} get abi horustokenio
{
  "version": "eosio::abi/1.0",
  "types": [{
      "new_type_name": "account_name",
      "type": "name"
    }
  ],
  "structs": [{
      "name": "transfer",
      "base": "",
      "fields": [{
          "name": "from",
          "type": "account_name"
        },{
          "name": "to",
          "type": "account_name"
        },{
          "name": "quantity",
          "type": "asset"
        },{
          "name": "memo",
          "type": "string"
        }
      ]
    },{
      "name": "create",
      "base": "",
      "fields": [{
          "name": "issuer",
          "type": "account_name"
        },{
          "name": "maximum_supply",
          "type": "asset"
        }
      ]
    },{
      "name": "issue",
      "base": "",
      "fields": [{
          "name": "to",
          "type": "account_name"
        },{
          "name": "quantity",
          "type": "asset"
        },{
          "name": "memo",
          "type": "string"
        }
      ]
    },{
      "name": "account",
      "base": "",
      "fields": [{
          "name": "balance",
          "type": "asset"
        }
      ]
    },{
      "name": "currency_stats",
      "base": "",
      "fields": [{
          "name": "supply",
          "type": "asset"
        },{
          "name": "max_supply",
          "type": "asset"
        },{
          "name": "issuer",
          "type": "account_name"
        }
      ]
    }
  ],
  "actions": [{
      "name": "transfer",
      "type": "transfer",
      "ricardian_contract": ""
    },{
      "name": "issue",
      "type": "issue",
      "ricardian_contract": ""
    },{
      "name": "create",
      "type": "create",
      "ricardian_contract": ""
    }
  ],
  "tables": [{
      "name": "accounts",
      "index_type": "i64",
      "key_names": [
        "currency"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "account"
    },{
      "name": "stat",
      "index_type": "i64",
      "key_names": [
        "currency"
      ],
      "key_types": [
        "uint64"
      ],
      "type": "currency_stats"
    }
  ],
  "ricardian_clauses": [],
  "error_messages": [],
  "abi_extensions": []
}
```


* Get the info about an account
```
~/repos/eosio/scripts $ cleos -u ${EOSNEWYORK} get account horustokenio 
permissions: 
     owner     1:    1 EOS6qaZQiPUEG5ryXMp3cqmb4kqf4kjnwEevDXpyk8uPX6Bc1GnqL
        active     1:    1 EOS5omd3bSM4Gxeoc1RffhdTZMVtRz8rSPARXQoEEE2L2wrDYt1kv
memory: 
     quota:     46.31 MiB    used:     36.74 MiB  

net bandwidth: 
     staked:        200.1000 EOS           (total stake delegated from account to self)
     delegated:       0.0001 EOS           (total staked delegated to account from others)
     used:               308 bytes
     available:          130 MiB  
     limit:              130 MiB  

cpu bandwidth:
     staked:        500.1000 EOS           (total stake delegated from account to self)
     delegated:       0.0000 EOS           (total staked delegated to account from others)
     used:             2.389 ms   
     available:        9.376 sec  
     limit:            9.378 sec  

EOS balances: 
     liquid:           97.1969 EOS
     staked:          700.2000 EOS
     unstaking:         0.0000 EOS
     total:           797.3969 EOS

producers:     <not voted>

```
