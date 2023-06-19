// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

interface ITarget {
    // 0xee919d50
    function setA(uint256) external;
}

contract CallEncode {
    function testEncode() external pure returns(bytes memory) {
        // 1,122
        // 603 (1000 runs)
        // return abi.encodeWithSelector(0xee919d50, 10);
        // 1,131
        // 603 (1000 runs)
        // return abi.encodeWithSelector(ITarget.setA.selector, 10);
        // 1,122
        // 596 (1000 runs)
        // return abi.encodeWithSignature("setA(uint256)", 10);
        // 1,113
        // 596 (1000 runs)
        // return abi.encodeCall(ITarget.setA, 10);
        // 1,137
        // 572 (1000 runs)
        // return abi.encodePacked(bytes4(0xee919d50), uint256(10));
        // 1,142
        // 572 (1000 runs)
        // return bytes.concat(bytes4(0xee919d50), bytes32(uint256(10)));
    }
}