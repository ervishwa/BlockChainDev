// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mycontract {
    //state variable 
    //difrnt difrny data types

//     int256 public myInt = 1;
//     uint public myUnit  = 1;
//     uint256 public myUnit256 = 1;
//     uint8 public myUnit8 = 1;

//     string public myString = "kingkong";
//     bytes32 public myBytes32 = "kingKong";


//     //custom data types 

//     struct Mystruct {
//         uint myunit;
//         string mystring;
//     }

//     Mystruct public mystruct  = Mystruct(2,"HELLO GENIOS !");

//     //address public myaddress = 0Xh273y7y32786gr63rt3r3yvr3t;

//    function getvalue() public pure returns(uint){
//        uint value = 1;
//        return value;
//    }


 // Array

//   uint [] public myArray = [1,2,3];

//   string[] public stringArray = ["apple","banana","mango"];

//   string[] public values ;


//   uint256 [][] public my2dArray = [[1,2,3],[4,5,6]];

//   function  addvalue(string memory _value) public{
//        values.push(_value);
//   }

//   function valeCount() public view returns(uint){
//         return values.length;
//   }



//mapping inside solidity..

 //mapping(key => values) mymapping ;

//   mapping(uint => string) public names;
//   mapping(uint => Book) public books ;

//   //nesting mapping 

//   mapping(address => mapping(uint => Book)) public mybooks ;


//   struct Book {
//       string title ;
//       string author;
//   }

//   constructor() {
//      names[1] = "king";
//      names[2] = "kong";
//      names[3] = "queen";
//   }


//   function addBook(uint _id , string memory _title , string memory _author) public{
//         books[_id] = Book(_title,_author);
//   }


//   function addmyBook(uint _id , string memory _title , string memory _author) public {
//         mybooks[msg.sender][_id] = Book(_title,_author);
//   }



 //Conditional
 //Loops


  uint[] public myArray = [1,2,3,4,5,6,7,8,9,10];

  address public owner ;

  constructor(){
      owner = msg.sender;
  }


  function countEven() public view returns(uint){
   uint count = 0 ;

   for(uint i = 0 ; i < myArray.length ; i++){
       if(chqEven(myArray[i])){
           count++;
       }
   }

   return count;
  }

  function chqEven(uint _val) public pure returns(bool){
    if(_val % 2 == 0 ){
        return true;
    }else{
        return false;
    }
  }

  function isOwner() public view returns (bool){  
    return(msg.sender == owner) ;

  }

}