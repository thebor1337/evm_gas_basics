// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract Target {
    uint public a = 1;

    function setA(uint value) external {
        a = value;
    }
}

contract Caller1 {
    // 30,818
    // 29,972 (1000 runs)
    function call(address _targetAddr) external {
        (bool ok, ) = _targetAddr.call(abi.encodeWithSelector(0xee919d50, 10));
        require(ok);
    }
}

contract Caller2 {
    // 30,231
    // 29,646 (1000 runs)
    function call(address _targetAddr) external {
        (bool ok, ) = _targetAddr.call(hex"ee919d50000000000000000000000000000000000000000000000000000000000000000a");
        require(ok);
    }
}

contract Caller3 {
    // 30,322
    // 29,711 (1000 runs)
    function call(address _targetAddr) external {
        Target(_targetAddr).setA(10);
    }
}

contract Caller4 {
    // 30,365
    // 29,723 (1000 runs)
    function call(Target _target) external {
        _target.setA(10);
    }
}

contract Caller5 {
    // 30,841
    // 29,966 (1000 runs)
    function call(address _targetAddr) external {
        (bool ok, ) = _targetAddr.call(abi.encodeCall(Target.setA, 10));
        require(ok);
    }
}

contract Caller6 {
    // 30,870
    // 29,933 (1000 runs)
    function call(address _targetAddr) external {
        (bool ok, ) = _targetAddr.call(bytes.concat(bytes4(0xee919d50), bytes32(uint256(10))));
        require(ok);
    }
}