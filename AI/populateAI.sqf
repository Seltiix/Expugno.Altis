private ["_area","_unit1","_Group","_unit2","_leader","_availableResources","_areaXZ","_areaX","_areaZ","_areaSize","_size", "_areaSize","_grp"];

_area = _this select 0;
_availableResources = _this select 1;
_areaXZ = getMarkerSize _area;
_areaX = _areaXZ select 0;
_areaZ = _areaXZ select 1;
_areaSize = round((_areaX * _areaZ)/10000);
_size = 0;


if (_availableResources >= 10000) then {
	_size = 10;
};
if (_availableResources >= 9000) then {
	_size = 9;
};
if (_availableResources >= 8000) then {
	_size = 8;
};
if (_availableResources >= 7000) then {
	_size = 7;
};
if (_availableResources >= 6000) then {
	_size = 6;
};
if (_availableResources >= 5000) then {
	_size = 5;
};
if (_availableResources >= 4000) then {
	_size = 4;
};
if (_availableResources >= 3000) then {
	_size = 3;
};
if (_availableResources >= 2000) then {
	_size = 2;
} else 
{
	_size = 1;
};

_grp = createGroup east; 
_leader = "rhs_msv_emr_sergeant" createunit [getmarkerpos _area, _grp, "nul=[this,""OrinoArea"",""nowait"",""nofollow"",""random""] execVM ""AI\ups.sqf""", 1 ,"Lieutenant"];
_unit1 = "rhs_msv_emr_rifleman" createunit [getmarkerpos _area, _grp, "", 1 ,"Private"];
_unit2 = "rhs_msv_emr_rifleman" createunit [getmarkerpos _area, _grp, "", 1 ,"Private"];

_Group = Group leader _grp;

//for "_i" from 1 to _areaSize do {
	//nul=[this,"OrinoArea"] execVM "AI\ups.sqf"
//}