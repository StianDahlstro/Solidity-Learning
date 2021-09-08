//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract WillThrow {
    
    function aFunction() public {
        require(false, "Error message");
    }
}

contract ErrorHandling {
    
    event ErrorLogging(string reason);
    
    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            
        }   catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}