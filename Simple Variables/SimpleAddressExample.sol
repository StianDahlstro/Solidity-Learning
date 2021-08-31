// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract SimpleAddressExample {

    // An address variable is automatically initialized to the address 0x0...00 unless specified otherwise
    // This address is also known as a burner address, where you cannot return funds under any circumstance
    address public myAddress;

    // This function takes an address as an argument and assigns it to the global variable myAddress
    function setAddress(address _address) public {
        myAddress = _address;
    }

    // This function returns the balance of the myAddress address in WEI
    // For the function to be able to return a value, the function definition needs to end
    // with the return() keyword with the variable type of the return value in the parenthesis
    // To check an address' balance, we use ".balance" which is a member of the address variable type
    function getBalanceOfAccount() public view returns(uint) {
        return myAddress.balance;
    }
}