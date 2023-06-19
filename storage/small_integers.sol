// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    
    bool private myBool; // slot #0
    
    uint private myUint; // slot #1

    uint128 private myUint128_1; // slot #2
    uint128 private myUint128_2; // slot #2

    // 43,274
    function setBool() external payable {
        myBool = true;
    }

    // 43,278
    function setUint() external payable {
        myUint = 5;
    }

    /// @dev myUint128_1 and myUint128_2 share the same slot,
    /// so setting slot value from zero to non-zero will charge 20k gas only once,
    /// no matter which storage variable has been setted.
    /// resetting costs the same gas for both variables

    // 43,565 (after deploy)
    // 23,665 (after the second call with the same value)
    // 26,465 (after the second call with another value)
    function setUint128_1(uint128 value) external payable {
        myUint128_1 = value;
    }

    // 43,548 (after deploy)
    // 26,225 (after setUint128_1() processed)
    // 23,648 (afther the second call with the same value)
    // 26,448 (after the second call with another value)
    function setUint128_2(uint128 value) external payable {
        myUint128_2 = value;
    }
}