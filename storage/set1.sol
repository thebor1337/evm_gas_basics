// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint private myInteger = 0;

    /*
    PUSH 80: 3
    PUSH 40: 3
    MSTORE: 12 (3 opcode + 9 memory expanding)
    PUSH 4: 3
    CALLDATASIZE: 2
    LT: 3
    PUSH [tag] 1: 3
    JUMPI: 10
    PUSH 0: 3
    CALLDATALOAD: 3
    PUSH E0: 3
    SHR: 3
    DUP1: 3
    PUSH FC707130: 3
    EQ: 3
    PUSH [tag] 2: 3
    JUMPI: 10
    tag 1
      JUMPDEST
      PUSH 0
      DUP1
      REVERT
    tag 2
      JUMPDEST: 1
      PUSH [tag] 3: 3
      PUSH 1: 3
      PUSH 0: 3
      SSTORE: 22,100 (2,100 for cold storage access + 20,000 for setting storage from zero to non-zero)
      JUMP: 8
    tag 3
      JUMPDEST: 1
      STOP
    */

    // 43,256
    // 21,000 (remaining 22,256) - transaction processing
    // 22,192 (remaining 64) - opcodes
    // 64 (remaining 0) - selector calldata
    function setToOne() external payable {
        myInteger = 1;
    }
}