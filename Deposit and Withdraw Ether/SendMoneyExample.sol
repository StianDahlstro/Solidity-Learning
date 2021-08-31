// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract SendMoneyExample {

    // This variable is a public global (storage) variable that keeps track of the 
    // total amount of WEI sent to the contract / address
    uint public balanceReceived;

    // This variable keeps track of the time (blocks) on the chain
    // it is expressed as a uint type as the block numbers are just that, numbers
    // In this case, it is used to prevent transferring funds to and from the 
    // contract address too frequent
    // When the contract address receives funds, it locks both the withdrawal 
    // functions for 1 minute. If the lockedUntil variable is less than the current
    // time, the functions can again withdraw funds
    uint public lockedUntil;

    // This function receives funds and adds them to the balanceReceived variable
    // to keep track of the total amount of funds received
    // For the contract address to receive funds, it needs to have a function
    // with the keyword "payable"
    // The "msg" object is a global, always-existing object containing information
    // about each transaction. Value keeps track of the WEI transferred to the address
    // and Sender keeps track of the account address that called the transaction.
    function receiveMoney() public payable {
        balanceReceived += msg.value;
        lockedUntil = block.timestamp + 1 minutes;
    }

    // This function returns the current balance of the smart contract's address
    // A view function only reads the contents of the address and does
    // not perform a transaction, and therefore it doesn't alter the storage
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // This function stores the address that called the function / performed the transaction
    // as an address that can receive funds with the keyword payable
    // Both sides of the "=" of the variable "to" needs the keyword payable
    // Both to assess that the address that called the function is an address that can
    // receive funds, and to keep it as an address that can receive money in the "to" variable
    // .send and .transfer cannot be used on variables that's not marked as payable
    // The 2 lines in the codeblock could be condensed into 1, not requiring the use of "to" as follows:
    // payable(msg.sender).transfer(getBalance());
    function withdrawFunds() public {
        if(lockedUntil < block.timestamp) {
            address payable to = payable(msg.sender);
            to.transfer(getBalance());
        }
    }

    // This function takes an address as an argument and withdraws all the funds in the contract address
    // to the given argument address
    // It is important to remember to use the payable keyword for all addresses that are to recieve funds
    function withdrawFundsTo(address payable _to) public {
        if(lockedUntil < block.timestamp) {
            _to.transfer(getBalance());
        }
    }
}