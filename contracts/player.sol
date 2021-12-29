// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "./subscription.sol";

contract PlayerFactory is Subscription {
    enum AllianceRace {
        Human,
        Nightelf,
        Gnome,
        Dwarf,
        Dranei
    }
    enum HordeRace {
        Orc,
        Tauren,
        Trolls,
        Undead,
        Bloodelf
    }
    enum Class {
        Druid,
        Hunter,
        Mage,
        Pladain,
        Priest,
        Rogue,
        Shaman,
        Warlock,
        Warrior
    }
    enum Specialization {
        Tank,
        Dps,
        Healer
    }
    enum Gender {
        Male,
        Female
    }

    mapping(address => AllianceCharacter[]) public alliancePlayerToCharacters;
    mapping(address => HordeCharacter[]) public hordePlayerToCharacters;

    struct AllianceCharacter {
        AllianceRace allianceRace;
        Class class;
        Specialization spec;
        Gender gender;
    }

    struct HordeCharacter {
        HordeRace hordeRace;
        Class class;
        Specialization spec;
        Gender gender;
    }

    modifier onlyHorde(address player) {
        require(playerToFaction[player] == Faction.Horde);
        _;
    }

    modifier onlyAlliance(address player) {
        require(playerToFaction[player] == Faction.Alliance);
        _;
    }

    function _createAllianceCharacter(
        AllianceRace _race,
        Class _class,
        Specialization _spec,
        Gender _gender
    ) external onlySubscribers(msg.sender) onlyAlliance(msg.sender) {
        alliancePlayerToCharacters[msg.sender].push(
            AllianceCharacter(_race, _class, _spec, _gender)
        );
    }

    function _createHordeCharacter(
        HordeRace _race,
        Class _class,
        Specialization _spec,
        Gender _gender
    ) external onlySubscribers(msg.sender) onlyHorde(msg.sender) {
        hordePlayerToCharacters[msg.sender].push(
            HordeCharacter(_race, _class, _spec, _gender)
        );
    }

    function viewAllianceCharsOfPlayer()
        external
        view
        onlyAlliance(msg.sender)
        onlySubscribers(msg.sender)
        returns (AllianceCharacter[] memory)
    {
        return alliancePlayerToCharacters[msg.sender];
    }

    function viewHordeCharsOfPlayer()
        external
        view
        onlyHorde(msg.sender)
        onlySubscribers(msg.sender)
        returns (HordeCharacter[] memory)
    {
        return hordePlayerToCharacters[msg.sender];
    }
}
