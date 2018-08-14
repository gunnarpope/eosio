# find the port and info about where the keosd process is running
alias lskeosd='pgrep keosd | xargs printf " -p %d" | xargs lsof -Pani'


# find the port and info about where the node process is running
alias lsnodeos='pgrep nodeos | xargs printf " -p %d" | xargs lsof -Pani'

# start nodeos by running ~$ start_nodeos
alias start_nodeos='nodeos -e -p eosio --delete-all-blocks --plugin eosio::chain_api_plugin --plugin eosio::history_api_plugin'
