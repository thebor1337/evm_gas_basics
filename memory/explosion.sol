// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    // 1 - 224
    // 2 - 230 (+6)
    // 3 - 236 (+6) => strong linear
    // 10 - 278
    // 20 - 339 (+61)
    // 30 - 400 (+61) => linear
    // 100 - 839
    // 200 - 1499 (+660)
    // 300 - 2198 (+699) => also linear +-
    // 1000 - 8186
    // 2000 - 20061 (+11875)
    // 3000 - 35843 (+15782) => becoming exponential
    // 10000 - 255686 
    // 20000 - 901780 (+646094)
    // 30000 - 1938499 (+1036719) => strong exponential
    // 100000 - run out of gas
    // formula:
    // memory allocating cost = 3 * num_slots + (num_slots ^ 2) / 512
    function testMemory() external pure {
        uint[3] memory array;
    }

    // 255,686
    function testMemory2() external pure {
        uint[10000] memory array;
    }

    // 258,009
    // it costs about the same amount of gas like direct allocating 10k length array.
    // memory is never deallocated, even if variable that allocated the memory is out of scope already
    function testMemory3() external pure {
        for (uint i = 0; i < 10; i++) {
            allocateMemory();
        }
    }

    function allocateMemory() internal pure {
        uint[1000] memory array;
    }
}