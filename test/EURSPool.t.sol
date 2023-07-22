// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "./interface/EURSPool.sol";
import "forge-std/Test.sol";

contract EURSPoolTest is Test {
    EURSPool pool;

    function setUp() public {
        vm.createSelectFork("mainnet", 17_750_474);
        pool = EURSPool(0x0Ce6a5fF5217e38315f87032CF90686C96627CAA);
    }

    function testGetter() public view {
        console.log("-----------------------------------------------------");
        console.log("Getting Pool Info");
        console.log("Getting array of swappable coins within the pool ");
        console.log("Pool 1 token address ", pool.coins(0));
        console.log("Pool 2 token address ", pool.coins(1));
        console.log("Getter for the pool balances array. ");
        console.log("Pool 1 token balances", pool.balances(0));
        console.log("Pool 2 token balances", pool.balances(1));
        console.log("Getter for the admin/owner of the pool");
        console.log("Pool admin address", pool.owner());
        console.log("Getter for the LP token of the pool");
        console.log("Pool LP token address", pool.lp_token());
        console.log("The amplification coefficient of the pool");
        console.log("Pool A value", pool.A());
        console.log("The amplification coefficient of the pool not scalled by A_PRECISION");
        console.log("Pool A value", pool.A_precise());
    }

    function testGetter1() public view {
        console.log("-----------------------------------------------------");
        console.log(
            "The current price of the pool LP token relative to the underlying pool assets given as an integer with 1e18 precison"
        );
        console.log("Pool virtual price", pool.get_virtual_price());
        console.log("The current fee of the pool");
        console.log("Pool fee", pool.fee());
        console.log("The current admin fee of the pool");
        console.log("Pool admin fee", pool.admin_fee());
        console.log("The current future fee of the pool");
        console.log("Pool future fee", pool.future_fee());
    }
}
