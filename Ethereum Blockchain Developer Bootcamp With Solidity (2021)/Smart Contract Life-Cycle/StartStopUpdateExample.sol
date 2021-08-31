// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract StartStopUpdateExample {
    
    // A public address variable that contains the address of
    // the publisher of the contract (check construct)
    address public owner;

    // A boolean value initialized to false that decides if
    // the contract and its functions can be interacted with
    bool public paused;

    // The constructor function is a function that can only be called once,
    // and is automatically executed when the contract is initially deployed
    // In this example, it sets the address variable "owner" to the address
    // that deployed the contract
    constructor() {
        owner = msg.sender;
    }

    // This function allows the contract address to receive Ether / WEI
    // The funds can be sent from anyone
    function sendMoney() public payable {

    }

    // This function lets the owner of the contract (decided by the constructor)
    // change the state of the boolean variable "paused". This variable is then
    // used in other functions to check if users can interact with the functions
    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You're not eligible to change the contract's state");
        paused = _paused;
    }

    // This function only executes if the caller address is the same address
    // as the one that deployed the contract, and if the contract is not
    // paused by the owner. If that is not the case, the transaction will
    // fail and return the error message strings in the require statements
    // If the require statements are true, in other words if the function caller 
    // is the owner of the contract and the contract isn't paused,
    // the funds can be withdrawn to the address that is passed as the function argument
    function withdrawAllFunds(address payable _to) public {
        require(owner == msg.sender, "You are not eligible to withdraw funds");
        require(paused == false, "Contract Paused");
        _to.transfer(address(this).balance);
    }

    // The selfdestruct function might be removed from future Solidity 
    // compiler versions, and it's important to keep that in mind.
    // Currently, the selfdestruct function "destroys" the smart contract
    // and transfers all of it's funds to the given address
    // The contract then have limited functionality. It can receive funds
    // but the code running on that address has stopped and you cannot 
    // withdraw the funds
    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are not eligible to execute this function");
        selfdestruct(_to);
    }
}

// With the selfdestruct function currently in place, there is possible to 
// instruct the EVM to deploy an updated smart contract on the same address
// when you have destroyed the old source code for the contract
// This is possible with "CREATE2" op-code, but it's probably just as easy to 
// avoid this altogether than having a selfdestruct function in a contract
// that can potentially get hacked