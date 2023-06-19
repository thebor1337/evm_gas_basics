// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint256[] private myArray;

    function getLength() external view returns(uint256) {
        return myArray.length;
    }

    // 1. empty to [1]
    // 66,385
    // 21,484 - transaction + calldata
    // - 7 non zeros bytes - 112
    // - 93 zeros bytes - 372
    // 22,100 - writing length
    // 22,100 - writing the first element
    // 701 opcodes

    // 1. empty to [1,2]
    // 88,695:
    // 21,624 - transaction + calldata
    // - 124 zeros bytes - 496 gas
    // - 8 non zeros bytes - 128 gas
    // 22,100 - writing length (at myArray.slot)
    // 22,100 - writing first element (at keccak256(myArray.slot) + 0)
    // 22,100 - writing second element (at keccak256(myArray.slot) + 1)
    // 771 opcodes

    // 2. [1,2] to [1,2]
    // 28,995
    // 21,624 - transaction + calldata
    // 2,200 - length cold (cold read + reset the same value)
    // 2,200 - first element cold
    // 2,200 - second element cold
    // 771 opcodes

    // 3. [1,2] to [3,4]
    // 34,595
    // 21,624 - transaction + calldata
    // 2,200 - resetting the length
    // 5,000 - resetting the first element
    // 5,000 - resetting the second element
    // 771 opcodes

    // 4. [2] to [2,3]
    // 51,695
    // 21,624 - transaction + calldata
    // 22,100 - storing the second element
    // 5,000 - resetting the length (2,900 for storing non-zero to non-zero + 2,100 for cold reading before storing)
    // 2,200 - cold read the first element + storing the same value
    // 771 opcodes

    // 5. [2,3] to [2]
    // 19,434 (Berlin)
    // 21,484:
    // 5,000 - resetting the length
    // 2,200 - resetting the first element
    // 5,000 - resetting the second element
    // ~771 opcodes (aprx)
    // refund 15,000 (for setting the second element to zero)

    // 6. [1] to empty
    // 15,985 (Berlin)
    // 21,336 - transaction + calldata
    // - 64 zero bytes - 256
    // - 5 non-zero bytes - 80
    // 5,000 - resetting the length
    // 5,000 - resetting the first element
    // ~701 opcodes (appx)
    // after refund (21336 + 5000 + 5000 + 701) / 2 = 16,018 total
    function set(uint256[] calldata _val) external {
        myArray = _val;
    }

    function getSlotValue(uint slot) external view returns(uint256 value) {
        assembly {
            value := sload(slot)
        }
    }

    function calcArraySlot(uint index) external pure returns(uint256 value) {
        uint slot;
        assembly {
            slot := myArray.slot
        }
        value = uint256(keccak256(abi.encodePacked(slot))) + index;
    }
}