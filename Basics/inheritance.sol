// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable{
 address public owner;

   constructor() {
     owner = msg.sender;
    
   }

  modifier  OnlyOwner(){
       require(msg.sender == owner,"user must be owner");
       _;
   }
}

contract SecretVault {
    string secret ;

     constructor(string memory _secretkey) {
     secret = _secretkey ;
   }

   function getsecretkey() public view  returns(string memory){
       return secret;
   }


}

contract MyContract is Ownable {
   address secrevault ;
   constructor(string memory _secretkey) {
     SecretVault _secretvault = new SecretVault(_secretkey);
     secrevault = address(_secretvault);
     super;
   }

  

   function getsecretkey() public view OnlyOwner returns(string memory){
       return SecretVault(secrevault).getsecretkey();
   }

}