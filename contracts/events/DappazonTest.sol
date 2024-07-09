// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "./Dappazon.sol";
import "forge-std/Test.sol";

contract DappazonTest is Test {
    event List(string indexed name, uint256 indexed cost, uint256 stock);

    Dappazon dappazon;

    function setUp() public {
        dappazon = new Dappazon();
    }

    function test_List() public {
        vm.expectEmit(true, true, false, false);
        // The event we expect
        // event List(string name, uint256 cost, uint256 stock);
        emit List("name", 2, 4);
        // The event we get
        dappazon.list(1, "name", "category", "image", 2, 3, 4);
    }
}