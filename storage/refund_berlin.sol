// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint256 private berlinVar1 = 1;

    // 13,078 (berlin)
    // 21,064 - transaction + calldata
    // 5,000 - setting storage variable
    // 92 opcodes
    // after refund: (21,064 + 5,000 + 92) / 2 = 13,078 in total
    // p.s. - the formula is different because total transaction's gas is less than 30k
    function case0Berlin() external payable {
        berlinVar1 = 0;
    }

    uint256 private berlinVar2 = 1;
    uint256 private berlinVar3 = 0;

    // 33,287 (berlin)
    // 21,064 - transaction + calldata
    // 5,000 - setting berlinVar2
    // 22,100 - setting berlinVar3
    // 123 opcodes
    // -15,000 - refund
    function case1Berlin() external payable {
        berlinVar2 = 0;
        berlinVar3 = 1;
    }
}