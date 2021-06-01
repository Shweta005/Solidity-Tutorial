pragma solidity 0.8.0;

/*contract Enum{
    enum UserRoles{
        USER,ADMIN
    }
    mapping(address=>UserRoles) private _userRoles;
    
    function setUserRole() public{
        _userRoles[msg.sender] = UserRoles.USER;

    }
    
     function setAdminRole() public{
        _userRoles[msg.sender] = UserRoles.ADMIN;

    }
    function getUserRole() public view returns(UserRoles role_)
    
}*/


contract test {
   enum FreshJuiceSize{ SMALL, MEDIUM, LARGE }
   FreshJuiceSize choice;
   FreshJuiceSize constant defaultChoice = FreshJuiceSize.MEDIUM;

   function setLarge() public {
      choice = FreshJuiceSize.LARGE;
   }
     function setSmall() public {
      choice = FreshJuiceSize.SMALL;
   }
     function setMedium() public {
      choice = FreshJuiceSize.MEDIUM;
   }
   function getChoice() public view returns (FreshJuiceSize) {
      return choice;
   }
   function getDefaultChoice() public pure returns (uint) {
      return uint(defaultChoice);
   }
}