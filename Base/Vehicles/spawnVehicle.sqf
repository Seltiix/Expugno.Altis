private ["_classname","_veh","_nearestTargets","_dir","_spawnPos"];

_classname = _this select 0;
_spawnPad = _this select 1;
//_buyer = _this select 2;
_spawnPos = position _spawnPad;
_dir = getDir _spawnPad;
_nearestTargets = nearestObjects[_spawnPos,["landVehicle","Air","Ship"],10] select 0;
if (!isNil "_nearestTargets") then {
	hint "Not enough space!";
} else {
	_veh = _classname createVehicle position spawnLand;
	_dir = getDir _spawnPad;
	_veh setDir _dir;

	clearBackpackCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearWeaponCargoGlobal _veh;
};