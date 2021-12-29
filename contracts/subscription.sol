// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract Subscription {
    enum Faction {
        None,
        Alliance,
        Horde
    }
    mapping(address => bool) public subscribers;
    mapping(address => Faction) public playerToFaction;
    address payable internal owner;
    uint256 subscriptionPrice = 2628000 gwei; //10 dollars

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlySubscribers(address player) {
        require(subscribers[player] == true);
        _;
    }

    function _createAccount(Faction _faction) public {
        if (playerToFaction[msg.sender] == Faction.None) {
            playerToFaction[msg.sender] = _faction;
        }
    }

    function _subscribe() external payable {
        require(
            subscribers[msg.sender] == false && msg.value >= subscriptionPrice
        );
        subscribers[msg.sender] = true;
        payable(msg.sender).transfer(msg.value - subscriptionPrice);
    }
}
