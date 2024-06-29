pragma solidity ^0.8.0;

contract ErrorHandlingDemo {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
    }

    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not authorized to call this function");
        _;
    }

    // Function that uses require to validate inputs
    function setValue(uint256 _newValue) public onlyOwner {
        require(_newValue > 0, "Value must be greater than zero");
        value = _newValue;
    }

    // Function that uses assert to validate an invariant
    function validateInvariant(uint256 a, uint256 b) public pure {
        uint256 sum = a + b;
        // Assert that the sum is not zero
        assert(sum != 0);
    }

    // Function that uses revert to handle specific conditions
    function conditionalRevert(uint256 input) public pure returns (string memory) {
        if (input == 0) {
            revert("Input cannot be zero");
        }
        return "Input is valid";
    }

    // Function that combines require, assert, and revert statements
    function complexFunction(uint256 a, uint256 b) public onlyOwner returns (uint256) {
        require(a > 0 && b > 0, "Inputs must be greater than zero");

        uint256 sum = a + b;
        // Assert that the sum is not zero
        assert(sum != 0);

        if (sum > 100) {
            revert("Sum exceeds 100");
        }

        value = sum;
        return value;
    }
}
