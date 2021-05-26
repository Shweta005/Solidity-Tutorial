pragma solidity ^0.8.0;

contract evCharging{
    
    struct Company{
       uint id;
       string investorName;
       uint stationPrice;
       uint monthlyFee;
    }
    
    function registerInvestor(
                  string memory _investorName,
                  uint _stationPurchased,
                  uint _stationCost,
                  uint _fee ) public returns(bool flag_){
                      flag_ = true;
                      
                  }
    function removeInvestor(string memory _investorName,uint _stationPurchased,  uint _stationCost,uint _fee) public returns(bool flag_) {
        delete _investorName;
        delete _stationPurchased;
        delete _stationCost;
        delete _fee;
     flag_ =true;
        
    }
    
    
    
    
}