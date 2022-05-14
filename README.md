# Geth private network setup with Docker.
Docker compose creates a private network with initial balances 
populated for all provided Ethereum accounts from a keystore directory.

## 1. Environment variables.
* Create `.env` file in the root folder
* Copy and past a content of `.env-example` file to `.env`
* Set environment variables

## 1. Generate Ethereum accounts (keystore).
Initial balance will be allocated for all account keys in `./keystore` directory.

A key can be generated with `Go Ethereum`.

```bash
docker run --entrypoint="" \
  -v "[ABSOLUTE-PATH]/geth-docker-private-network/:/node/keystore" \
  -it ethereum/client-go:stable \
  geth account new --datadir /node/keystore
```

## 2. Run a private network.
```bash
docker compose up
```
