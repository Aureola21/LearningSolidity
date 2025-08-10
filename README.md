# StorageFactory Contract

## Overview

The `StorageFactory` contract demonstrates how to deploy and interact with multiple instances of the `SimpleStorage` contract dynamically.  
Instead of embedding the `SimpleStorage` code directly, it imports the contract for modularity and scalability.

## Features

- Maintains an array of deployed `SimpleStorage` contract addresses.
- Deploys new `SimpleStorage` contracts on demand.
- Interacts with any deployed `SimpleStorage` instance by index to:
  - Store a favorite number (`sfStore`).
  - Retrieve the stored favorite number (`sfGet`).

## How It Works

- Calling `createSimpleStorageContract()` deploys a new `SimpleStorage` and adds it to the array.
- `sfStore(index, number)` calls `store` on the selected `SimpleStorage` contract.
- `sfGet(index)` calls `retrieve` on the selected `SimpleStorage` contract.

## Usage

1. Deploy `StorageFactory`.
2. Use `createSimpleStorageContract()` to deploy new storage contracts.
3. Use `sfStore` and `sfGet` with the index of the deployed contract you want to interact with.

## Notes

- Requires `SimpleStorage.sol` in the same project for import.
- Illustrates contract factory pattern and contract-to-contract calls in Solidity.
