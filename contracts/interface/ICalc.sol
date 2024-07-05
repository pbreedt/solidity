// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


interface ICalc {

    // Emitting events writes to disk which is considered updating state which violates <view/pure> function modifier
    // event Calculated(address indexed calcUsed, uint256 input, uint256 output);

    function doCalc(uint256 input) external pure returns (uint256);

}