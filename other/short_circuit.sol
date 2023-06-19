// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ShortCircuit {
    mapping(address => bool) allowed;

    // check low-cost operations first to save gas when reverted
    function shortCircuit() external {
        require(block.timestamp > 111 || allowed[msg.sender], "invalid");
    }
}