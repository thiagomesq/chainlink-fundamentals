// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

import { Script } from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import { MyERC20 } from "src/MyERC20.sol";
import { TokenShop } from "src/TokenShop.sol";

contract MintMyERC20 is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("MyERC20", block.chainid);
        vm.startBroadcast();
        MyERC20(mostRecentlyDeployed).mint(msg.sender, 100 ether);
        vm.stopBroadcast();
    }
}

contract CheckTokenShopHasRole is Script {
    function run() external returns (bool) {
        address mostRecentlyDeployedToken = DevOpsTools.get_most_recent_deployment("MyERC20", block.chainid);
        address mostRecentlyDeployedTokenShop = DevOpsTools.get_most_recent_deployment("TokenShop", block.chainid);
        vm.startBroadcast();
        bool hasRole = MyERC20(mostRecentlyDeployedToken).hasRole(MyERC20(mostRecentlyDeployedToken).MINTER_ROLE(), mostRecentlyDeployedTokenShop);
        vm.stopBroadcast();
        return hasRole;
    }
}

contract MintMyERC20WithTokenShop is Script {
    function run() external returns (bool) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("TokenShop", block.chainid);
        vm.startBroadcast();
        (bool success, ) = payable(mostRecentlyDeployed).call{value: 0.1 ether}("");
        vm.stopBroadcast();
        return success;
    }
}

contract WithdrawMyERC20 is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("TokenShop", block.chainid);
        vm.startBroadcast();
        TokenShop(payable(mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
    }
}