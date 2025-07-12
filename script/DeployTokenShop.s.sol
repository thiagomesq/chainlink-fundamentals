// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import { Script } from "forge-std/Script.sol";
import { MyERC20 } from "src/MyERC20.sol";
import { TokenShop } from "src/TokenShop.sol";
import { DevOpsTools } from "foundry-devops/src/DevOpsTools.sol";

contract DeployTokenShop is Script {
    function run() external returns (TokenShop) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MyERC20", block.chainid);
        vm.startBroadcast();
        TokenShop tokenShop = new TokenShop(mostRecentlyDeployed);
        MyERC20(mostRecentlyDeployed).grantRole(MyERC20(mostRecentlyDeployed).MINTER_ROLE(), address(tokenShop));
        vm.stopBroadcast();
        return tokenShop;
    }
}