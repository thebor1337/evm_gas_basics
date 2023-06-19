// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract LessThan {
    // 247
    function lessThan(uint x) external pure returns(bool) {
        return x < 3; // uses single opcode LT
    }
}

contract LessThanEq {
    // 250
    function lessThan(uint x) external pure returns(bool) {
        return x <= 2; // uses multiple opcodes to execute the formula: !(x > 2), becase there's no opcode for the operation lessThanOrEqual
    }
}