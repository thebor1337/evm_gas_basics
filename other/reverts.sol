// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract RevertEarly {
    uint public x;

    // 21,537 spent after revert
    function revertTest(uint i) external {
        require(i < 3, "i must be less than 3");
        x = i;
    }
}

contract RevertLate {
    uint public x;

    // 43,646 spent after revert
    function revertTest(uint i) external {
        x = i;
        require(i < 3, "i must be less than 3");
    }
}