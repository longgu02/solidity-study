// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Conex is ERC20{
    constructor(uint _initialSupply) ERC20("Conex", "CNX"){
        _mint(msg.sender, _initialSupply);
    }
}