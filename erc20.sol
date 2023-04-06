// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Chava2 is SafeERC20 { }

contract Chava is ERC20 {

    constructor(uint _initialSupply) ERC20Detailed("Chava", "CHV"){
        _totalSupply = _initialSupply;
        _mint(msg.sender, initialSupply);
    }

}