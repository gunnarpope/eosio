# Build Notes
Date 8/15/18


* EOSIO v1.2.0
After running:
```
eos$ git pull
eos$ cd build
eos/build$ ./eosio_build.sh
```

I get an output of:
```
[100%] Built target nodeos


	 _______  _______  _______ _________ _______
	(  ____ \(  ___  )(  ____ \\__   __/(  ___  )
	| (    \/| (   ) || (    \/   ) (   | (   ) |
	| (__    | |   | || (_____    | |   | |   | |
	|  __)   | |   | |(_____  )   | |   | |   | |
	| (      | |   | |      ) |   | |   | |   | |
	| (____/\| (___) |/\____) |___) (___| (___) |
	(_______/(_______)\_______)\_______/(_______)

	EOSIO has been successfully built. 00:07:44

	To verify your installation run the following commands:

	export PATH=${HOME}/opt/mongodb/bin:$PATH
	/home/gp/opt/mongodb/bin/mongod -f /home/gp/opt/mongodb/mongod.conf &
	cd /home/gp/eos/build; make test

	For more information:
	EOSIO website: https://eos.io
	EOSIO Telegram channel @ https://t.me/EOSProject
	EOSIO resources: https://eos.io/resources/
	EOSIO Stack Exchange: https://eosio.stackexchange.com
	EOSIO wiki: https://github.com/EOSIO/eos/wiki

```
I get a bunch of errors when running the installation build from above:
```
The following tests FAILED:
	 32 - nodeos_sanity_test (Failed)
	 33 - nodeos_run_test (Failed)
	 34 - bnet_nodeos_run_test (Failed)
	 36 - nodeos_run_test-mongodb (Failed)
	 37 - distributed-transactions-test (Failed)
	 38 - restart-scenarios-test-resync (Failed)
	 39 - restart-scenarios-test-hard_replay (Failed)
	 40 - restart-scenarios-test-none (Failed)
	 41 - validate_dirty_db_test (Failed)
	 42 - nodeos_sanity_lr_test (Failed)
	 43 - bnet_nodeos_sanity_lr_test (Failed)
	 44 - nodeos_voting_lr_test (Failed)
	 45 - bnet_nodeos_voting_lr_test (Failed)
	 46 - nodeos_under_min_avail_ram_lr_test (Failed)
Errors while running CTest

```
