if (hasSFP) then {
	if (roleDescription player == "Commander") then {
		player addUniform "sfp_m90d_uniform";
		player addHeadgear "sfp_m90d_helmet";
		player addVest "sfp_kroppsskydd12_tl";
	};
	if (roleDescription player == "Rifleman") then {
		player addUniform "sfp_m90d_uniform";
		player addHeadgear "sfp_m90d_helmet";
		player addVest "sfp_kroppsskydd12_tl";
	};
	if (roleDescription player == "Medic") then {
		player addUniform "sfp_m90d_uniform";
		player addHeadgear "sfp_m90d_helmet";
		player addVest "sfp_kroppsskydd12_tl";
	};
} else {
	[] execVM "defaultGear.sqf";
};