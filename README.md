## Programmable Money Meetup January 7th 2019

## Solidity 0.5.0
* The more checks the more expensive
* Balance between cheap smart contracts and safety
* Require explicit visibility
* The contract below has bugs in it. Can you tell what it is?

```
contract MyContract {
    address owner;
    event Withdrawn();

    function MyContract() {
        initialize()
    }

    function initialize() {
        owner = msg.sender;
    }

    function withdraw() {
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
        Withdrawn();
    }
}
```

* Explicit Types
Cannot pass an array with more than 256 elements.
```
contract MyContract {
    function sum(uint[] a) public pure returns (uint s) {
        for (var i = 0; i < a.length; i++)
            s += a[i];
    }
}
```

* Disallow var 
```
contract MyContract {
    function sum(uint[] a) public pure returns (uint s) {
        for (uint i = 0; i < a.length; i++)
            s += a[i];
    }
}
```

* Require data allocation specifier for reference types. 
```
contract MyContract {
    function sum(uint[] memory a) public pure returns (uint s) {
        for (uint i = 0; i < a.length; i++)
            s += a[i];
    }
}
```

* Storage pointers have to be initialized 1
```
contract MyContract {
    struct Data { string name; uint amount; }
    Data[] participants;

    function participate(string name) public {
        Data p;
        p.name = name;
        p.amount = msg.value;
        participants.push(p);
    }
}

* Storage pointers have to be initialized 2
Force ``` p ``` to always have something in it when declared.
```
contract MyContract {
    struct Data { string name; uint amount; }
    Data[] participants;

    function participage(string memory name) public {
        participants.length += 1;
        Data storage p = participants[participants.length - 1];
        p.name = name;
        p.amount = msg.value;
    }
}
```
* Before 0.5.0 Solidity inherited its scoping rules from Javascript.
```
// 0.4.0  - The code below was valid Solidity
contract MyContract {
    function f() pure public returns (uint) {
        i = 3;
        if (false) {
            uint i;
        }
        return i;
    }
}
```
* 0.5.0: Block-scoped variables
```
// 0.5.0 
contract MyContract {
    function f(uint[] memory a, uint[] memory b) pure public returns (uint sum) {
        for (uint i = 0; i < a.length; i++)
            sum += a[i];
        for (uint i = 0; i < b.length; i++)
            sum += b[i];
    }
}
```









