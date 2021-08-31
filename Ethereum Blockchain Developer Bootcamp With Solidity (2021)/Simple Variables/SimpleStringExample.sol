// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract SimpleStringExample {

    // A string variable will be initialized to "" unless specified otherwise
    string public myString = "Hello World!";

    // This function takes a string as an argument and passes the value of the argument
    // to the global variable myString
    // When using strings as parameters, it's necessary to specify the storage location 
    // of the string. If this is not done, the compiler will throw an error
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}