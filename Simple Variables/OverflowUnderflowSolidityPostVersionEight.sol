// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract OverflowUnderflowSolidityPostVersionEight {

    // Uint8 with the max value of 255 initialized to 0
    uint8 public myUint8;

    // Decrementing an unsigned integer below it's minimum value will need an "unchecked" keyword
    // to let it roll over in Solidity compiler versions after 0.8.0
    // Else it will return an error and the transaction fails.
    function decrement() public {
        unchecked {
            myUint8--;
        }
    }

    // Incrementing an unsigned integer above it's maximum value will need an "unchecked" keyword
    // to let it roll over in Solidity compiler versions after 0.8.0
    // Else it will return an error and the transaction fails.
    function increment() public {
        unchecked {
            myUint8++;
        }
    }

}