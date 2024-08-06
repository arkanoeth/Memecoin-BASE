// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Memecoin.sol";
import "../src/Staking.sol";

contract DeployMemecoinAndStaking is Script {
    function run() external {
        string memory privateKeyStr = vm.envString("PRIVATE_KEY");
        uint256 deployerPrivateKey = vm.parseUint(privateKeyStr);
        vm.startBroadcast(deployerPrivateKey);

        // Deploy Memecoin
        string memory metadataURI = "ipfs://Qm...";  // Replace with the actual IPFS hash or URI
        Memecoin memecoin = new Memecoin(msg.sender, metadataURI);
        console.log("Memecoin deployed to:", address(memecoin));

        // Deploy Staking contract
        Staking staking = new Staking(msg.sender, address(memecoin), address(memecoin));
        console.log("Staking contract deployed to:", address(staking));

        vm.stopBroadcast();
    }
}
