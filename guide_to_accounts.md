## Open a wallet, import your private  keys and the keys for the eosio account
Note that these passwords are only used for development.

```
$ start_nodeos
```
Now open a new terminal and unlock your wallet
```
$ hp-wallet_unlock
```
If a wallet isn't created, import your owner and active keys
```
$ cleos create key
Private key: OWNER_KEY
Public key: OWNER_PUBLIC_KEY


$ cleos create key
Private key: OWNER_KEY
Public key: OWNER_PUBLIC_KEY


$ cleos wallet import --private-key
OWNER_KEY


$ cleos wallet import --private-key
ACTIVE_KEY
```

Then import the keys for the eosio account used to authorize nodeos
```
$ cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
$ cleos wallet import --private-key 5JhkMn1vP6omtS4nwzWvZX9a6rjuXmpDY7kiMiXSbHW2XRowG5D
```

Once all the keys have been imported into the wallet, run the create account script from Scott
```
$ hp-create_account gunnar
```

Or alternatively, you can do it by hand:
```
$ cleos create account eosio gunnar EOS4urbT3EyCrRJps2gz5UmTWLzqk1FMuvsdZQJ73dWG37NRBvktS EOS5P4NyE2jFinj1YpoKcSaAwpp3RMaUi53wkJkNuzN9kpbQUNGoq
```
