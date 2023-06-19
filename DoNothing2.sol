// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// optimizer: 1000 runs
contract DoNothing {
    // 1. 0x0000000000000000000000000000000000000000000000000000000000000000
    // 21,357
    // 21,000 (remaining 357) - transaction processing
    // 165 (remaining 192) - sum of opcodes + memory expanding
    // 64 (remaining 128) - calldata selector
    // 128 (remaining 0) - bytes32 calldata zeros (4 per byte if zero byte)
    // ===
    // 2. 0x1111111111111111111111111111111111111111111111111111111111111111
    // 21,741
    // 21,000 (remaining 741) - transaction processing
    // 165 (remaining 576) - sum of opcodes + memory expanding
    // 64 (remaining 512) - calldata selector
    // 512 (remaining 0) - bytes32 calldata non zeros (16 per byte if non-zero)
    // ===
    // 3. 0x0000111111111111111111111111111111111111111111111111111111111111
    // 21,717
    // ...
    // 488 -  bytes32 calldata non zeros (30 bytes are non zero, 2 bytes are zero)
    // ===
    // 4. 0x1111111111111111111111111111111111111111111111111111111111110000
    // 21,717
    // ===
    // 5. 0x1111111111000011111111111111111111111111111111111111111111111111
    // 21,717
    function doNothing(bytes32) external payable {}
}