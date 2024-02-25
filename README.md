# Degen


# MyToken Contract

MyToken is an ERC20 token contract written in Solidity. It extends the functionality provided by the OpenZeppelin library's ERC20 contract.

## Overview

MyToken allows the creation, transfer, and destruction of tokens on the Ethereum blockchain. It provides the following features:

- Minting new tokens by the owner.
- Burning tokens by any token holder.
- Transferring tokens between addresses.

## Functionality

### Constructor

The constructor initializes the token with the name "MyToken" and the symbol "MTK". Additionally, it mints 1,000,000 tokens and assigns them to the deployer's address.

### Minting

The `mint` function allows the owner to mint new tokens and assign them to a specified address.

### Burning

The `burn` function allows any token holder to burn a specified amount of tokens from their own balance.

### Transfer

The `transfer` function overrides the ERC20 `transfer` function to add additional validation for ensuring the sender has a sufficient balance before transferring tokens.

## Access Control

The contract includes an `onlyOwner` modifier that restricts certain functions to be called only by the owner of the contract.

## Requirements

- Solidity ^0.8.0
- OpenZeppelin Contracts v4.0.0 (ERC20)

## Usage

1. Deploy the contract to an Ethereum network.
2. Use the `mint` function to create new tokens.
3. Transfer tokens between addresses using the `transfer` function.
4. Burn tokens using the `burn` function.

## Security Considerations

- Ensure that the owner address is securely set during contract deployment.
- Be cautious when granting permissions to mint tokens, as it increases the total token supply.
- Use appropriate access controls and permissions for sensitive functions.

## License

This contract is released under the MIT License. You can find the full text of the license in the SPDX-License-Identifier tag within the contract file.

---
