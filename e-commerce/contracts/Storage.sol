// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract Storage {
    struct item {
        uint id;
        string name;
        uint256 quantity;
        uint256 price;
    }

    // mapping(uint256 => item) public itemStorage;
    item[] itemStorage = new item[](100);
    address public admin;

    event newItemAdded(uint itemId, address adder, string name, uint date);
    event itemRemoved(uint itemId, address remover, string name, uint date);

    constructor() {
        admin = msg.sender;
    }

    function add(item memory newItem) public {
        require(msg.sender == admin, "Only admin can add new items");
        itemStorage.push(newItem);
        emit newItemAdded(
            newItem.id,
            msg.sender,
            newItem.name,
            block.timestamp
        );
    }

    function remove(uint itemId) public returns (bool) {
        require(msg.sender == admin, "Only admin can remove items");
        // console.log("length" ,itemStorage[0].name);
        // console.log("item", itemStorage[0]);
        for (uint i = 0; i < itemStorage.length; i++) {
            if (itemStorage[i].id == itemId) {
                if (i > 0) {
                    itemStorage[i] = itemStorage[itemStorage.length - 1];
                }
                console.log(itemStorage[i].name);
                itemStorage.pop();
                emit itemRemoved(
                    itemId,
                    msg.sender,
                    itemStorage[itemId].name,
                    block.timestamp
                );
                return true;
            }
        }
        return false;
    }

    function getItem(uint itemId)
        public
        view
        returns (
            string memory,
            uint,
            uint
        )
    {
        item memory matchItem;
        for (uint i = 0; i < itemStorage.length; i++) {
            if (itemStorage[i].id == itemId) {
                matchItem = itemStorage[i];
            }
        }
        require(matchItem.price > 0, "No such item");
        return (matchItem.name, matchItem.price, matchItem.quantity);
    }

    function changeAdmin(address newAdmin) public returns (bool) {
        require(msg.sender == admin, "Only admin can modify roles");
        admin = newAdmin;
        return true;
    }
}
