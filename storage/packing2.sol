// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract ExamplePacked {

    // 1 slot for both
    struct Stake {
        uint128 amount;
        uint128 timestamp;
    }

    mapping(address => Stake) stakeInfo;

    // 43,726 when initailizing
    // 26,626 when resetting
    function setStake(uint128 amount) external {
        stakeInfo[msg.sender] = Stake({
            amount: amount,
            timestamp: uint128(block.timestamp)
        });
    }
}

contract ExampleNonPacked {

    // 2 slots
    struct Stake {
        uint256 amount;
        uint256 timestamp;
    }

    mapping(address => Stake) stakeInfo;

    // 65,757 when initializing
    // 36,291 when resetting
    function setStake(uint amount) external {
        stakeInfo[msg.sender] = Stake({
            amount: amount,
            timestamp: block.timestamp
        });
    }
}