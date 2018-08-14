# eosio
Publishing my development notes as I learn to become an EOS.IO blockchain developer

## EOS.IO Build notes
After cloning the eos.io code from github, run the build scripts:
```
cd eos
./eosio_build.sh
```


If the cleos, eosiocpp, etc.. scripts aren't recognized,
sometimes you have to set the environment variables for cleos, nodeos, etc

* Add these varables to your ~/.bashrc file when using eosio v1.1.x
```
$ export PATH=$PATH:/usr/local/eosio/bin
```

## Start your development
Open a node to start producing blocks
```
$ nodeos -e -p eosio --delete-all-blocks --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin
```

## Setting aliases for eosio
Add these aliases to your ~/.bash_aliases file to save dev time.
```
# find the port and info about where the keosd process is running
alias lskeosd='pgrep keosd | xargs printf " -p %d" | xargs lsof -Pani'


# find the port and info about where the node process is running
alias lsnodeos='pgrep nodeos | xargs printf " -p %d" | xargs lsof -Pani'

# start nodeos by running ~$ start_nodeos
alias start_nodeos='nodeos -e -p eosio --delete-all-blocks --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin'
```

Then, you can start nodeos using `~$ start_nodeos`.
