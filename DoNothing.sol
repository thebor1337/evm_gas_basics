// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// optimizer: 1000 runs
contract DoNothing {

    // 21,138
    // - 21,000 (remaining 138) - transaction processsing
    /*
    PUSH1 80: 3
    PUSH1 40: 3
    MSTORE: 3
    PUSH1 4: 3
    CALLDATASIZE: 2
    LT: 3
    PUSH1 [tag] 1: 3
    JUMPI: 10
    PUSH 0: 3
    CALLDATALOAD: 3
    PUSH1 E0: 3
    SHR: 3
    DUP1: 3
    PUSH2 2F576F20: 3
    EQ: 3
    PUSH1 [tag] 2: 3
    JUMPI: 10
    tag 1
      JUMPDEST
      PUSH 0
      DUP1
      REVERT
    tag 2
      JUMPDEST: 1
      STOP
    */
    // - 65 (remaining 73) - sum of executed opcodes
    // - 9 (remaining 64) - expanding memory (total 3 slots, 0x00-0x20 = 0, 0x20-0x40 = 0, 0x40-0x60=0x80 according to solidity specification)
    // expanding = 3 gas per word (32 bytes)
    // - 64 (remaining 0) - storing calldata (0x2f576f20) into blockchain
    // (4 bytes = 16 * 4, 16 - gas per non-zero calldata byte. if zero byte - 4 gas)
    // *** 3245 - 3171 = 74 (execution cost)
    function doNothing() external payable {

    }
}