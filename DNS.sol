pragma solidity 0.8.0;

contract DNS{
    
  address public user;
    
   constructor(){
       user = msg.sender;
   }
    
    
    struct Company{
          string  compName;
           uint8 estYear;
           string  url;
           string  domainName;
           address compAddress;
    }
    
    Company[] public company;
   function registerCompany( string memory _companyName,,uint8 _age,address _companyAddress, string memory _name) public {
        User memory user = User(_age, _accountAddress, _name);
        users.push(user);
    }
    
    
}