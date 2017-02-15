hasSFP = false;
hasAFRF = false;

if (isClass(configFile>>"CfgPatches">>"sfp_strv122")) then {
	hasSFP = true;
};

if (isClass(configFile>>"CfgPatches">>"sfp_strv122")) then {
	hasAFRF = true;
};


publicVariable "hasSFP";
publicVariable "hasAFRF";