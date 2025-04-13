// get funds from users
// withdraw funds
// set a miimum funding value i USD

// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

// This will only compile via IR
contract Coin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    mapping(address => uint) public balances;
    // Events allow clients to react to specific
    // contract changes you declare
    event Sent(address from, address to, uint amount);
    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
    }
    // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        // require(amount <= balances[msg.sender], InsufficientBalance(amount, balances[msg.sender]));
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance(amount, balances[msg.sender]);
        }
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }

}

// is trying to throw a custom error (InsufficientBalance) using require(),
// but that syntax only works when the Solidity compiler uses the "via-IR" 
// backend, which is currently not the default unless explicitly enabled.