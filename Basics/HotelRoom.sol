// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

topics learned(
etherpayment
modifiers
visiblity
events
enums
)

contract HotelRoom{

    event Occupy (address _customer , uint _value);
    
    enum RoomStatus{vacant,Occupied}
    RoomStatus public cuurentStatus;

    address payable  public  owner ;

    constructor(){
        owner = payable(msg.sender);
        cuurentStatus = RoomStatus.vacant;
    }

    modifier  Chqamount(uint _amount){
     require(msg.value >= _amount , "Not sufficent ether") ;
     _;
    }

    modifier  OnlyWhileVacant{
      require(cuurentStatus == RoomStatus.vacant ,"Soory Room is not available !");
      _;
    }


    function  BookHotel() public payable Chqamount(2 ether) OnlyWhileVacant {
      //status
      //amt

     // owner.transfer(msg.value);
    cuurentStatus = RoomStatus.Occupied;

    (bool sent , bytes memory data)  = owner.call{value : msg.value}("");

      require(true);

     

      emit Occupy(msg.sender,msg.value);

    } 
}