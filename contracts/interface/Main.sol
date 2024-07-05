// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import {ICalc} from "./ICalc.sol";

contract Main {

    uint256 number;
    ICalc calculator;

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }

    function setCalculator(address adr) public returns (bool) {
        ICalc tmpCalc = ICalc(adr);
        calculator = tmpCalc;
        return true;
    }

    function calculate() public view returns (uint256) {
        return calculator.doCalc(number);
    }
}