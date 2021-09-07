//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract SimpleMappingExample {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) uintUintBoolMapping; // Intentionally not public to create a getter function

    function setValueMyMapping(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressMappingToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    // Set function for the mapping that includes a mapping
    function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    } 

    // Get function for the mapping that includes a mapping
    function getUintUintBoolMapping(uint _index1, uint _index2) public view returns(bool) {
        return uintUintBoolMapping[_index1][_index2];
    }
}