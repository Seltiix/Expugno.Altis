

//	The following are some whitelists for common mods.
//	 They do not necessarily include all items from a mod, but they are a handy starting point.


waitUntil {!isNil {initVarDone}};
waitUntil {initVarDone};
private ["_playerRole"];
// -------------------------------------------------------------------
// 		@SAF
// -------------------------------------------------------------------

_SAF_uniforms = [
	"sfp_m90w_uniform_tshirt", "sfp_m90w_uniform_mp", "sfp_m90w_uniform_folded", "sfp_m90w_uniform_dirty", "sfp_m90w_uniform_ksk90", "sfp_m90p_uniform"

];

_SAF_medic_backpacks = [

	"sfp_backpack_sjvv9"

];

_SAF_backpacks = [
	"sfp_backpack_stridssack08", "sfp_backpack_lk35"
];

_SAF_weapons = [
	"sfp_kpistm45", "sfp_g36c"

];

_SAF_rifleman_launcher = [
	"sfp_grg86"
];

_SAF_magazines = [
	"sfp_36Rnd_9mm_kpistm45","sfp_30Rnd_556x45_Stanag_tracer", "sfp_grg_heat_62_mag", "sfp_grg_he_mag"
];

_SAF_helmets = [
	"sfp_m37w_helmet","sfp_m37w_helmet_dok2"
];

_SAF_weapon_unlock = [
	"sfp_cga5p"
];

_SAF_vests = [
	"sfp_stridsvast2000", "sfp_stridsvast08"
];




// -------------------------------------------------------------------
// 		Blacklists -- exclude certain things that "slip through the cracks"
// -------------------------------------------------------------------

		_blacklistGuns = [
			
		];
		
		_blacklistItems = [
			
		];

		
// -------------------------------------------------------------------
// 		Combine lists
// -------------------------------------------------------------------

_availableGuns 			= [];
_availableRiflemanGuns 	= [];
_availableMagazines 	= [];
_availableAttachments 	= [];
_availableItems 		= [];
_availableUniforms 		= _SAF_uniforms;
_availableVests 		= [];
_availableHeadgear 		= _SAF_helmets;
_availableGoggles  		= [];
_availableBackpacks 	= [];



_availableAttachments = _availableAttachments;

_availableItems = _availableItems;

_availableMagazines = _availableMagazines + _SAF_magazines;

_availableGuns = _availableGuns + _SAF_weapons;

_availableBackpacks = _availableBackpacks + _SAF_backpacks;

_availableRiflemanGuns = _availableRiflemanGuns + _availableGuns + _SAF_rifleman_launcher;

_availableVests = _availableVests + _SAF_vests;


if (isServer) then {

	// Grab the parameter that was passed in. 
	// The box should have "this execVM <scriptname>" in it's init field.
	_box = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	// Check if @XLA_FixedArsenal is loaded
	 if (isnil "XLA_fnc_addVirtualItemCargo") then {

	 	hint "@XLA_FixedArsenal not found.";

	} else {
	
	if(hasSFP) then {
	
	_playerRole = roleDescription player;
	
	
	if(_playerRole == "Medic") then {
	
		[_box, (_SAF_medic_backpacks),true,false] call XLA_fnc_addVirtualBackpackCargo;
		[_box, (_availableGuns),true,false] call XLA_fnc_addVirtualWeaponCargo;	
		hint "You are playing as a medic";
	
	};
	
	if(_playerRole == "Rifleman") then {
	
		[_box, (_availableBackpacks),true,false] call XLA_fnc_addVirtualBackpackCargo;
		[_box, (_availableRiflemanGuns),true,false] call XLA_fnc_addVirtualWeaponCargo;	
		hint "You are playing as a rifleman";
	};
	
	if(_playerRole == "Commander") then {
	
		[_box, (_availableBackpacks),true,false] call XLA_fnc_addVirtualBackpackCargo;
		[_box, (_availableGuns),true,false] call XLA_fnc_addVirtualWeaponCargo;	
		hint "You are playing as the commander";
	};
	
	
	[_box, (_availableMagazines),true,false] call XLA_fnc_addVirtualMagazineCargo;
	[_box, (_availableUniforms + _availableHeadgear + _availableVests),true,false] call XLA_fnc_addVirtualItemCargo;
		

	}else{
		
		hint "SFP not Found";
	};
		

		// Start the arsenal on it
		_addActionText = "<t color='#45B6EA'>Open Armoury (CUSTOM)";
		["AmmoboxInit",[_box,false,{true},_addActionText,false]] spawn XLA_fnc_arsenal;



	};
};