# Geth private network setup with Docker.

Docker compose creates a private network with initial balances 
populated for all provided Ethereum accounts from a keystore directory.

## Environment variables.

Rename `.env-example` to `.env` and update all required variables.

```
ETH_KEYSTORE_DIR=./keystore/EXAMPLE--UTC--2022-05-08T20-57-17.198504212Z--945d7382e49bb85e5eecb1c43a82686cbf3797ef
```

By default `ETH_KEYSTORE_DIR` variable is set to a previously generate Ethereum account. Any other accounts 
can be used by providing a path to Ethereum keystore directory.
