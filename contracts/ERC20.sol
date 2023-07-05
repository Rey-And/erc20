// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ERC20{
    address private owner;
    string private name;
    string private symbol;
    uint256 private voteVoice;
    bool isVotingStarted;
    uint256 startTime;
    uint256 finishTime;
    uint256 votingDuration =180;
    uint256 positiveVote;
    uint256 negativeVote;
    uint256 result;

    mapping (address=>uint256) balances;
    event StartVoting(uint256 startTime, uint256 finishTime, address voter);
    event EndOfVoting(uint256 result);
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
    
    function startVoting()public{
        require(balances[msg.sender]<=0, "Don`t have tokens for start voting");
        require(isVotingStarted==true, "Voting dont start");
        startTime=block.timestamp;
        finishTime=startTime+votingDuration;
        
        emit StartVoting(startTime,finishTime, msg.sender);

    }

    function voting()public{
        voteVoice=balances[msg.sender];
        positiveVote+=voteVoice;
        negativeVote+=voteVoice;
    }

    function endOfVoting()public{
        if(positiveVote>negativeVote){
            result=positiveVote;
            emit EndOfVoting(positiveVote);
        }
        
        else if(negativeVote>positiveVote){
            result=negativeVote;
            emit EndOfVoting(negativeVote);
        }
        else{
            emit EndOfVoting(0);
            result=0;
        }
        positiveVote=0;
        negativeVote=0;   
    }

    function getResult()public view returns(uint256){
        return result;
    }

    function getVote1()public view returns(uint256){
        return positiveVote;
    }

    function getVote2()public view returns(uint256){
        return negativeVote;
    }

    function getStartTime()public view returns(uint256){
        return startTime;
    }

    function getFinishTime()public view returns(uint256){
        return finishTime;
    }

    function getBalance(address user)public view returns(uint256){
        return balances[user];
    }

    function getName()public view returns(string memory){
        return name;
    }
}