pragma solidity 0.8.0;

// Main Contract - Controller
// Storage Contract - Storage

// User Database - Name, Age 
// Events New user and New Admin

// At Storage - Only State Variables and Getter and Setters
            // Only accessed by controller 

// At Controller - Anyone can register
                    // Only admin can deploy new storage contract 
                    // and update storage conract


/*contract Role{
    enum Urole{ NONE, USER , ADMIN }
      Urole public role;
    mapping(address=> Role) public urole;
    modifier onlyAdmin(){
           require(urole[msg.sender] != Urole.USER, "Cannot be Admin");
           _;
       }
       modifier onlyUser(){
           require(urole[msg.sender] != Urole.ADMIN, "You are Admin");
           _;
       }
       
       function setUser() onlyUser  public {
           urole[msg.sender] = Urole.USER;
       }
       
        function setAdmin() onlyAdmin public {
           urole[msg.sender] = Urole.ADMIN;
       }
    
    
}*/




//Parent contract
contract Storage{
    
    //state variable
    struct Data{
    uint256   id;
    string    Name;
    uint256   Age;
    }
    
    uint256 counter;
    mapping(uint=>Data) public udata;
   
   function getData(string memory _name,uint256 _age) public {
        counter++;
        Data memory data;
        data.id= counter;
       data.Name = _name;
        data.Age = _age;
        udata[counter] = data;
        
    }
    
    
    
}

//Child contract
contract Controller {
    
    Storage public store;
    
    
    function deployStorage() public returns(address) {
        store = new Storage();
       return address(store);
    }
    
    function register(string memory name,uint256 age) public {
     store.getData(name,age);
    }
    
   
    
}