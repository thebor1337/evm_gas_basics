// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint256 private var1 = 1;

    // 21,356 (London)
    // 21,064 - transaction + calldata
    // 5,000 - resetting berlinVar1
    // 92 opcodes
    // -4800 refund
    // 21064 + 5000 + 92 = 26,156 => 4,800 / 26,156 = 0.184 < 0.2 => 4,800 just substracted from total transaction cost
    function case0() external payable {
        var1 = 0;
    }

    uint256 private var2 = 1;
    uint256 private var3 = 0;

    // 43,487 (London)
    // 21,064 - transaction + calldata
    // 5,000 - resetting berlinVar2
    // 22,100 - resetting berlinVar3
    // 123 opcodes
    // -4800 refund
    // 21064 + 5000 + 22100 + 123 = 48,287 => 4,800 (refund) / 48,287 = 0.09 < 0.2 => 4,800 just substracted from total transaction cost
    function case1() external payable {
        var2 = 0;
        var3 = 1;
    }

    uint256 private var4 = 1;
    uint256 private var5 = 1;

    // 24,950
    // 21,064 - transaction + calldata
    // 5,000 - resetting berlinVar4
    // 5,000 - resetting berlinVar5
    // 123 opcodes
    // after refund: (21,064 + 5,000 + 5,000 + 123) * 0.8 = 24,950
    // 21,064 + 5000 * 2 + 123 = 31,187 => 4,800 * 2 / 31,187 = 0.307 > 0.2 => total transaction cost multiplied by 0.8
    function case2() external payable {
        var4 = 0;
        var5 = 0;
    }

    // 43,737
    // 21,064 - transaction + calldata
    // 22,100 - storing berlinVar3
    // 5,000 - resetting berlinVar4
    // 5,000 - resetting berlinVar5
    // 173 opcodes
    // -4,800 * 2 - refund
    // 21,064 + 22,100 + 5,000 + 5,000 + 173 = 53,337 => 4,800 * 2 / 53,337 = 0.179 < 0.2 => 4,800 * 2 just substracted from total transaction cost
    function case3() external payable {
        var3 = 1; // dummy operation to increase transaction cost
        var4 = 0;
        var5 = 0;
    }
}