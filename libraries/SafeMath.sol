pragma solidity ^0.7.0;

 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4-solc-0.7/contracts/math/SafeMath.sol";
 
contract Maths{
    
     using SafeMath for uint256;
     uint immutable notToBeAdded; 
     
     constructor (uint _notToBeAdded) {
        notToBeAdded = _notToBeAdded;
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
     
     
     
     
}