// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract SimpleBooleanExample {
    
    // Boolean variables are initialized to false as their default value unless specified otherwise
    bool public myBool;

    // This function takes a boolean as an argument and assigns it's value to the global variable myBool
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

}