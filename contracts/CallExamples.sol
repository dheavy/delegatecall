// SPDX-License-Identifier: MIT
pragma solidity ^0.4.22;

contract CalledContract {
    event CallEvent(address sender, address origin, address from);

    function calledFunction() public {
        emit CallEvent(msg.sender, tx.origin, this);
    }
}

library CalledLib {
    event CallEvent(address sender, address origin, address  from);

    function calledFunction() public {
        emit CallEvent(msg.sender, tx.origin, this);
    }
}

contract Caller {
    function makeCalls(CalledContract _calledContract) public {
        _calledContract.calledFunction();
        CalledLib.calledFunction();
        require(address(_calledContract).call(bytes4(keccak256("calledFunction()"))));
        require(address(_calledContract).delegatecall(bytes4(keccak256("calledFunction()"))));
    }
}
