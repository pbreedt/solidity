// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Address {

    function getDefaultAddress() public pure returns (address) {
        address something;
        return address(something);
    }

    function getAddress0() public pure returns (address) {
        return address(0);
    }
    
}