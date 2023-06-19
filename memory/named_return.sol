// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example1 {
    // 2,133
    function test() external pure returns(uint) {
        uint sum;
        for (uint i = 0; i < 10; i++) {
            sum += i;
        }
        return sum;
    }
}

contract Example2 {
    // 2,125
    function test() external pure returns(uint sum) {
        for (uint i = 0; i < 10; i++) {
            sum += i;
        }
    }
}