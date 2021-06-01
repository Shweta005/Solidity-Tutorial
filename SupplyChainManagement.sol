pragma solidity 0.8.0;

contract SupplyChain{
   enum Role{ USER ,ADMIN }
    enum ProductState{ ORDERED , DISPATCH , ISTRANSIT , DELIVERED }
    
    Role role;
 
    struct Product{
        uint pId;
        string pName;
        bool status;
        }
        uint256 public pcount;
        
          mapping(address=>Role) private _Roles;
          mapping(uint => Product) public product;
          
          
            /* function setUser() public {
      role = Role.USER;
   }
     function setAdmin() public {
      role = Role.ADMIN;
   }
   function getChoice() public view returns (Role) {
      return role;
   }*/
          
       
        
   
        
         function setRole(Role _role)  public  {
            _Roles[msg.sender] = _role;
            
        }
        function getCurruntRole() public view returns(Role _role) {
            _role = _Roles[msg.sender];
        }
        function placedOrder( string memory _pName) public returns(ProductState){
            Product memory prod;
            product[pcount] = 
            prod.pName = _pName;
        }
        
        
    
    
    
    
}