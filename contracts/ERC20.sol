// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ERC20{
    address public owner;
    string public name;
    string public symbol;
    mapping (address=>uint256) balances;
    
    constructor(address _owner, string memory _name, string memory _symbol){
        owner=_owner;
        name=_name;
        symbol=_symbol;
        balances[owner]=1000;
    }

    function transfer(address receiver, uint256 amount)public{
        require(amount<=balances[msg.sender], "Don`t have tokens for this transaction!");
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
        
    }
    


    function getBalance(address user)public view returns(uint256){
        return balances[user];
    }

    function getName()public view returns(string memory){
        return name;
    }
}