// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Depositer{
    mapping(address => uint256) balances;
    
    event Deposit(uint value, address depositer);
    event Withdraw(uint value, address withdrawer);

    function deposit() public payable{
        balances[msg.sender]+= msg.value;

        emit Deposit(msg.value, msg.sender);
    }


    function withdraw () public payable{
        uint256 userBalance=balances[msg.sender];
        balances[msg.sender]=0;
        payable(msg.sender).transfer(userBalance);  

        emit Withdraw(userBalance, msg.sender);
        
    }


    function getBalance(address user) public view returns(uint256){
        return balances[user];
    } 
}
