// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract MemoryExample {
    // execution cost: 559 (copies myBytes from calldata into memory)
    function doNothing(bytes memory myBytes) external pure {}

    // 818
    function returnBytes(bytes memory myBytes) external pure returns(bytes memory) {
        return myBytes;
    }

    // 939
    function returnModifiedBytes(bytes memory myBytes) external pure returns(bytes memory) {
        myBytes[0] = hex"00";
        return myBytes;
    }
}

contract CalldataExample {
    // 413 (no need to copy myBytes into memory)
    function doNothing(bytes calldata myBytes) external pure {}

    // 853
    function returnBytes(bytes calldata myBytes) external pure returns(bytes memory) {
        return myBytes;
    }

    // 965
    function returnModifiedBytes(bytes calldata myBytes) external pure returns(bytes memory) {
        bytes memory _myBytes = myBytes;
        _myBytes[0] = hex"00";
        return _myBytes;
    }
}