// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

error Memecoin__TransferFromZeroAddress();
error Memecoin__TransferToZeroAddress();
error Memecoin__InsufficientBalance();
error Memecoin__InsufficientAllowance();

contract Memecoin is ERC20, Ownable {
    string public constant SYMBOL = "MEME";
    string public constant NAME = "Memecoin";
    uint256 public constant DECIMALS = 18;
    uint256 private constant TOTAL_SUPPLY = 1000000 * (10 ** DECIMALS); // 1 million MEME with 18 decimals
    string private _metadataURI;

    // Constructor
    constructor(address initialOwner, string memory metadataURI) ERC20(NAME, SYMBOL) Ownable(initialOwner) {
        _metadataURI = metadataURI;
        _transferOwnership(initialOwner);
        _mint(initialOwner, TOTAL_SUPPLY);
    }

    // Get metadata URI
    function GetMetadataURI() public view returns (string memory) {
        return _metadataURI;
    }

    // Set new metadata URI
    function setMetadataURI(string memory newMetadataURI) public onlyOwner {
        _metadataURI = newMetadataURI;
    }

    // Mint new tokens
    function mint(address to, uint256 value) public onlyOwner {
        require(to != address(0), "Memecoin: mint to the zero address");
        _mint(to, value);
    }

    // Renounce ownership
    function renounceOwnership() public override onlyOwner {
        emit OwnershipTransferred(owner(), address(0));
        _transferOwnership(address(0));
    }
}
