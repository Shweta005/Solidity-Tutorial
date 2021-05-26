pragma solidity 0.6.0;

contract Art_Auction{
    
    //Owners Deatils
         address public ownerAddress;
         string public ownerName;
         string public owner_Art;
         uint public artPrice;
         uint public auctCount;
         address payable public  beneficiary;
         uint public aucEnd;
          uint  aucStart;
         address public highestBidder;
         uint public highestBid;
        
         // uint sellerCommision = 5;
      
       

     constructor (string memory _ownerName , string memory _ownerArt , uint _artPrice) public {
        ownerAddress = msg.sender;
        ownerName = _ownerName;
        owner_Art = _ownerArt;
        artPrice = _artPrice;
       
        }
           mapping(address => bool) public isOwner;
          
           
        
         
          modifier onlyOwner() {
         require(msg.sender != ownerAddress, "You are using Owner's Address,Try different");
        _;
    }
      mapping(address => Auctioneer) public auctioneer;
       mapping(address => bool) public isAuctioneer;
           
             struct Auctioneer{
       
        string auctName;
        uint auctprice;
         }
         address auctAdd;
           modifier uniAuct() {
             require(isAuctioneer[msg.sender] == false, "Try different address");
             _;
         }
         
           function registerAsAuctioneer(string memory _auctName) public onlyOwner uniAuct{
        isAuctioneer[msg.sender] = true;
                auctAdd = msg.sender;
        Auctioneer memory auctioner =  Auctioneer( _auctName, 0);
         auctioneer[msg.sender] = auctioner;
         auctCount++;
    }
    
      mapping(address => uint) public userBidValue;
      
     function bid() public payable {
        require(block.timestamp <= aucEnd,"Auction already ended.");
        require(msg.value + userBidValue[msg.sender] > highestBid,"There already is a higher bid. Bid higher!!");
        userBidValue[msg.sender] += msg.value;
        highestBidder = msg.sender;
        highestBid = userBidValue[msg.sender];
        
    }
         bool public auctionStatus;
       
       function withdraw() public returns (bool)   {

        require(userBidValue[msg.sender] > 0, "nothing to withdraw");
        require(auctionStatus, "auctionEnd has already been called.");

        uint  amount = userBidValue[msg.sender];
        userBidValue[msg.sender] = 0;
            if (!msg.sender.send(amount)) {
                userBidValue[msg.sender] = amount;
                return false;
            }
        
        return true;
    }
       function auctionEnd() public {
        require(block.timestamp >= aucEnd);
        
        auctionStatus = true;

        require(beneficiary.send(highestBid));
        userBidValue[highestBidder] = 0;
       

    }

    
    //Seller Deatils
     /*struct Seller{
          //uint sellerId;
        string  sellerName;
         string artpiece;
          uint price;
      }*/
         /* mapping(address => Seller) public artSeller;
       mapping(address => bool) public isSeller;
       
      function registerAsSeller(string memory _sellerName) public onlyOwner{
           isSeller[msg.sender] = true;
          
        Seller memory seller =   Seller( _sellerName);
         artSeller[msg.sender] = seller;
        
       
      }*/
     
     
      
      
      
     
      
      
    
  
    
    
    
}

       
    