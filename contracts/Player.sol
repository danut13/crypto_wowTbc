pragma solidity ^0.8.0;

contract PlayerFactory {
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

    struct AlliancePlayer {
        AllianceRace allianceRace;
        Class class;
        Specialization spec;
        Gender gender;
    }

    struct HordePlayer {
        HordeRace hordeRace;
        Class class;
        Specialization spec;
        Gender gender;
    }

    function _createPlayer() public returns (uint256) {}
}
