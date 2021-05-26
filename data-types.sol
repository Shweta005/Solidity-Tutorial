pragma solidity 0.8.0;      //defining version of solidity compiler

contract Bank{
    string public name= "Central Bank";
    bool public isActive;
    uint public bankBalance;
    uint public amtTrans;
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    uint8 feepercent= 2;
     
     function sendFunds(address payable _receiver) public payable{
       
        //deduct fees
       uint feeAmount = ((msg.value*100)* uint256(feepercent))/10000;
        uint tAmt = msg.value - feeAmount;
        bankBalance += feeAmount;
        amtTrans += tAmt;
        _receiver.transfer(tAmt);
        //update contract balance
        
        //update amt transacted
        
        //accept Funds
        
        //transfer
        
    }
    function withdraw() public payable{
        uint tAmt = bankBalance;
        bankBalance -= bankBalance;
        payable(owner).transfer(bankBalance);
    }
    
    function displayName() public view returns(string memory){
        return name;
    }
   
    function bBalance() public view returns(uint){
        return bankBalance;
    }
    
    function getBalance(address _contract) public view returns(uint){
        return _contract.balance;
    }
    
    function calculateFee(uint _value) public pure returns(uint){
        return ((_value*100)*2)/10000;
    }
   
}