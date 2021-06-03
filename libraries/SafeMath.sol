pragma solidity ^0.7.0;

 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4-solc-0.7/contracts/math/SafeMath.sol";
 
contract Maths{
    
     using SafeMath for uint256;
     uint immutable notToBeAdded; //multiple of 5
     address Owner;
     constructor (uint _notToBeAdded , address _address) {
        notToBeAdded = _notToBeAdded;
        Owner = _address;
    }
    
     
    /*function destroy(address _receiver) external {
        if(address(this).balance > 15 ether){
        selfdestruct(payable(_receiver));
        }
    }*/
    
    
     
     function forLoop(uint _num) public view returns(uint){
        uint sum;
        for(uint i; i<_num; i++){
            if(i%notToBeAdded == 0){
                continue;
            }
            sum += i;
        }
        return sum;
    }
     
     
     function Add(uint256 a, uint256 b) public pure returns(bool, uint256){
         return a.tryAdd(b);
         
     }
     
      function Sub(uint256 a, uint256 b) public pure returns(bool, uint256){
         return a.trySub(b);
         
     }
     
      function Mul(uint256 a, uint256 b) public pure returns(bool, uint256){
         return a.tryMul(b);
         
     }
     
      function Div(uint256 a, uint256 b) public pure returns(bool, uint256){
         return a.tryDiv(b);
         
     }
     
     //It destroy's contract when contract bal > 15 ether
     receive() external payable{
        require(msg.value%(1 ether) == 0 , "Only in whole numbers");
        if(address(this).balance > (15 * 1 ether)){
        selfdestruct(payable(Owner));
     }
    
     
     
}
} 
