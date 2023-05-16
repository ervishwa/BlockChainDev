custom data types -> 
struct Person {
  uint age;
  string name;
}

// create a New Person:
Person satoshi = Person(172, "Satoshi");

-------

function declarations

function eatHamburgers(string memory _name, uint _amount) public {

}

-------
How to declare the private function ?

uint[] numbers;

function _addToArray(uint _number) private {
  numbers.push(_number);
}


return from function

string greeting = "What's up dog";

function sayHello() public returns (string memory) {
  return greeting;
}

view function....

we could declare it as a view function, meaning it's only viewing the data but not modifying it:

function sayHello() public view returns (string memory) {}

Solidity also contains pure functions, which means you're not even accessing any data in the app. Consider the following:

function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}
This function doesn't even read from the state of the app — its return value depends only on its function parameters. So in this case we would declare the function as pure.

--------------

events 
// declare the event
event IntegersAdded(uint x, uint y, uint result);

function add(uint _x, uint _y) public returns (uint) {
  uint result = _x + _y;
  // fire an event to let the app know the function was called:
  emit IntegersAdded(_x, _y, result);
  return result;
}

-------------

mapping

// For a financial app, storing a uint that holds the user's account balance:
mapping (address => uint) public accountBalance;

// Or could be used to store / lookup usernames based on userId
mapping (uint => string) userIdToName;


-------------

Import 

Importing another contract in your contract

import "./someothercontract.sol";
import "<contract Name>";


-------------
For declaring internal or external functions, the syntax is the same as private and public:

contract Sandwich {
  uint private sandwichesEaten = 0;

  function eat() internal {
    sandwichesEaten++;
  }
}

contract BLT is Sandwich {
  uint private baconSandwichesEaten = 0;

  function eatWithBacon() public returns (string memory) {
    baconSandwichesEaten++;
    // We can call this here because it's internal
    eat();
  }
}

------------
Interacting with other contract 

For our contract to talk to another contract on the blockchain that we don't own, first we need to define an interface.

Let's look at a simple example. Say there was a contract on the blockchain that looked like this:

contract LuckyNumber {
  mapping(address => uint) numbers;

  function setNum(uint _num) public {
    numbers[msg.sender] = _num;
  }

  function getNum(address _myAddress) public view returns (uint) {
    return numbers[_myAddress];
  }
}
This would be a simple contract where anyone could store their lucky number, and it will be associated with their Ethereum address. Then anyone else could look up that person's lucky number using their address.

Now let's say we had an external contract that wanted to read the data in this contract using the getNum function.

First we'd have to define an interface of the LuckyNumber contract:

contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
Notice that this looks like defining a contract, with a few differences. For one, we're only declaring the functions we want to interact with — in this case getNum — and we don't mention any of the other functions or state variables.

So it kind of looks like a contract skeleton. This is how the compiler knows it's an interface.
-------------------

How to interact with interface ..

contract NumberInterface {
  function getNum(address _myAddress) public view returns (uint);
}
We can use it in a contract as follows:

contract MyContract {
  address NumberInterfaceAddress = 0xab38...
  // ^ The address of the FavoriteNumber contract on Ethereum
  NumberInterface numberContract = NumberInterface(NumberInterfaceAddress);
  // Now `numberContract` is pointing to the other contract

  function someFunction() public {
    // Now we can call `getNum` from that contract:
    uint num = numberContract.getNum(msg.sender);
    // ...and do something with `num` here
  }
}
In this way, your contract can interact with any other contract on the Ethereum blockchain, as long they expose those functions as public or external.


------------------

Handling Multiple Return Values !

Example ->

function multipleReturns() internal returns(uint a, uint b, uint c) {
  return (1, 2, 3);
}

function processMultipleReturns() external {
  uint a;
  uint b;
  uint c;
  // This is how you do multiple assignment:
  (a, b, c) = multipleReturns();
}

// Or if we only cared about one of the values:
function getLastReturnValue() external {
  uint c;
  // We can just leave the other fields blank:
  (,,c) = multipleReturns();
}

---------------------