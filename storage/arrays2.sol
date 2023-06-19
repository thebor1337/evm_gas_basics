// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    // uint256[] myArray = [1,2,3,4,5,6,7,8,9,10]; // dynamic
    uint256[10] myArray = [1,2,3,4,5,6,7,8,9,10]; // fixed

    // 28,085 when dynamic non cached (sload(length) every loop)
    // 27,090 when dynamic cached
    // 
    // 23,445 when fixed non cached (no sload(length) every loop)
    // 23,450 when fixed cached
    function getSum() external view returns(uint256 sum) {
        // uint _length = myArray.length;
        for (uint i = 0; i < myArray.length; i++) {
        // for (uint i = 0; i < _length; i++) {
            sum += myArray[i];
        }
    } 
}