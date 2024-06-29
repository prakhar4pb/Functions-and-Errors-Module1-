# ErrorHandlingDemo Smart Contract

This Solidity smart contract demonstrates the use of `require()`, `assert()`, and `revert()` statements to handle errors and enforce conditions. The contract includes functions that utilize these statements in various scenarios to validate inputs and maintain the integrity of the contract's state.

## Overview

The `ErrorHandlingDemo` contract contains the following key features:

- **Owner Verification**: Ensures that only the contract owner can execute certain functions.
- **Input Validation**: Uses `require()` to check inputs and enforce conditions.
- **Invariant Checking**: Uses `assert()` to validate invariants.
- **Conditional Reversion**: Uses `revert()` to handle specific conditions and revert changes if necessary.

## Contract Functions


### Constructor

constructor() {
    owner = msg.sender;
}
Sets the owner to the address that deploys the contract.

### Modifiers

#### onlyOwner

modifier onlyOwner() {
    require(msg.sender == owner, "You are not authorized to call this function");
    _;
}
Restricts function access to the contract owner.

### setValue

function setValue(uint256 _newValue) public onlyOwner {
    require(_newValue > 0, "Value must be greater than zero");
    value = _newValue;
}
Sets the value state variable.
Requires the new value to be greater than zero.

### validateInvariant

function validateInvariant(uint256 a, uint256 b) public pure {
    uint256 sum = a + b;
    assert(sum != 0);
}
Validates that the sum of a and b is not zero.

### conditionalRevert

function conditionalRevert(uint256 input) public pure returns (string memory) {
    if (input == 0) {
        revert("Input cannot be zero");
    }
    return "Input is valid";
}
Reverts the transaction if the input is zero.

### complexFunction

function complexFunction(uint256 a, uint256 b) public onlyOwner returns (uint256) {
    require(a > 0 && b > 0, "Inputs must be greater than zero");

    uint256 sum = a + b;
    assert(sum != 0);
    if (sum > 100) {
        revert("Sum exceeds 100");
    }

    value = sum;
    return value;
}
Combines require(), assert(), and revert() to handle various conditions and errors.
Usage
To use this contract, deploy it to an Ethereum-compatible blockchain and interact with its functions using a tool like Remix, Truffle, or a web3.js-enabled frontend.

### Example Deployment (using Remix)
Open Remix.
Create a new file and paste the ErrorHandlingDemo contract code.
Compile the contract.
Deploy the contract to a selected environment (JavaScript VM, Injected Web3, etc.).
Interact with the deployed contract via the Remix interface.

### Author
Prakhar Bhardwaj


### License
This project is licensed under the MIT License - see the LICENSE file for details.

