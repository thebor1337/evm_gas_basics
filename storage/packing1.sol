// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint128 private a = 1;
    uint128 private b = 2;

    // uint256 private a = 1;
    // uint256 private b = 2;

    // 26,593
    function setA(uint128 value) external {
        a = value;
    }

    // 26,605
    function setB(uint128 value) external {
        b = value;
    }

    // 26,808
    function setAB(uint128 _a, uint128 _b) external {
        a = _a;
        b = _b;
    }

    function getSlotA() external pure returns(uint256 slot) {
        assembly {
            slot := a.slot
        }
    }

    function getSlotB() external pure returns(uint256 slot) {
        assembly {
            slot := b.slot
        }
    }

    function getOffsetA() external pure returns(uint256 offset) {
        assembly {
            offset := a.offset
        }
    }

    function getOffsetB() external pure returns(uint256 offset) {
        assembly {
            offset := b.offset
        }
    }

    function loadSlot(uint256 slot) external view returns(bytes32 value) {
        assembly {
            value := sload(slot)
        }
    }

    // 2,397 when uint128
    // 2,346 when uint256 (no need to perform masking operations when not packed)
    function getA() external view returns(uint128) {
        return a;
    }

    function getB() external view returns(uint128) {
        return b;
    }
}