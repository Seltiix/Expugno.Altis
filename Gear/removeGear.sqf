private ["_items"];

removeAllWeapons player;

_items = assignedItems player;
if (isNil "_items") exitWith {};
removeAllAssignedItems player;
removeAllItems player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeUniform player;

player addBackpack "B_TacticalPack_blk";
player addItemToBackpack "ItemGPS";
player assignItem "ItemGPS";
player addItemToBackpack "ItemRadio";
player assignItem "ItemRadio";

player addItemToBackpack "ItemMap";
player assignItem "ItemMap";
player addItemToBackpack "ItemCompass";
player assignItem "ItemCompass";
player addItemToBackpack "ItemWatch";
player assignItem "ItemWatch";

removeBackpack player;