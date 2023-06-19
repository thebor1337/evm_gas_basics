// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example1 {
    // f2f1e132 (1st position after sorting selectors)
    // 98
    function green() external pure {}
}

contract Example2 {
    // f2f1e132 (2nd position)
    // 120
    function green() external pure {}

    // ed18f0a7 (1th position)
    // 98
    function blue() external pure {}
}

contract Example3 {
    // f2f1e132 (3rd position)
    // 142
    function green() external pure {}

    // ed18f0a7 (2nd position)
    // 120
    function blue() external pure {}

    // 2930cf24 (1st position)
    // 98
    function red() external pure {}
}

// the lower the position of a selector in the bytecode, the higher execution cost
// 1 position = 22 gas. the position is determined by sorting the function selectors