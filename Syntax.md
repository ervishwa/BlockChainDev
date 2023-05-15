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