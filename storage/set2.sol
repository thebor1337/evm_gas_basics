// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Example {
    uint private myInteger = 0;

    // after deploy: 43,300
    // 2,100 - cold storage access
    // 20,000 - set storage from zero to non-zero
    function setToOne() external payable {
        myInteger = 1;
    }

    // after deploy: 43,279
    // 2,100 - cold storage access
    // 20,000 - set storage from zero to non-zero
    // ===
    // after setToOne(): 26,179
    // 2,100 - cold storage access
    // 5,000 - setting from non-zero to non-zero
    function setToTwo() external payable {
        myInteger = 2;
    }

    // after deploy: 23,422
    // after setToOne(): 21,422 (from non-zero to zero - refund)
    function setToZero() external payable {
        myInteger = 0;
    }

    // after deploy: 2,268
    // after setToOne(): 2,268 (doesn't matter)
    function getInteger() external view returns(uint) {
        return myInteger;
    }

    // after deploy: 43,397
    // after setToOne(): 26,297
    // P.S. - extra 100 gas for warm access
    function getAndSetInteer() external {
        uint _myInteger = myInteger;
        myInteger = _myInteger + 1;
    }
}