// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Memecoin.sol";

contract DeployMemecoin is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        string memory metadataURI = "ipfs://Qm...";  // Replace with the actual IPFS hash or URI
        Memecoin memecoin = new Memecoin(msg.sender, metadataURI);

        console.log("Memecoin deployed to:", address(memecoin));

        vm.stopBroadcast();
    }
}
