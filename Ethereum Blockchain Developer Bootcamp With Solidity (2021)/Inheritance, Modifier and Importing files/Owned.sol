//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Owned {
    
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner, "You're not the owner.");
        _;
    }
}