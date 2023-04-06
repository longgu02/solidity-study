// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./token/Conex.sol";

contract PaymentProcessor{

    Conex paymentToken;
    address public tokenAddress;

    constructor(address _tokenAddress){
        tokenAddress = _tokenAddress;
        paymentToken = Conex(_tokenAddress);
    }

    function pay(uint amount) public payable{
        // transferFrom(msg.sender, )
    }
}