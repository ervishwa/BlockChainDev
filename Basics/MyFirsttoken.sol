// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract KingKong is ERC20("King Token","KT") {

    address owner ;

    constructor(){
        owner = msg.sender;
    }
    
    modifier IsOwner{
      require(msg.sender == owner ,"must be called by owner");
      _;
    }

    function mintFifty() public IsOwner {
        _mint(msg.sender, 90 ether);
        //same as _mint(msg.sender , 90 * 10 ** 18);
    }
 
}