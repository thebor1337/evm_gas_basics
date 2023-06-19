// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Regular {

    // 265
    function multiplyBy2(uint n) external pure returns(uint) {
        unchecked {
            return n * 2;
        }
    }

    // 246
    function divideBy2(uint n) external pure returns(uint) {
        unchecked {
            return n / 2;
        }
    }
}

contract Shifting {

    // 263
    function multiplyBy2(uint n) external pure returns(uint) {
        return n << 1;
    } 

    // 241
    function divideBy2(uint n) external pure returns(uint) {
        return n >> 1;
    }
}