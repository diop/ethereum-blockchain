pragma solidity ^0.5.0;

// contract MyContract {
//     address owner;
//     event Withdrawn();

//     constructor() public {
//         initialize();
//     }

//     function initialize() internal {
//         owner = msg.sender;
//     }

//     function withdraw() public {
//         require(msg.sender == owner);
//         msg.sender.transfer(address(this).balance);
//         emit Withdrawn();
//     }
// }