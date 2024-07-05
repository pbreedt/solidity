// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import {ICalc} from "./ICalc.sol";

contract CalcTimesTwo is ICalc {

    address myAddress;

    constructor() {
        myAddress = address(this);
    }

    function doCalc(uint256 input) external pure returns (uint256) {
        uint256 output = input*2;
        return output;
    }
}