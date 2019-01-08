pragma solidity ^0.5.0;

contract MeetupContract {
    string message;

    constructor() public {
        message = "newMessage";
    }

    function get() public view returns(string memory) {
        return message;
    }

    function set(string memory _message) public {
        message = _message;
    }
}