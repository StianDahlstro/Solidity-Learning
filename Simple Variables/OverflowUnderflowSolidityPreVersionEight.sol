// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract OverflowUnderflowSolidityPreVersionEight {

    // A Uint8 variable is initialized with the value 0 and a max value of 255
    uint8 public myUint8;

    // Decrementing an unsigned integer's value below it's minimum value will roll it's value over to it's max value
    // when using Solidity compiler versions pre v 0.8.0
    function decrement() public {
        myUint8--;
    }
    
    // Incrementing an unsigned integer's value above it's maximum value will roll over it's value to it's minimum value
    // when using Solidity compiler versions pre v 0.8.0
    function increment() public {
        myUint8++;
    }
}