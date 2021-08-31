// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract SimpleIntegerExample{
    
    // uint variables are initialized to 0 by default unless specified otherwise
    uint public myUint;

    // This function takes an argument and assigns it's value to the global variable myUint
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}