// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "./Allowance.sol";

contract SharedAllowanceWallet is Allowance {
    
    event FundsSent(address indexed _beneficiary, uint _amount);
    event FundsReceived(address indexed _from, uint _amount);

    function withdrawFunds(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        // Require statement in this case is here just to produce the error message when the 
        // Exception for the contract not having more funds is happening
        require(_amount <= address(this).balance, "There are currently not enough funds stored in this contract");
        if (owner() != msg.sender) {
            reduceAllowance(msg.sender, _amount);
        }
        emit FundsSent(_to, _amount);
        _to.transfer(_amount);
    }
  
    function renounceOwnership() public override onlyOwner {
        revert("Can't renounce ownership here");
    }

    receive() external payable {
        emit FundsReceived(msg.sender, msg.value);
    }
}