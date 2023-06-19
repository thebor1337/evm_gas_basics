// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint private myUint;

    function set(uint value) external {
        uint _myUint = myUint;
        require(_myUint != 100);
        
        // 1. Explicit setting the unchaged value (shouldn't be accessed before writing, but accessed above for fair gas estimating)
        // 23,637
        myUint = value;

        // 2. Store the value only when it's changed (should be accessed before writing)
        // 23,559 (cheaper)
        if (_myUint != value) {
            myUint = value;
        }
    }
}