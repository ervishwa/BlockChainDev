// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//import the standard implementaion of ERC721
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

//contract NFTee is an ERC721 contract.

contract NFTee is ERC721 {

 //create an ERC721 contract 
 //mint some NFTs for my self.

   constructor() ERC721("NFTee", "PVT"){
      _mint(msg.sender,1);
   }

}


