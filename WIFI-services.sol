pragma solidity 0.8.2;

contract WiFiServices{
    
    enum  RouterCompany{TPlink , Monster , Tenda}
    enum Speed{ThreeMbps, FiveMbps, TenMbps }
//state variables
      string public ownerName;
      address public ownerAddress;
      uint public userCount;
     
      //buyer's info
      struct User{
          string userName;
          uint contact;
          
      }
      
      //Routers Info
      struct Router{
          string  routerId;
          RouterCompany routerComp;
          uint rPrice;
           }
           
         //Internet Speed, Price  
      struct Packs{
          uint connId;
          Speed speed;
          uint pPrice;
      }
      
      mapping(address=>User) public users;
      mapping(uint=>address) public aowner;
      mapping(string=>address)public rowner;
      mapping(RouterCompany => uint) public RouterPrice;
      mapping(string=>Router) public routers;
      mapping(uint =>Packs)public SpeedPack;
      mapping(Speed=>uint) public SpeedPrice;
      mapping(address => bool) public isUser;
      
      constructor (string memory  _ownerName){
          ownerAddress = msg.sender;
          ownerName = _ownerName;
      }
      
      //want to allow each user from different address (allowing only different from owner address)
    modifier userWithDiffAddress(){
          require(msg.sender != ownerAddress, "EVStations: Try different address");
        _;
      }
      
      //Registering User
      function registerUser(string memory _userName,uint _contact) public userWithDiffAddress {
           isUser[msg.sender] = true;
          User memory user = User(_userName,_contact);
           users[msg.sender] = user;
           userCount++;
      }
      
      function countUser() private view returns(uint){
          return userCount;
      }
      
      //Setting price for Router( only owner)
        modifier onlyOwner(string memory _routerId) {
        require( rowner[_routerId] == msg.sender, "EVStations: You are not the  owner" );
        _;
    }
    
    function setPriceOfRouter(string memory _routerId,uint _rprice) public onlyOwner(_routerId){
       routers[_routerId].rPrice = _rprice;
    }
    
    //setting price of speed
    modifier onlyOwnerforSpeed(uint _connId) {
        require( aowner[_connId] == msg.sender, "EVStations: You are not the  owner" );
        _;
    }
    
    function setPriceOfPack(uint _connId,uint _pPrice) public onlyOwnerforSpeed(_connId){
       SpeedPack[_connId].pPrice = _pPrice;
    }
    
    //Buying Routers & Net Packs
      modifier onlyUser() {
        require( isUser[msg.sender] , "EVStations: you are not registered as an User" );
        _;
    }
    function buyRouter(RouterCompany _comp)public onlyUser payable{
        require( RouterPrice[_comp] == msg.value, "EVStations: please send correct amount" );
    }
    
}