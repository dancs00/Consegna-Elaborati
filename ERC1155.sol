// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.5.0
pragma solidity ^0.8.27;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract MyGameasset is ERC1155, Ownable {

    string public name = "My Game Assets";
    
    uint256 public constant GAMEDESK1 = 1;
    uint256 public constant GAMEDESK2 = 2;
    uint256 public constant GAMEDESK3 = 3;
    uint256 public constant GAMEDESK4 = 4;

    constructor(address initialOwner) ERC1155("https://amaranth-increased-mockingbird-319.mypinata.cloud/ipfs/bafybeidwsdrekupxwlgtujntsv62oo3ii2c25d7uff6qgjn2d4n2a7owz4/{id}.json") Ownable(initialOwner) {
        mint(msg.sender, GAMEDESK1, 1, "");
        mint(msg.sender, GAMEDESK2, 1, "");
        mint(msg.sender, GAMEDESK3, 100, "");
        mint(msg.sender, GAMEDESK4, 100, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
